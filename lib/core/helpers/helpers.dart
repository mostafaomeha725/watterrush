import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waterrush/core/utils/app_date_time.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/core/utils/safe_print.dart';
import 'package:waterrush/core/utils/spacing.dart';
import 'package:waterrush/core/widgets/custom_button.dart';
import 'package:waterrush/core/widgets/custom_loading.dart';
import 'package:waterrush/core/widgets/custom_snack_bar.dart';
import 'package:waterrush/core/widgets/custom_text.dart';

import '/core/routes/app_routes.dart';
import 'package:waterrush/core/routes/route_paths.dart';

class Helpers {
  static void showAppLoader({String? status}) {
    showLoading(status: status, userInteractions: false);
  }

  static void hideAppLoader() {
    hideLoading();
  }

  static void showSuccessSnack({
    required BuildContext context,
    required String message,
  }) {
    CustomSnackBar.showSuccess(context, message: message);
  }

  static void showErrorSnack({
    required BuildContext context,
    required String message,
  }) {
    CustomSnackBar.showError(context, message: message);
  }

  static Future<void> pickCheckoutDeliveryDateAndTime({
    required BuildContext context,
    required TextEditingController controller,
  }) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
    );

    if (pickedDate == null || !context.mounted) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    final DateTime selectedDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    controller.text = AppDateTime.formatDateTime(
      selectedDateTime,
      pattern: 'MM/dd/yyyy hh:mm a',
    );
  }

  static bool validateCheckoutSchedule({
    required BuildContext context,
    required bool isScheduleSelected,
    required TextEditingController dateTimeController,
  }) {
    if (isScheduleSelected && dateTimeController.text.trim().isEmpty) {
      showErrorSnack(
        context: context,
        message: 'Please select date and time for scheduled delivery.',
      );
      return false;
    }
    return true;
  }

  static Future<void> submitCheckoutFlow({
    required BuildContext context,
    required bool isScheduleSelected,
    required TextEditingController dateTimeController,
  }) async {
    final bool canContinue = validateCheckoutSchedule(
      context: context,
      isScheduleSelected: isScheduleSelected,
      dateTimeController: dateTimeController,
    );
    if (!canContinue) return;

    showAppLoader(status: 'Processing checkout...');
    await Future<void>.delayed(const Duration(milliseconds: 800));
    hideAppLoader();

    if (!context.mounted) return;

    showSuccessSnack(
      context: context,
      message: 'Checkout details saved. Proceeding to payment.',
    );
  }

  static Future<void> proceedToPayment({
    required BuildContext context,
    required bool isScheduleSelected,
    required TextEditingController dateTimeController,
  }) async {
    final bool canContinue = validateCheckoutSchedule(
      context: context,
      isScheduleSelected: isScheduleSelected,
      dateTimeController: dateTimeController,
    );

    if (!canContinue || !context.mounted) return;

    await context.push(Routes.paymentScreen);
  }

  static Future<void> proceedToTrackOrder({
    required BuildContext context,
  }) async {
    if (!context.mounted) return;
    await context.push(Routes.trackOrderScreen);
  }

  static Future<void> proceedToSupportChat({
    required BuildContext context,
  }) async {
    if (!context.mounted) return;
    await context.push(Routes.supportChatScreen);
  }

  static Future<void> pickSupportChatAttachment({
    required BuildContext context,
  }) async {
    final File? image = await _pickAttachmentFromSourceSheet(
      context: context,
      includeFiles: true,
    );
    if (!context.mounted) return;

    if (image == null) {
      showErrorSnack(context: context, message: 'No attachment selected.');
      return;
    }

    showSuccessSnack(
      context: context,
      message: 'Attachment selected successfully.',
    );
  }

  static Future<File?> _pickAttachmentFromSourceSheet({
    required BuildContext context,
    bool includeFiles = false,
  }) async {
    final String? source = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext sheetContext) {
        return Container(
          padding: EdgeInsets.fromLTRB(18.w, 16.h, 18.w, 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                'Choose attachment source',
                alignment: AlignmentDirectional.center,
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF102A43),
              ),
              verticalSpacing(12),
              AppButton(
                text: 'Gallery',
                onPressed: () => sheetContext.pop('gallery'),
                radius: 12.r,
                height: 44.h,
              ),
              verticalSpacing(8),
              AppButton(
                text: 'Camera',
                onPressed: () => sheetContext.pop('camera'),
                radius: 12.r,
                height: 44.h,
                color: const Color(0xFF20B8E8),
              ),
              if (includeFiles) ...[
                verticalSpacing(8),
                AppButton(
                  text: 'Files',
                  onPressed: () => sheetContext.pop('files'),
                  radius: 12.r,
                  height: 44.h,
                  color: const Color(0xFF37C46B),
                ),
              ],
              verticalSpacing(8),
              AppButton(
                text: 'Cancel',
                onPressed: () => sheetContext.pop('cancel'),
                radius: 12.r,
                height: 42.h,
                color: Colors.white,
                borderColor: const Color(0xFFD9E2EC),
                textColor: const Color(0xFF5A7184),
              ),
            ],
          ),
        );
      },
    );

    if (source == null || source == 'cancel') {
      return null;
    }

    if (source == 'files') {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
      return null;
    }

    final ImagePicker picker = ImagePicker();
    final ImageSource selectedSource = source == 'camera'
        ? ImageSource.camera
        : ImageSource.gallery;
    final XFile? pickedFile = await picker.pickImage(source: selectedSource);

    if (pickedFile == null) {
      return null;
    }

    return File(pickedFile.path);
  }

  static Future<LatLng?> resolveCurrentMapLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        await Future<void>.delayed(const Duration(seconds: 2));
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          return null;
        }
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
        await Future<void>.delayed(const Duration(seconds: 2));
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.deniedForever ||
            permission == LocationPermission.denied) {
          return null;
        }
      }

      final Position? cachedPosition = await Geolocator.getLastKnownPosition();
      if (cachedPosition != null) {
        return LatLng(cachedPosition.latitude, cachedPosition.longitude);
      }

      final Position? streamPosition = await _tryGetPositionFromStream(
        accuracy: LocationAccuracy.high,
        timeout: const Duration(seconds: 10),
      );
      if (streamPosition != null) {
        return LatLng(streamPosition.latitude, streamPosition.longitude);
      }

      final Position? primaryPosition = await _tryGetCurrentPosition(
        accuracy: LocationAccuracy.best,
        timeout: const Duration(seconds: 12),
      );
      if (primaryPosition != null) {
        return LatLng(primaryPosition.latitude, primaryPosition.longitude);
      }

      await Future<void>.delayed(const Duration(seconds: 1));

      final Position? secondaryPosition = await _tryGetCurrentPosition(
        accuracy: LocationAccuracy.medium,
        timeout: const Duration(seconds: 15),
      );
      if (secondaryPosition != null) {
        return LatLng(secondaryPosition.latitude, secondaryPosition.longitude);
      }

      final Position? lastKnownPosition =
          await Geolocator.getLastKnownPosition();
      if (lastKnownPosition != null) {
        return LatLng(lastKnownPosition.latitude, lastKnownPosition.longitude);
      }

      return null;
    } catch (e) {
      safePrint('resolveCurrentMapLocation error: $e');
      return null;
    }
  }

  static Future<Position?> _tryGetCurrentPosition({
    required LocationAccuracy accuracy,
    required Duration timeout,
  }) async {
    try {
      final LocationSettings locationSettings = _buildLocationSettings(
        accuracy: accuracy,
        timeout: timeout,
      );

      final Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
      return position;
    } catch (e) {
      safePrint('_tryGetCurrentPosition failed: $e');
      return null;
    }
  }

  static Future<Position?> _tryGetPositionFromStream({
    required LocationAccuracy accuracy,
    required Duration timeout,
  }) async {
    try {
      final LocationSettings locationSettings = _buildLocationSettings(
        accuracy: accuracy,
        timeout: timeout,
      );

      final Position position = await Geolocator.getPositionStream(
        locationSettings: locationSettings,
      ).first.timeout(timeout);

      return position;
    } catch (e) {
      safePrint('_tryGetPositionFromStream failed: $e');
      return null;
    }
  }

  static LocationSettings _buildLocationSettings({
    required LocationAccuracy accuracy,
    required Duration timeout,
  }) {
    if (Platform.isAndroid) {
      return AndroidSettings(
        accuracy: accuracy,
        timeLimit: timeout,
        distanceFilter: 0,
        forceLocationManager: false,
        intervalDuration: const Duration(seconds: 2),
      );
    }

    if (Platform.isIOS || Platform.isMacOS) {
      return AppleSettings(
        accuracy: accuracy,
        timeLimit: timeout,
        distanceFilter: 0,
      );
    }

    return LocationSettings(accuracy: accuracy, timeLimit: timeout);
  }

  static Future<String?> resolveAddressFromCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      await setLocaleIdentifier('en');
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isEmpty) return null;

      final Placemark place = placemarks.first;
      final RegExp plusCodePattern = RegExp(r'[A-Z0-9]{4,}\+[A-Z0-9]+');

      final List<String> parts =
          [
                place.street,
                place.subLocality,
                place.locality,
                place.administrativeArea,
              ]
              .whereType<String>()
              .where(
                (part) =>
                    part.trim().isNotEmpty && !plusCodePattern.hasMatch(part),
              )
              .toList();

      if (parts.isEmpty) return null;

      return parts.join(', ');
    } catch (e) {
      safePrint('resolveAddressFromCoordinates error: $e');
      return null;
    }
  }

  static Map<String, dynamic> buildMapSelectionResult({
    required double latitude,
    required double longitude,
    String? address,
  }) {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    };
  }

  static String buildMapSelectionMessage(Map<String, dynamic> routeResult) {
    final double? latitude = (routeResult['latitude'] as num?)?.toDouble();
    final double? longitude = (routeResult['longitude'] as num?)?.toDouble();
    final String? address = routeResult['address'] as String?;

    if (address != null && address.trim().isNotEmpty) {
      return 'Location selected: $address';
    }

    if (latitude != null && longitude != null) {
      return 'Location selected: ${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}';
    }

    return 'Location selected successfully.';
  }

  static Map<String, dynamic>? normalizeMapSelectionResult(dynamic result) {
    if (result is! Map) return null;

    final double? latitude = (result['latitude'] as num?)?.toDouble();
    final double? longitude = (result['longitude'] as num?)?.toDouble();
    final String? address = result['address'] as String?;

    if (latitude == null || longitude == null) return null;

    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
    };
  }

  static String formatMapCoordinates({
    required double latitude,
    required double longitude,
  }) {
    return '${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}';
  }

  static void moveMapControllerSafely({
    required MapController mapController,
    required LatLng location,
    double zoom = 15,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        mapController.move(location, zoom);
      } catch (e) {
        safePrint('moveMapControllerSafely error: $e');
      }
    });
  }

  static Timer startAutoPageSlider({
    required PageController controller,
    required int itemCount,
    required int Function() currentIndex,
    Duration interval = const Duration(seconds: 4),
    Duration animationDuration = const Duration(milliseconds: 450),
    Curve curve = Curves.easeInOut,
  }) {
    return Timer.periodic(interval, (_) {
      if (!controller.hasClients || itemCount == 0) return;

      final int nextIndex = (currentIndex() + 1) % itemCount;
      controller.animateToPage(
        nextIndex,
        duration: animationDuration,
        curve: curve,
      );
    });
  }

  static Timer startCountdownTimer({
    required int initialSeconds,
    required ValueChanged<int> onTick,
    VoidCallback? onCompleted,
  }) {
    int remaining = initialSeconds;
    onTick(remaining);

    return Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining == 0) {
        timer.cancel();
        onCompleted?.call();
        return;
      }

      remaining--;
      onTick(remaining);

      if (remaining == 0) {
        timer.cancel();
        onCompleted?.call();
      }
    });
  }

  static void cancelTimer(Timer? timer) {
    timer?.cancel();
  }

  static Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      return imageFile;
    }
    return null;
  }

  static Future<List<File>> getImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> result = await picker.pickMultiImage();
    if (result.isNotEmpty) {
      List<File> files = result.map((e) => File(e.path)).toList();
      return files;
    } else {
      return [];
    }
  }

  static Future<File?> getImageFromCameraOrDevice() async {
    final BuildContext? context = navigatorKey.currentContext;
    if (context == null) return null;

    return _pickAttachmentFromSourceSheet(context: context);
  }

  static Future<List<File>> pickLimitedImagesWithMaxSize({
    required int maxCount,
    int maxSizeInMB = 5,
  }) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> result = await picker.pickMultiImage();

    if (result.isEmpty) return [];

    List<File> validFiles = [];

    for (final xfile in result) {
      if (validFiles.length >= maxCount) break;

      final file = File(xfile.path);
      final bytes = await file.length();

      final sizeInMB = bytes / (1024 * 1024);

      if (sizeInMB <= maxSizeInMB) {
        validFiles.add(file);
      }
    }

    return validFiles;
  }

  static void shareApp(String url) {
    CustomLoading.showLoader();
    SharePlus.instance.share(ShareParams(uri: Uri.parse(url)));
  }

  static Future<File?> pickPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    } else {
      return null;
    }
  }

  static void showPdfPreview(BuildContext context, File onValue) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoPopupSurface(
          blurSigma: 1.0,
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.h),
              width: double.infinity, // Width of the PDF viewer popup
              height: 380, // Height of the PDF viewer popup
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  // PDF viewer in the center
                  // SfPdfViewer.file(onValue),

                  // Close Button at the top right
                  CupertinoButton(
                    padding: const EdgeInsets.all(5),
                    child: const Icon(CupertinoIcons.clear),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LauncherHelper {
  static void launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://$url";
    }
    await launchUrl(Uri.parse(url));
  }

  static void launchWhatsApp(String phone) async {
    String message = 'مرحبا بك';
    if (phone.startsWith("00966")) {
      phone = phone.substring(5);
    }
    var whatsAppUrl = "whatsapp://send?phone=+966$phone&text=$message";
    debugPrint(whatsAppUrl);
    if (await canLaunchUrl(Uri.parse(whatsAppUrl))) {
      await launchUrl(Uri.parse(whatsAppUrl));
    } else {
      throw 'AppStrings.error.tr()';
    }
  }

  static void launchYoutube({required String url}) async {
    final Uri parsedUrl = Uri.parse(url);
    if (Platform.isIOS) {
      if (await canLaunchUrl(parsedUrl)) {
        await launchUrl(parsedUrl);
      } else {
        if (await canLaunchUrl(parsedUrl)) {
          await launchUrl(parsedUrl);
        } else {
          throw 'Could not launch $parsedUrl';
        }
      }
    } else {
      if (await canLaunchUrl(parsedUrl)) {
        await launchUrl(parsedUrl);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static Future<void> launchTwitter(String userName) async {
    final twitterProfileUrl = Uri.parse(
      'twitter://user?screen_name=$userName',
    ); // Twitter app URL
    final Uri webUrl = Uri.parse('https://twitter.com/$userName'); // Web URL
    try {
      if (await canLaunchUrl(twitterProfileUrl)) {
        await launchUrl(twitterProfileUrl);
      } else {
        if (await canLaunchUrl(webUrl)) {
          await launchUrl(webUrl);
        } else {
          throw 'Could not launch Twitter in a web browser';
        }
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  static Future<void> launchInstagram(String userName) async {
    final Uri instagramProfileUrl = Uri.parse(
      'https://www.instagram.com/$userName',
    ); // Replace with your Instagram profile URL
    final Uri instagramNativeApp = Uri.parse(
      'instagram://user?username=$userName',
    );

    try {
      if (await canLaunchUrl(instagramNativeApp)) {
        await launchUrl(instagramNativeApp); // Open Instagram app
      } else {
        if (await canLaunchUrl(instagramProfileUrl)) {
          await launchUrl(instagramProfileUrl);
        } else {
          throw 'Could not launch Instagram in a web browser';
        }
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  void launchFacebook(String userName) async {
    final Uri nativeUrl = Uri.parse(
      'fb://facewebmodal/f?href=https://www.facebook.com/$userName',
    );
    final Uri webUrl = Uri.parse('https://www.facebook.com/$userName');
    if (await canLaunchUrl(nativeUrl)) {
      await launchUrl(nativeUrl);
    } else {
      if (await canLaunchUrl(webUrl)) {
        await launchUrl(webUrl);
      } else {
        throw 'Could not launch $webUrl';
      }
    }
  }

  static Future<void> launchSnapchat(String userName) async {
    final snapchatProfileUrl = Uri.parse(
      'https://www.snapchat.com/add/$userName',
    );
    final snapChatNativeApp = Uri.parse('snapchat://add/$userName');

    try {
      if (await canLaunchUrl(snapChatNativeApp)) {
        await launchUrl(snapChatNativeApp);
      } else {
        if (await canLaunchUrl(snapchatProfileUrl)) {
          await launchUrl(snapchatProfileUrl);
        } else {
          throw 'Could not launch Snapchat in a web browser';
        }
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  static Future<void> launchTikTok(String userName) async {
    final tiktokProfileUrl = Uri.parse('https://www.tiktok.com/@$userName');

    try {
      if (await canLaunchUrl(Uri.parse('com.zhiliaoapp.musically'))) {
        await launchUrl(
          Uri.parse('com.zhiliaoapp.musically://user?u=$userName'),
        );
      } else {
        if (await canLaunchUrl(tiktokProfileUrl)) {
          await launchUrl(tiktokProfileUrl);
        } else {
          throw 'Could not launch TikTok in a web browser';
        }
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  static void callPhone({required String phone}) async {
    await launchUrl(Uri.parse('tel:$phone'));
  }

  static void sendMail(String mail) async {
    await launchUrl(Uri.parse('mailto:$mail'));
  }
}
