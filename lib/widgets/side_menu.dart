import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/about_page.dart';
import '../pages/settings_page.dart';
import '../pages/login_page.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  // Fungsi untuk Logout dan menghapus data sesi
  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('displayName');
    
    // Kembali ke halaman Login dan hapus semua rute sebelumnya
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.pink.shade300, // Header Drawer Pink
            ),
            child: const Text(
              'Menu Aplikasi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.pink), 
            title: const Text('Home Dashboard'),
            onTap: () {
              Navigator.pop(context); 
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.pink), 
            title: const Text('Pengaturan'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.pink), 
            title: const Text('Tentang'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.redAccent), // Kontras
            title: const Text('Logout', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
            onTap: () => _logout(context),
          ),
        ],
      ),
    );
  }
}