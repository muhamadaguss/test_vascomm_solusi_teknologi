import 'package:flutter/cupertino.dart';
import 'package:test_vascomm/views/common/drawer/drawer_screen.dart';
import 'package:test_vascomm/views/ui/login_view.dart';
import 'package:test_vascomm/views/ui/register_view.dart';

part 'app_routes.dart';

class AppPage {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.LOGIN;

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    // final arguments =
    //     (settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;
    return CupertinoPageRoute<dynamic>(
      settings: settings,
      builder: (_) {
        switch (settings.name) {
          case Routes.LOGIN:
            return const LoginView();
          case Routes.REGISTRATION:
            return const RegisterView();
          case Routes.DRAWER:
            return const DrawerScreen();
          default:
            return Container();
        }
      },
    );
  }
}
