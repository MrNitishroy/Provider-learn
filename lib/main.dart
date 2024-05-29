import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Examples/Todo/TodoPage.dart';
import 'package:provider_learn/HomePage.dart';
import 'package:provider_learn/Provider/CounterProvider.dart';
import 'package:provider_learn/Provider/SliderProvider.dart';
import 'package:provider_learn/Provider/TodoProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: GetMaterialApp(
        title: 'Provider Learn',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.deepPurple.shade100,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
            color: Colors.deepPurple,
            centerTitle: true,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
