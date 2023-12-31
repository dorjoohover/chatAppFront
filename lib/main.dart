
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/binding/bindings.dart';
import 'package:front/global/util.dart';
import 'package:front/routes.dart';
import 'package:front/theme/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:firebase_auth/firebase_auth.dart';
const socketUrl = 'http://192.168.1.2:5000/websocket';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.black));
  // HttpOverrides.global = MyHttpOverrides();
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
   ErrorWidget.builder = (FlutterErrorDetails details) {
    return const Material();
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat App',
      theme: MyTheme.light,

      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      scaffoldMessengerKey: snackbarKey,
      initialRoute: Routes.splash,
      getPages: Routes.pages,
      builder: (context, child) {
        return LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 640) {
            return TabletLayout(child: child!);
          } else {
            return child!;
          }
        });
      },
    );
  }
}
class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 640,
        alignment: Alignment.center,
        child: child,
      ),
    ));
  }
}