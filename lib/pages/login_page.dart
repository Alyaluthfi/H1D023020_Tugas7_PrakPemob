import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // --- FUNGSI LOCAL STORAGE: Menyimpan Display Name ---
  void _saveSession(String username, String displayName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('displayName', displayName); 
  }
  
  // --- FUNGSI VALIDASI DAN LOGIC LOGIN: Dua Kombinasi User ---
  void _attemptLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    String dialogMessage;
    String? displayName;
    bool loginSuccess = false;

    // Kombinasi 1: Admin
    if (username == 'admin' && password == 'admin') {
      displayName = 'Administrator';
      dialogMessage = 'Login Admin Berhasil! Selamat bekerja.';
      loginSuccess = true;
    } 
    // Kombinasi 2: User Biasa
    else if (username == 'user' && password == 'user123') {
      displayName = 'Pengguna Biasa';
      dialogMessage = 'Login User Berhasil! Selamat menikmati aplikasi.';
      loginSuccess = true;
    }
    // Gagal
    else {
      dialogMessage = 'Username atau Password salah. Coba lagi.';
    }

    if (loginSuccess) {
      _saveSession(username, displayName!);
      _showDialog(dialogMessage, const HomePage());
    } else {
      _showDialog(dialogMessage, const LoginPage());
    }
  }

  // --- FUNGSI INPUT FIELD ---
  Widget _buildInputField(TextEditingController controller, String placeholder, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: placeholder,
          labelText: placeholder,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          prefixIcon: Icon(isPassword ? Icons.lock : Icons.person, color: Colors.pink.shade400),
        ),
      ),
    );
  }
  
  // --- FUNGSI DIALOG ---
  Future<void> _showDialog(String message, Widget nextPage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.pink.shade400)),
              onPressed: () {
                Navigator.pop(context);
                
                if (nextPage is HomePage) {
                   Navigator.pushReplacement( 
                      context,
                      MaterialPageRoute(builder: (context) => nextPage),
                   );
                } else {
                  _usernameController.clear();
                  _passwordController.clear();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Otentikasi'),
        backgroundColor: Colors.pink.shade300,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, 
                children: <Widget>[
                  Icon(
                    Icons.lock_person, // Ikon manis
                    size: 80,
                    color: Colors.pinkAccent,
                  ),
                  const SizedBox(height: 30),
                  _buildInputField(_usernameController, 'Masukkan Username', false),
                  _buildInputField(_passwordController, 'Masukkan Password', true),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _attemptLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink, // Tombol pink
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('MASUK', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Uji Coba: (admin/admin) atau (user/user123)',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}