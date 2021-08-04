import 'dart:async';

import 'package:eventos/eventos/_export.dart';

class UIHomePage extends StatefulWidget {
  UIHomePage({Key? key}) : super(key: key);

  @override
  _UIHomePageState createState() => _UIHomePageState();
}

class _UIHomePageState extends State<UIHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
              child: Column(
            children: [
              ElevatedButton(
                child: Text('Llamar notificacion con imagen'),
                onPressed: () async {
                  await DEM.localNotifications
                      .imageNotification(0, 'Titulo', 'Descripcion', 'Payload');
                },
              ),
              ElevatedButton(
                child: Text('Llamar notificacion estilizada'),
                onPressed: () async {
                  await DEM.localNotifications.stylishNotification(
                      1, 'Titulo', 'Descripcion', 'Payload');
                },
              ),
              ElevatedButton(
                child: Text('Notificación cada 15 seg'),
                onPressed: () async {
                  Timer.periodic(Duration(seconds: 3), (value) async {
                    await DEM.localNotifications.stylishNotification(
                        2, 'Titulo', 'Descripcion', 'Payload');
                  });
                },
              ),
              ElevatedButton(
                child: Text('Cancelar notificaciones'),
                onPressed: () {
                  DEM.localNotifications.cancelNotification();
                },
              ),
            ],
          ))),
    );
  }
}
