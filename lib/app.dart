import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:eppsee/src/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GetMaterialApp(
        title: 'Taj',
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        initialRoute: Routes.splash /*widget.isLoggedIn ? Routes.DASHBOARD : Routes.LOGIN*/,
        getPages: AppPages.routes,
      ),
    );
  }
}
