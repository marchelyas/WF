import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart'; // Import Device Preview
import 'package:flutter/foundation.dart'; // Untuk kReleaseMode
import 'pages/login_page.dart'; // Import Login Page
import 'pages/register_page.dart'; // Import Register Page
import 'pages/home_page.dart'; // Import Home Page

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Aktifkan Device Preview hanya di mode debug
      builder: (context) => const MyApp(), // Bungkus aplikasi di sini
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Well Favoree',
      theme: ThemeData(
        primarySwatch: Colors.pink, // Tema warna
      ),
      builder: DevicePreview.appBuilder, // Gunakan Device Preview
      locale: DevicePreview.locale(context), // Tambahkan locale
      useInheritedMediaQuery: true, // Sesuaikan untuk pengaturan perangkat yang disimulasikan
      initialRoute: '/', // Route default
      routes: {
        '/': (context) => const LoginPage(), // Route ke Login Page
        '/register': (context) => const RegisterPage(), // Route ke Register Page
        '/home': (context) => const HomePage(), // Route ke Home Page
      },
    );
  }
}
