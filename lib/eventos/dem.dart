import 'package:eventos/eventos/_export.dart';
import 'package:eventos/utils/localNotifications.dart';

class DEM {
  static HomePageController homePageController = HomePageController();

  //Eventos
  static LocalNotifications localNotifications = LocalNotifications();

  static void init() async {
    await localNotifications.init();
  }
}
