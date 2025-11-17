import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

// Tambahkan fungsi untuk cek sesi login
Future<Widget> _getInitialPage() async {
  final prefs = await SharedPreferences.getInstance();
  // Ambil Username yang sudah tersimpan [cite: 194, 195]
  final username = prefs.getString('username');
  
  if (username != null && username.isNotEmpty) {
    // Jika ada username di Local Storage, redirect ke HomePage
    return const HomePage();
  } else {
    // Jika tidak ada, tetap di LoginPage
    return const LoginPage();
  }
}

void main() async {
  // Pastikan Flutter binding sudah diinisialisasi sebelum memanggil native code (SharedPreferences)
  WidgetsFlutterBinding.ensureInitialized();
  
  final initialPage = await _getInitialPage();
  
  runApp(MyApp(initialPage: initialPage));
}

class MyApp extends StatelessWidget {
  final Widget initialPage;
  
  const MyApp({super.key, required this.initialPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NIM_Tugas7 - Login App',
      theme: ThemeData( // Tema global untuk warna Pink
        // Gunakan ColorScheme untuk tema modern dan memastikan accentColor terdefinisi
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          // Ini adalah warna aksen yang akan digunakan oleh floating buttons, dll.
          accentColor: Colors.pinkAccent, 
        ),
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Pastikan Anda tidak menggunakan properti accentColor langsung jika menggunakan ColorScheme
      ),
      home: initialPage, // Halaman awal ditentukan dari cek sesi
      debugShowCheckedModeBanner: false,
    );
  }
}