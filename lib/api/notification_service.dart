// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;


// class NotificationServices {
//   // Singleton pattern
//   static final NotificationServices _notificationService =
//       NotificationServices._internal();
//   factory NotificationServices() {
//     return _notificationService;
//   }

//   NotificationServices._internal();

//   static const channelId = "1";

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static const AndroidNotificationDetails _androidNotificationDetails =
//       AndroidNotificationDetails(
//     channelId,
//     "thecodexhub",
//     channelDescription:
//         "This channel is responsible for all the local notifications",
//     playSound: true,
//     priority: Priority.high,
//     importance: Importance.high,
//   );

//   static const IOSNotificationDetails _iOSNotificationDetails =
//       IOSNotificationDetails();

//   final NotificationDetails notificationDetails = const NotificationDetails(
//     android: _androidNotificationDetails,
//     iOS: _iOSNotificationDetails,
//   );

//   Future<void> init() async {
//     const AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const IOSInitializationSettings iOSInitializationSettings =
//         IOSInitializationSettings(
//       defaultPresentAlert: false,
//       defaultPresentBadge: false,
//       defaultPresentSound: false,
//     );

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iOSInitializationSettings,
//     );

//     // *** Initialize timezone here ***
//     tz.initializeTimeZones();

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: onSelectNotification,
//     );
//   }

//   Future<void> requestIOSPermissions() async {
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }

//   Future<void> showNotification(
//       int id, String title, String body, String payload) async {
//     await flutterLocalNotificationsPlugin.show(
//       id,
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }

//   Future<void> scheduleNotification(int id, String title, String body,
//       DateTime eventDate, TimeOfDay eventTime, String payload,
//       [DateTimeComponents? dateTimeComponents]) async {
//     final scheduledTime = eventDate.add(Duration(
//       hours: eventTime.hour,
//       minutes: eventTime.minute,
//     ));
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledTime, tz.local),
//       notificationDetails,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle: true,
//       payload: payload,
//       matchDateTimeComponents: dateTimeComponents,
//     );
//   }

//   Future<void> cancelNotification(int id) async {
//     await flutterLocalNotificationsPlugin.cancel(id);
//   }

//   Future<void> cancelAllNotifications() async {
//     await flutterLocalNotificationsPlugin.cancelAll();
//   }

//   Future getNotifications() async {
//     final List<PendingNotificationRequest> pendingNotificationRequests =
//         await FlutterLocalNotificationsPlugin().pendingNotificationRequests();
//     return pendingNotificationRequests;
//   }
// }

// Future<void> onSelectNotification(String? payload) async {
//   // await navigatorKey.currentState
//   //     ?.push(MaterialPageRoute(builder: (_) => DetailsPage(payload: payload)));
// }