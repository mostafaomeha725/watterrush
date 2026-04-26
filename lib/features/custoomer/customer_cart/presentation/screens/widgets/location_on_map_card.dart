import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:waterrush/core/helpers/helpers.dart';
import 'package:waterrush/core/routes/route_paths.dart';
import 'package:waterrush/core/theme/styles.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

class LocationOnMapCard extends StatefulWidget {
  final Color? borderColor;
  final void Function(String address)? onAddressSelected;
  final void Function(double latitude, double longitude)? onLocationSelected;
  final double? initialLatitude;
  final double? initialLongitude;
  final String? initialAddress;

  const LocationOnMapCard({
    super.key,
    this.borderColor,
    this.onAddressSelected,
    this.onLocationSelected,
    this.initialLatitude,
    this.initialLongitude,
    this.initialAddress,
  });

  @override
  State<LocationOnMapCard> createState() => _LocationOnMapCardState();
}

class _LocationOnMapCardState extends State<LocationOnMapCard> {
  LatLng? _selectedLocation;
  String? _address;
  bool _isFetchingAddress = false;

  static const Color _cardColor = Color(0xFFC6DEE8);
  static const Color _accentColor = Color(0xFF048EBB);

  @override
  void initState() {
    super.initState();
    final double? initialLatitude = widget.initialLatitude;
    final double? initialLongitude = widget.initialLongitude;
    if (initialLatitude != null && initialLongitude != null) {
      _selectedLocation = LatLng(initialLatitude, initialLongitude);
      _address = widget.initialAddress;
    }
  }

  @override
  void didUpdateWidget(covariant LocationOnMapCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    final bool locationChanged =
        oldWidget.initialLatitude != widget.initialLatitude ||
        oldWidget.initialLongitude != widget.initialLongitude;
    final bool addressChanged =
        oldWidget.initialAddress != widget.initialAddress;

    if (!locationChanged && !addressChanged) return;

    final double? updatedLatitude = widget.initialLatitude;
    final double? updatedLongitude = widget.initialLongitude;

    if (updatedLatitude != null && updatedLongitude != null) {
      setState(() {
        _selectedLocation = LatLng(updatedLatitude, updatedLongitude);
        _address = widget.initialAddress;
      });
      return;
    }

    if (updatedLatitude == null || updatedLongitude == null) {
      setState(() {
        _selectedLocation = null;
        _address = null;
      });
    }
  }

  Future<void> _openMapPicker() async {
    final Map<String, dynamic>? initialSelection = _selectedLocation != null
        ? Helpers.buildMapSelectionResult(
            latitude: _selectedLocation!.latitude,
            longitude: _selectedLocation!.longitude,
            address: _address,
          )
        : null;

    final dynamic result = await context.push(
      Routes.locationOnMapScreen,
      extra: initialSelection,
    );

    if (!mounted) return;

    final Map<String, dynamic>? normalizedResult =
        Helpers.normalizeMapSelectionResult(result);
    if (normalizedResult == null) return;

    final double latitude = normalizedResult['latitude'] as double;
    final double longitude = normalizedResult['longitude'] as double;

    setState(() {
      _selectedLocation = LatLng(latitude, longitude);
      _isFetchingAddress = true;
    });

    widget.onLocationSelected?.call(latitude, longitude);

    final String? selectedAddress = normalizedResult['address'] as String?;
    if (selectedAddress != null && selectedAddress.trim().isNotEmpty) {
      setState(() {
        _address = selectedAddress;
        _isFetchingAddress = false;
      });
      widget.onAddressSelected?.call(selectedAddress);
      return;
    }

    final String? resolvedAddress = await Helpers.resolveAddressFromCoordinates(
      latitude: latitude,
      longitude: longitude,
    );

    if (!mounted) return;

    setState(() {
      _address = resolvedAddress ?? 'Address not found';
      _isFetchingAddress = false;
    });

    if (resolvedAddress != null && resolvedAddress.trim().isNotEmpty) {
      widget.onAddressSelected?.call(resolvedAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openMapPicker,
      child: Container(
        height: 202.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: widget.borderColor ?? const Color(0xFFD5E6EE),
          ),
        ),
        padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
        child: Stack(
          children: [
            Center(
              child: Icon(
                Icons.location_on_outlined,
                size: 58.sp,
                color: _accentColor,
              ),
            ),
            if (_selectedLocation != null || _isFetchingAddress)
              Positioned(
                left: 0,
                right: 124.w,
                bottom: 0,
                child: _buildSelectedLocationInfo(),
              ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: 118.w,
                child: AppButton(
                  text: 'View Map',
                  onPressed: _openMapPicker,
                  height: 42.h,
                  radius: 24.r,
                  color: Colors.white,
                  borderColor: const Color(0xFFD7E5ED),
                  textColor: _accentColor,
                  textSize: 14.sp,
                  textWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedLocationInfo() {
    final String fallbackCoordinates = _selectedLocation == null
        ? ''
        : Helpers.formatMapCoordinates(
            latitude: _selectedLocation!.latitude,
            longitude: _selectedLocation!.longitude,
          );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFD7E5ED)),
      ),
      child: _isFetchingAddress
          ? SizedBox(height: 32.h, child: CustomLoading.showLoader())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Location Selected',
                  style: font12w700.copyWith(color: const Color(0xFF15698A)),
                ),
                verticalSpacing(3),
                AppText(
                  (_address != null && _address!.trim().isNotEmpty)
                      ? _address!
                      : fallbackCoordinates,
                  maxLines: 2,
                  style: font12w400.copyWith(color: const Color(0xFF35576A)),
                ),
              ],
            ),
    );
  }
}
