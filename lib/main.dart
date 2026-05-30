import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:waterrush/core/utils/easy_loading.dart';
import 'package:waterrush/core/routes/app_routes.dart';
import 'package:waterrush/core/theme/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/core/di/services_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  configureEasyLoading(); // Initialize EasyLoading config
  ChuckerFlutter.showNotification = false; // Hide Chucker notification overlay
  runApp(const DefaultApp());
}

class DefaultApp extends StatelessWidget {
  const DefaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = createRouter();

    return ScreenUtilInit(
      designSize: const Size(420, 910),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Default App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppLightColors.defaultBackground,
            useMaterial3: true,
          ),
          routerConfig: router,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}