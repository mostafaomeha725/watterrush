import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';

class LocationOnMapMapSection extends StatelessWidget {
  const LocationOnMapMapSection({
    super.key,
    required this.mapController,
    required this.mapCenter,
    required this.selectedLocation,
    required this.isFetchingAddress,
    required this.onMapTap,
    required this.onMyLocationTap,
  });

  final MapController mapController;
  final LatLng mapCenter;
  final LatLng? selectedLocation;
  final bool isFetchingAddress;
  final ValueChanged<LatLng> onMapTap;
  final VoidCallback onMyLocationTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: Stack(
          children: [
            FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: mapCenter,
                initialZoom: 15,
                onTap: (_, latLng) => onMapTap(latLng),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.waterrush.app',
                ),
                if (selectedLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: selectedLocation!,
                        width: 52.w,
                        height: 52.h,
                        alignment: Alignment.topCenter,
                        child: Icon(
                          Icons.location_on,
                          size: 48.sp,
                          color: AppLightColors.primary,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            if (isFetchingAddress)
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                  ),
                  child: CustomLoading.showLoader(),
                ),
              ),
            Positioned(
              bottom: 84.h,
              right: 12.w,
              child: SizedBox(
                width: 130.w,
                child: AppButton(
                  text: 'My Location',
                  onPressed: onMyLocationTap,
                  height: 38.h,
                  radius: 20.r,
                  textSize: 12.sp,
                  textWeight: FontWeight.w600,
                  color: Colors.white,
                  textColor: const Color(0xFF1E5A7A),
                  borderColor: const Color(0xFFD8E5EC),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}