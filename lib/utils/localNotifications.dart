import 'dart:async';

import 'package:eventos/eventos/_export.dart';

class LocalNotifications {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');

    //Peticion de permisos y configuracion IOS
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      /*  onDidReceiveLocalNotification: onDidReceiveLocalNotification */
    );

    //Peticion de permisos y configuracion MACos
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false);
    //Configuracion general
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            macOS: initializationSettingsMacOS,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String? payload) async {
    // Hacer algo al selecionar
    print('hola');
  }

  //Notificacion simple
  Future instantNotification(String? payload) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'id',
      'channel',
      'description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, 'Titulo', 'Descripción', platformChannelSpecifics,
        payload: 'Bienvenido a mi notificación');
  }

  //Only android
  Future imageNotification() async {
    const BigPictureStyleInformation picture = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("icon"),
        largeIcon: DrawableResourceAndroidBitmap("icon"),
        contentTitle: "Imagen demo",
        summaryText: "Prueba de descripcion de imagen",
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('id', 'channel', 'description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false,
            styleInformation: picture);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
        0, 'Titulo imagen', 'Descripción imagen', platformChannelSpecifics,
        payload: 'Bienvenido a mi notificación con imagen');
  }

  Future stylishNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('id', 'channel', 'description',
            importance: Importance.max,
            priority: Priority.high,
            /* onlyAlertOnce: true, */
            visibility: NotificationVisibility.public,
            /* showWhen: false, */
            enableLights: true,
            enableVibration: true,
            playSound: true,
            /* channelShowBadge: true, */
            channelAction: AndroidNotificationChannelAction.update,
            sound: RawResourceAndroidNotificationSound("noti"),
            largeIcon: DrawableResourceAndroidBitmap("icon"),
            styleInformation: MediaStyleInformation(
                htmlFormatContent: true, htmlFormatTitle: true));

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
        0, 'Titulo imagen', 'Descripción imagen', platformChannelSpecifics,
        payload: 'Bienvenido a mi notificación con imagen');
  }

  Future cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
