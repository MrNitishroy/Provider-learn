import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/Configs/Theme.dart';
import 'package:provider_learn/Examples/Todo/TodoPage.dart';
import 'package:provider_learn/HomePage.dart';
import 'package:provider_learn/Provider/CounterProvider.dart';
import 'package:provider_learn/Provider/SliderProvider.dart';
import 'package:provider_learn/Provider/ThemeProvider.dart';
import 'package:provider_learn/Provider/TodoProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    return GetMaterialApp(
      title: 'Provider Learn',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: themeProvider.themeMode,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}
