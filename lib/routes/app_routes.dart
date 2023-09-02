// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const REGISTRATION = _Paths.REGISTRATION;
  static const DRAWER = _Paths.DRAWER;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const REGISTRATION = '/registration';
  static const DRAWER = '/drawer';
}
