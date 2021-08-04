import 'package:eventos/eventos/_export.dart';

class LocalNotifications {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const String ID_NOTIFICATION_UNIQUE = 'id_evento';
  static const String CHANNEL_NOTIFICATION_UNIQUE = 'channel_evento';
  static const String DESCRIPTION_NOTIFICATION_UNIQUE =
      'This is notification channel of app evento';

  static const String iconName = 'icon'; // nombre del icono en android
  static const String largeIconName = 'icon'; // nombre del icono en android
  static const String imageToNotification = 'icon'; //nombre de la imagen

  static const String notificationSound = 'noti';

  static const String contentTitle = 'App Evento';
  static const String contentBodyImage = 'Bienvenido';

  Future init() async {
    //Inicialización del icono que debe estar en
    //android/app/src/main/res/drawable
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(iconName);

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
    // Hacer algo al hacer ontap
    print('Hice on tap sobre una notificación');
  }

  //Only android
  Future imageNotification(
    int id,
    String title,
    String body,
    String payLoad,
  ) async {
    const BigPictureStyleInformation picture = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap(imageToNotification),
        contentTitle: contentTitle,
        summaryText: contentBodyImage,
        largeIcon: DrawableResourceAndroidBitmap(largeIconName),
        htmlFormatContent: true,
        htmlFormatContentTitle: true);

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(ID_NOTIFICATION_UNIQUE,
            CHANNEL_NOTIFICATION_UNIQUE, DESCRIPTION_NOTIFICATION_UNIQUE,
            importance: Importance.max,
            priority: Priority.high,
            onlyAlertOnce: true,
            visibility: NotificationVisibility.public,
            showWhen: false,
            enableLights: true,
            enableVibration: true,
            playSound: true,
            channelShowBadge: true,
            sound: RawResourceAndroidNotificationSound(notificationSound),
            largeIcon: DrawableResourceAndroidBitmap(largeIconName),
            styleInformation: picture);

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin
        .show(id, title, body, platformChannelSpecifics, payload: payLoad);
  }

  Future stylishNotification(
      int id, String title, String body, String payLoad) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(ID_NOTIFICATION_UNIQUE,
            CHANNEL_NOTIFICATION_UNIQUE, DESCRIPTION_NOTIFICATION_UNIQUE,
            importance: Importance.max,
            priority: Priority.high,
            onlyAlertOnce: true,
            visibility: NotificationVisibility.public,
            showWhen: false,
            enableLights: true,
            enableVibration: true,
            playSound: true,
            channelShowBadge: true,
            sound: RawResourceAndroidNotificationSound(notificationSound),
            largeIcon: DrawableResourceAndroidBitmap(largeIconName),
            styleInformation: MediaStyleInformation(
                htmlFormatContent: true, htmlFormatTitle: true));

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin
        .show(id, title, body, platformChannelSpecifics, payload: payLoad);
  }

  Future cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
