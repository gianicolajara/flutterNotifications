import 'package:eventos/eventos/_export.dart';
import 'package:eventos/utils/localNotifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class DEM {
  static HomePageController homePageController = HomePageController();

  //Eventos
  static LocalNotifications localNotifications = LocalNotifications();

  void configuration() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('America/Bogota'));
  }

  static void init() async {
    await localNotifications.init();
  }
}
