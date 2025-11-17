import 'package:flutter/material.dart';
import '../widgets/side_menu.dart'; 

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        backgroundColor: Colors.pink.shade200, // Pink yang sangat lembut
      ),
      drawer: const SideMenu(), 
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.stars, size: 50, color: Colors.pinkAccent), 
              SizedBox(height: 15),
              Text(
                'Aplikasi Login Sederhana - Versi 1.0',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              SizedBox(height: 10),
              Text(
                'Dibuat sebagai implementasi kreatif dari modul Routes, Side Menu, Login, dan Local Storage.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}