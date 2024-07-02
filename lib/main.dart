import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'core/utils/app_connection_controller.dart';
import 'core/utils/app_controller.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/app_theme_controller.dart';
import 'data/services/app_setting.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyB7yp0Te3VfPYDl-9sYyw-6PO_OiTp9TTA",
              appId: "1:145799333330:android:0f787405d262f07339b40b",
              messagingSenderId: "145799333330",
              projectId: "travelapp-cbdd5",
              storageBucket: "gs://travelapp-cbdd5.appspot.com"))
      : await Firebase.initializeApp();
  await initService();
  runApp(MyApp());
}

Future<void> initService() async {
  await GetStorage.init();
  //
  await Get.putAsync(() => AppConnectionController().init());
  await Get.putAsync(() => AppSetting().init());
  await Get.putAsync(() => AppController().init(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _appThemeController = Get.put(AppThemeController());
    //
    return GetMaterialApp(
      title: "EXAM",
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {}),
      fallbackLocale: Locale('vi', 'VN'),
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: _appThemeController.appThemeMode,
      getPages: AppPages.pages,
      initialRoute: AppPages.INITIAL,
      unknownRoute: AppPages.unknowPage,
      transitionDuration: Duration(milliseconds: 100),
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          minWidth: 450,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(650, name: TABLET),
            ResponsiveBreakpoint.resize(920, name: DESKTOP),
            ResponsiveBreakpoint.resize(1250, name: '4K'),
          ],
        );
      },
    );
  }
}
