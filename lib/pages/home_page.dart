import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/side_menu.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _displayName = 'Tamu';

  @override
  void initState() {
    super.initState();
    _loadUserDisplayName();
  }

  // Fungsi untuk mengambil Display Name
  void _loadUserDisplayName() async {
    final prefs = await SharedPreferences.getInstance();
    final storedDisplayName = prefs.getString('displayName') ?? 'User'; 
    setState(() {
      _displayName = storedDisplayName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Dashboard'),
        backgroundColor: Colors.pink.shade400, // Pink yang medium
      ),
      drawer: const SideMenu(), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.waving_hand,
              size: 80,
              color: Colors.pinkAccent,
            ),
            const SizedBox(height: 20),
            Text(
              'Selamat Datang, $_displayName!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink), 
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Anda berhasil login ke dashboard aplikasi.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}