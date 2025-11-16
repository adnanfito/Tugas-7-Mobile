# Tugas 7 - Pertemuan 9
Adnan Fito Dharmawan
H1D022054

Aplikasi Flutter dengan desain modern, minimalis, dan user-friendly menggunakan Material Design 3.

## Daftar Isi

- [Instalasi](#instalasi)
- [Struktur Proyek](#struktur-proyek)
- [Dokumentasi Kode](#dokumentasi-kode)
- [Screenshots](#screenshots)
- [Credentials Demo](#credentials-demo)
- [Dependencies](#dependencies)

---

## Instalasi

### Prerequisites

- Flutter SDK (versi 3.0 atau lebih tinggi)
- Dart SDK

### Langkah-Langkah

```bash
# Clone atau download project
cd tugas3

# Install dependencies
flutter pub get

# Run aplikasi
flutter run

# Build APK
flutter build apk --release
```

---

## Struktur Proyek

```
lib/
├── main.dart                 # Entry point aplikasi
├── theme.dart               # Konfigurasi tema global
└── router/
    ├── login_page.dart      # Halaman login
    ├── home_page.dart       # Halaman beranda
    ├── about_page.dart      # Halaman tentang
    └── sidemenu.dart        # Navigation drawer
```

---

## Dokumentasi Kode

### 1. theme.dart

File ini berisi konfigurasi tema global untuk seluruh aplikasi menggunakan Material Design 3.

**Komponen:**

- **Color Palette**: Mendefinisikan warna-warna utama (primaryColor: #6366F1, accentColor: #10B981, backgroundColor: #F9FAFB)
- **Text Styles**: Mendefinisikan ukuran dan gaya teks konsisten (headingLarge, headingMedium, bodyLarge, bodyMedium, bodySmall)
- **Input Decoration Theme**: Custom styling untuk TextField dengan border radius 12, padding symmetric, dan focused border berwarna primary
- **Button Styling**: Custom styling untuk ElevatedButton dengan background primaryColor, padding symmetric, dan border radius 12
- **Card Theme**: Custom styling untuk Card dengan elevation 0 dan border radius 12
- **Drawer Theme**: Custom styling untuk Drawer

Semua komponen dirancang untuk konsistensi visual di seluruh aplikasi.

---

### 2. login_page.dart

Halaman login dengan desain minimalis dan user-friendly.

**Fitur Utama:**

- **TextEditingController**: Mengontrol input text untuk username dan password
- **Password Visibility Toggle**: Icon button untuk show/hide password dengan state boolean `_isPasswordVisible`
- **Loading State**: Boolean `_isLoading` menampilkan CircularProgressIndicator saat login, button disabled saat loading
- **Input Validation**: Validasi input tidak boleh kosong sebelum submit
- **SharedPreferences Integration**: `_saveUsername()` menyimpan username ke local storage
- **Navigation**: Menggunakan `Navigator.pushReplacement()` untuk navigate ke HomePage dan prevent back navigation
- **Error Dialog**: Menampilkan AlertDialog dengan pesan error jika credentials salah

**UI Layout:**

- SafeArea wrapper untuk handle system UI
- SingleChildScrollView untuk scrollable pada device kecil
- Header dengan icon lock dalam Container dengan shadow
- Input fields dengan prefix icon dan proper spacing
- Loading button yang menampilkan spinner atau text
- Demo credentials info card

**Credentials Demo:**
- Username: atmin
- Password: atmin

---

### 3. home_page.dart

Halaman beranda menampilkan welcome greeting dan statistik pengguna.

**Fitur Utama:**

- **initState Lifecycle**: Load username dari SharedPreferences saat halaman dimuat
- **_loadUsername()**: Mengambil username dari local storage dan set state
- **Pull-to-Refresh**: RefreshIndicator dengan onRefresh callback untuk refresh data
- **Welcome Card**: Card berwarna primary dengan greeting personalisasi menggunakan nama user

**UI Components:**

- **Stats Grid**: GridView dengan 2 kolom menampilkan 4 stat cards (emoji, label, value)
- **Menu Options**: ListTile cards menampilkan menu utama dengan icon, title, subtitle, dan arrow icon
- **_buildStatCard()**: Helper function membuat stat card dengan centered layout
- **_buildMenuOption()**: Helper function membuat menu option yang konsisten

**Layout:**
- RefreshIndicator wrapper untuk pull-to-refresh
- SingleChildScrollView untuk scrollable content
- Padding dan spacing konsisten

---

### 4. about_page.dart

Halaman tentang aplikasi menampilkan informasi detail, fitur, dan developer info.

**UI Components:**

- **App Info Card**: Card berwarna primary dengan app icon, nama, dan version number
- **Feature Items**: List dari feature cards dengan emoji, title, dan description
- **_buildFeatureItem()**: Helper function membuat feature item dengan Row layout (emoji kiri, text kanan)
- **Developer Info Card**: Card menampilkan developer name, platform, version, dan tahun rilis
- **_buildInfoRow()**: Helper function membuat info row dengan label dan value

**Layout:**
- SingleChildScrollView untuk scrollable content
- Card-based layout untuk sections
- Consistent padding dan spacing
- AppBar dengan title "Tentang Aplikasi"

---

### 5. sidemenu.dart

Navigation drawer dengan user account info dan menu items.

**Fitur Utama:**

- **initState Lifecycle**: Load username saat drawer dibuka
- **UserAccountsDrawerHeader**: Built-in widget menampilkan user account dengan:
  - accountName: nama user dari SharedPreferences
  - currentAccountPicture: CircleAvatar dengan initial huruf pertama username
  - background color: primary color dengan shadow
- **Logout Functionality**: `_logout()` clear SharedPreferences dan navigate ke LoginPage menggunakan `pushAndRemoveUntil()` untuk remove semua route
- **Logout Confirmation**: AlertDialog untuk konfirmasi logout sebelum clear data

**Menu Items:**

- **_buildDrawerItem()**: Helper function membuat drawer item dengan icon, title, onTap callback, dan custom text color
- Menu items:
  - Beranda (navigate ke HomePage)
  - Tentang (navigate ke AboutPage)
  - Pengaturan
  - Bantuan
  - Keluar (show logout confirmation)

**UI Styling:**
- ListTile dengan RoundedRectangleBorder radius 8
- Icon leading dan arrow trailing
- Hover color untuk feedback
- Red color untuk logout item

---

### 6. main.dart

Entry point aplikasi yang mengatur MaterialApp configuration.

**Konfigurasi:**

```dart
MaterialApp(
  title: 'Flutter App',
  theme: AppTheme.lightTheme,        // Menggunakan theme dari theme.dart
  home: const LoginPage(),            // Halaman pertama adalah LoginPage
  debugShowCheckedModeBanner: false,  // Menghilangkan debug banner
)
```

---

## Screenshots

### Screenshot 1: Login Page
Letakkan screenshot login page di sini
- Header dengan icon lock
- Username input field dengan prefix icon
- Password input field dengan suffix icon toggle visibility
- Login button
- Demo credentials info card

```
![Screenshot 2025-11-16 120857](https://github.com/user-attachments/assets/edbd7699-73ed-441d-9313-5f50255c0a74)

```

### Screenshot 2: Home Page - Welcome Section
Letakkan screenshot home page bagian atas di sini
- Welcome card dengan greeting personalisasi
- User name dari SharedPreferences

```
![Screenshot 2025-11-16 120909](https://github.com/user-attachments/assets/c8241967-cd6a-4698-9164-0368e409d079)

```

### Screenshot 3: About Page
Letakkan screenshot about page di sini
- App info card dengan icon dan version
- Feature items dengan emoji dan description
- Developer info card
- About text

```
![Screenshot 2025-11-16 121001](https://github.com/user-attachments/assets/dc72bcf2-3ddd-4c88-8630-eda2ae6474b9)

```

### Screenshot 4: Side Menu
Letakkan screenshot side menu di sini
- UserAccountsDrawerHeader dengan avatar
- User name dan email
- Menu items (Beranda, Tentang, Pengaturan, Bantuan)
- Divider
- Logout menu

```
![Screenshot 2025-11-16 121011](https://github.com/user-attachments/assets/31b1ffb5-3f67-42ce-a7fb-a1cc65af5838)

```

---

## Credentials Demo

Untuk testing aplikasi, gunakan credentials:

```
Username: atmin
Password: atmin
```

---

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
```

### shared_preferences

Library untuk menyimpan data lokal (username) di device. Digunakan dalam:
- Login Page: menyimpan username dengan `prefs.setString('username', value)`
- Home Page: mengambil username dengan `prefs.getString('username')`
- Side Menu: mengambil username untuk ditampilkan di drawer header
- Logout: menghapus semua data dengan `prefs.clear()`

---
