import 'package:flutter/material.dart';
import 'package:flutter_app_shop/pages/home_page/home_page.dart';
import 'package:flutter_app_shop/services/theme_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainActivity());
}

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter IShop ',
      theme: ThemeManagerService.applyLightMode(),
      //darkTheme: ThemeManagerService.applyDarkMode(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false, // uncomment this
    );
  }
}
