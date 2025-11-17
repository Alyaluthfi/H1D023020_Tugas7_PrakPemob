import 'package:flutter/material.dart';
import '../widgets/side_menu.dart'; 

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.pink.shade600, // Pink yang lebih tegas
      ),
      drawer: const SideMenu(), 
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.palette, color: Colors.pink), 
            title: const Text('Ganti Tema'),
            subtitle: const Text('Ubah skema warna aplikasi'),
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.pink), 
            title: const Text('Ubah Kata Sandi'),
            subtitle: const Text('Ganti password login Anda'),
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.pink), 
            title: const Text('Notifikasi'),
            subtitle: const Text('Atur preferensi notifikasi'),
          ),
        ],
      ),
    );
  }
}