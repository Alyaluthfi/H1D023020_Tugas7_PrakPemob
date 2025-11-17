# h1d023020_tugas7

# ⚙️ h1d023020_tugas7: Implementasi Otentikasi, Sesi, dan Navigasi (Flutter)

Proyek ini mendemonstrasikan implementasi integral dari **sistem otentikasi** berbasis *Local Storage*, **manajemen sesi**, dan struktur navigasi multi-halaman dalam sebuah aplikasi Flutter.

---

## ✨ Fitur Teknis Utama

1.  **Otentikasi Multi-Level:** Menerapkan dua set kredensial untuk mensimulasikan level akses yang berbeda:
    * **Level 1 (Admin):** `admin` / `admin`
    * **Level 2 (User):** `user` / `user123`
2.  **Manajemen Sesi Persisten:** Menggunakan `shared_preferences` untuk menyimpan `username` dan **`displayName`**, memastikan sesi pengguna dipertahankan antar sesi aplikasi.
3.  **Pengamanan Rute:** Menggunakan `Navigator.pushReplacement` setelah login untuk mencegah akses kembali ke halaman otentikasi tanpa proses *logout*.
4.  **Sistem Navigasi Modular:** Menerapkan komponen **`Drawer`** (`SideMenu`) yang dapat digunakan kembali untuk mengelola navigasi ke berbagai rute aplikasi.
5.  **Pengecekan Sesi Inisial:** Logic pada `main.dart` untuk memverifikasi sesi aktif sebelum menampilkan halaman utama.

---

## 🖼️ Tampilan Aplikasi (Screenshots)

Tambahkan *screenshots* fungsional aplikasi Anda di sini.

### 1. Halaman Otentikasi (Input Kredensial)



### 2. Halaman Utama (Data Sesi Tampil)



### 3. Komponen Navigasi Samping (Side Menu)

---

## 📁 Struktur Proyek

h1d023020_tugas7/

├── lib/

│ ├── main.dart

│ ├── pages/

│ │ ├── about_page.dart

│ │ ├── home_page.dart

│ │ ├── login_page.dart

│ │ └── settings_page.dart

│ └── widgets/

│ └── side_menu.dart

└── pubspec.yaml

---
## 💻 Penjelasan Fungsionalitas Kode

Berikut adalah fokus fungsional pada setiap file inti:

### 1. `lib/main.dart` (Inisialisasi & Pengendali Sesi Awal)

| Bagian Kode | Fungsionalitas |
| :--- | :--- |
| `_getInitialPage()` | **Menentukan rute awal** berdasarkan status sesi di `SharedPreferences`. Jika kunci `'username'` ada, mengarahkan ke **`HomePage`**; jika tidak, ke **`LoginPage`**. |
| `void main()` | Bertanggung jawab untuk inisialisasi *widget binding* dan menjalankan proses pengecekan sesi inisial sebelum aplikasi dimulai. |
| `MaterialApp` | Mendefinisikan konfigurasi tingkat atas aplikasi dan mengaplikasikan tema visual. |

---

### 2. `lib/pages/login_page.dart` (Otentikasi & Manajemen Sesi)

File ini menangani seluruh proses validasi kredensial, penyimpanan, dan transisi rute bersyarat.

| Bagian Kode | Fungsionalitas |
| :--- | :--- |
| `_saveSession(u, dn)` | **Menyimpan data sesi persisten** (`username` dan `displayName`) menggunakan `SharedPreferences` untuk penggunaan lintas sesi. |
| `_attemptLogin()` | Mengandung **logika validasi kredensial** multi-level. Jika otentikasi berhasil, memicu penyimpanan sesi dan transisi rute. |
| **Transisi Rute Sukses** | Menggunakan **`Navigator.pushReplacement`** untuk transisi ke `HomePage`, menggantikan `LoginPage` pada *stack* navigasi, yang merupakan praktik keamanan rute. |
| `_showDialog()` | Memberikan umpan balik status otentikasi kepada pengguna. |

---

### 3. `lib/pages/home_page.dart` (Akses Data Sesi & Integrasi Navigasi)

Halaman utama yang memverifikasi dan menampilkan data sesi yang sedang aktif.

| Bagian Kode | Fungsionalitas |
| :--- | :--- |
| `_loadUserDisplayName()` | **Mengambil data sesi** `'displayName'` dari *Local Storage* saat halaman dimuat (`initState`) untuk personalisasi *dashboard*. |
| `drawer: const SideMenu()` | Mengintegrasikan komponen **`SideMenu`** yang modular ke dalam layout utama. |
| **UI** | Menampilkan konten yang dipersonalisasi menggunakan data sesi yang berhasil diambil. |

---

### 4. `lib/widgets/side_menu.dart` (Sistem Navigasi & Logout)

Widget yang dapat digunakan kembali untuk menyediakan seluruh struktur navigasi aplikasi.

| Bagian Kode | Fungsionalitas |
| :--- | :--- |
| `_logout(context)` | **Mengakhiri sesi aktif** dengan menghapus kunci `'username'` dan `'displayName'` dari `SharedPreferences`. Menavigasi pengguna kembali ke `LoginPage` menggunakan **`pushAndRemoveUntil`** untuk *clearing* semua rute terotentikasi. |
| `ListTile` | Mendefinisikan titik navigasi ke rute-rute utama aplikasi (`HomePage`, `SettingsPage`, `AboutPage`). |

---

### 5. `lib/pages/about_page.dart` & `lib/pages/settings_page.dart`

File-file ini berfungsi sebagai contoh *routes* tambahan yang dapat diakses melalui *Side Menu*.

| Bagian Kode | Fungsionalitas |
| :--- | :--- |
| **Routing Tujuan** | Berfungsi sebagai tujuan akhir navigasi yang dipicu dari `SideMenu`. |
| `drawer: const SideMenu()` | Mempertahankan akses ke komponen navigasi `SideMenu`, menjamin konsistensi navigasi. |
---
