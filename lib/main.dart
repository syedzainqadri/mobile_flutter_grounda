import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_flutter_grounda/app/bindings/all_bindings.dart';
import 'package:mobile_flutter_grounda/app/controllers/authController/auth_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/themeController/theme_change_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/themeController/theme_controller.dart';
import 'package:mobile_flutter_grounda/firebase_options.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('token');
  await Hive.openBox('consts');

  Get.put(AuthController());
  Get.put(ThemeController());
  Get.put(ThemeChangeController());
  // Get.put(DashboardController());
  // Get.put(ProjectController());
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController _themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: _themeController.themeStateFromHiveSettingBox,
      title: projectName,
      // initialRoute: '/',
      // getPages: appRoutes(),
      // theme: CustomTheme().lightTheme,
      // darkTheme: CustomTheme().darkTheme,
      home: const MyHomePage(title: projectName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
