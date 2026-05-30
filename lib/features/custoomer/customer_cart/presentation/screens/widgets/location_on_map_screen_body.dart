import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/location_on_map_header.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/location_on_map_map_section.dart';
import 'package:waterrush/features/custoomer/customer_cart/presentation/screens/widgets/location_on_map_selected_address_view.dart';
import 'package:flutter_map/flutter_map.dart';

class LocationOnMapScreenBody extends StatefulWidget {
  const LocationOnMapScreenBody({super.key, this.initialSelection});

  final Map<String, dynamic>? initialSelection;

  @override
  State<LocationOnMapScreenBody> createState() =>
      _LocationOnMapScreenBodyState();
}

class _LocationOnMapScreenBodyState extends State<LocationOnMapScreenBody> {
  final MapController _mapController = MapController();
  final LatLng _fallbackLocation = const LatLng(30.0444, 31.2357);

  LatLng? _selectedLocation;
  String? _selectedAddress;
  bool _isFetchingLocation = true;
  bool _isFetchingAddress = false;

  @override
  void initState() {
    super.initState();
    _initializeMapSelection();
  }

  void _initializeMapSelection() {
    final Map<String, dynamic>? normalizedSelection =
        Helpers.normalizeMapSelectionResult(widget.initialSelection);

    if (normalizedSelection == null) {
      _initializeLocation();
      return;
    }

    final LatLng initialLocation = LatLng(
      normalizedSelection['latitude'] as double,
      normalizedSelection['longitude'] as double,
    );

    final String? initialAddress = normalizedSelection['address'] as String?;

    setState(() {
      _selectedLocation = initialLocation;
      _selectedAddress = initialAddress;
      _isFetchingLocation = false;
    });

    Helpers.moveMapControllerSafely(
      mapController: _mapController,
      location: initialLocation,
    );
  }

  Future<void> _initializeLocation() async {
    setState(() {
      _isFetchingLocation = true;
    });

    final LatLng? previousLocation = _selectedLocation;
    final LatLng? currentLocation = await Helpers.resolveCurrentMapLocation();
    final LatLng initialLocation = currentLocation ?? _fallbackLocation;

    if (!mounted) return;

    if (currentLocation == null && previousLocation == null) {
      Helpers.showErrorSnack(
        context: context,
        message:
            'Unable to fetch device location. Please enable location access.',
      );
    }

    setState(() {
      _selectedLocation = initialLocation;
      _isFetchingLocation = false;
    });

    Helpers.moveMapControllerSafely(
      mapController: _mapController,
      location: initialLocation,
    );
    await _resolveAddressForSelectedLocation(initialLocation);
  }

  Future<void> _resolveAddressForSelectedLocation(LatLng location) async {
    setState(() {
      _isFetchingAddress = true;
    });

    final String? address = await Helpers.resolveAddressFromCoordinates(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    if (!mounted) return;

    setState(() {
      _selectedAddress = address;
      _isFetchingAddress = false;
    });
  }

  void _onMapTap(LatLng location) {
    setState(() {
      _selectedLocation = location;
    });

    Helpers.moveMapControllerSafely(
      mapController: _mapController,
      location: location,
    );
    _resolveAddressForSelectedLocation(location);
  }

  void _confirmSelectedLocation() {
    final LatLng? location = _selectedLocation;
    if (location == null) return;

    final Map<String, dynamic> result = Helpers.buildMapSelectionResult(
      latitude: location.latitude,
      longitude: location.longitude,
      address: _selectedAddress,
    );

    context.pop(result);
  }

  @override
  Widget build(BuildContext context) {
    if (_isFetchingLocation) {
      return Center(child: CustomLoading.showLoader());
    }

    final LatLng mapCenter = _selectedLocation ?? _fallbackLocation;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 16.h),
        child: Column(
          children: [
            LocationOnMapHeader(onBackTap: context.pop),
            verticalSpacing(14),
            LocationOnMapMapSection(
              mapController: _mapController,
              mapCenter: mapCenter,
              selectedLocation: _selectedLocation,
              isFetchingAddress: _isFetchingAddress,
              onMapTap: _onMapTap,
              onMyLocationTap: _initializeLocation,
            ),
            verticalSpacing(12),
            if (_selectedAddress != null && _selectedAddress!.trim().isNotEmpty)
              LocationOnMapSelectedAddressView(address: _selectedAddress!),
            verticalSpacing(12),
            AppButton(
              text: 'Confirm Location',
              onPressed: _confirmSelectedLocation,
              color: AppLightColors.primary,
              textColor: Colors.white,
              textSize: 16.sp,
              textWeight: FontWeight.w700,
              radius: 14.r,
            ),
          ],
        ),
      ),
    );
  }
}