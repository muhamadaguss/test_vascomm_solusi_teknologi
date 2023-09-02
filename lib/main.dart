import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_vascomm/bloc_provider.dart';
import 'package:test_vascomm/routes/app_pages.dart';

import 'constants/app_constants.dart';
import './injection_container.dart' as di;
import 'injection_container.dart';

String defaultHome = AppPage.INITIAL;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();
  final isLogin = sl<SharedPreferences>().getBool('isLogin') ?? false;
  if (isLogin) {
    defaultHome = Routes.DRAWER;
  } else {
    defaultHome = AppPage.INITIAL;
  }
  runApp(const MyApp());
}

final ZoomDrawerController z = ZoomDrawerController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(kLight.value),
          ),
          title: 'Test Vascomm',
          onGenerateRoute: AppPage.generateRoute,
          initialRoute: defaultHome,
          navigatorKey: di.sl<GlobalKey<NavigatorState>>(),
        ),
      ),
    );
  }
}
