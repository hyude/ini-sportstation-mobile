# ini_sportstation

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tugas 7
### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget!
Widget tree adalah struktur hierarki yang menunjukkan bagaimana widget saling tersusun satu sama lain dalam sebuah aplikasi Flutter. Analoginya adalah silsilah keluarga. Di bagian atas adalah induk (parent) dan bawahnya adalah anak (child). Setiap anak bisa mempunyai anak lagi.

Hubungan parent-child (induk-anak):
1. Parent mengatur layout child. Contoh:

```dart
Center(
  child: Text("Ini anak!"),
)
```

2. Child mewarisi konteks dari parent seperti Theme, MediaQuery, dan lainnya. Contoh:

```dart
Text(
  "Ini anak",
  style: Theme.of(context).textTheme.headlineMedium,
)
```

3. Parent memanggil build() child dengan membuat dan menempatkan child ke dalam tree saat build() dijalankan.

### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

1. `Scaffold`
- Fungsi umum: Menyediakan kerangka dasar halaman aplikasi (seperti `AppBar`, `Body`, dan lainnya)
- Fungsi pada proyek: Menjadi wadah utama seluruh tampilan halaman

2. `AppBar`
- Fungsi umum: Menampilkan sesuatu di bagian atas layar
- Fungsi pada proyek: Menampilkan judul "Ini Sportstation"

3. `Padding`
- Fungsi umum: Memberikan jarak di sekitar widget child (anak)
- Fungsi pada proyek: Memberi jarak 16 px (pixel) di sekililing `Column` utama agar tidak menempel di tepi layar

4. `Column`
- Fungsi umum: Menyusun widget secara vertikal (atas ke bawah)
- Fungsi pada proyek: Menyusun `Row` info user, `SizedBox`, dan `Center`

5. `Row`
- Fungsi umum: Menyusun widget secara horizontal (kiri ke kanan)
- Fungsi pada proyek: Menyusun 3 `InfoCard` berupa NPM, Nama, dan Kelas

6. `SizedBox`
- Fungsi umum: Memberikan ruang kosong dengan ukuran tertentu
- Fungsi pada proyek: Memberi jarak vertikal antara `Row` info user dan bagian bawahnya

7. `Center`
- Fungsi umum: Menempatkan widget child (anak) di tengah area yang tersedia
- Fungsi pada proyek: Memusatkan kolom berisi teks sambutan ("Selamat datang di Ini Sportstation") dan grid item

8. `Text`
- Fungsi umum: Menampilkan teks statis di layar
- Fungsi pada proyek: Menampilkan judul seperti "Ini Sportstation", "NPM", dan lainnya.

9. `GridView.count`
- Fungsi umum: Menampilkan daftar widget dalam bentuk grid (baris dan kolom)
- Fungsi pada proyek: Menampilkan 3 `ItemCard` (All Products, My Products, Create Product) dalam 3 kolom

10. `Card`
- Fungsi umum: Membuat kotak dengan elevation (bayangan) untuk menonjolkan konten
- Fungsi pada proyek: Digunakan dalam InfoCard untuk menampilkan informasi NPM, Nama, dan Kelas

11. `Container`
- Fungsi umum: Wadah untuk menata posisi, ukuran, padding, atau dekorasi
- Fungsi pada proyek:
    - Di `InfoCard`: Memberi padding dan mengatur lebar tiap kartu
    - Di `ItemCard`: Mengatur tata letak ikon dan teks di dalam kartu

12. `Material`
- Fungsi umum: Memberi efek material design (seperti warna dan bentuk) pada widget
- Fungsi pada proyek: Memberi warna latar belakang dan sudut melengkung pada setiap `ItemCard`

13. `InkWell`
- Fungsi umum: Menangani interaksi touch dan menampilkan efek ripple (gelombang)
- Fungsi pada proyek: Membuat setiap `ItemCard ` dapat ditekan, lalu memunculkan `SnackBar`

14. `Icon`
- Fungsi umum: Menampilkan ikon dari library Icons.
- Fungsi pada proyek: Menampilkan ikon belanja, toko, dan tanda tambah di setiap `ItemCard`

15. `SnackBar`
- Fungsi umum: Menampilkan pesan singkat di bagian bawah layar
- Fungsi pada proyek: Ketika user menekan salah satu `ItemCard` (button "All Products" dan di sampingnya), menampilkan pesan “Kamu telah menekan tombol (nama button)"

16. `ScaffoldMessenger`
- Fungsi umum: Mengelola tampilan `SnackBar` di layar
- Fungsi pada proyek: Mengontrol kapan `SnackBar` ditampilkan dan menyembunyikan yang lama sebelum menampilkan yang baru

17. `EdgeInsets`
- Fungsi umum: Mengatur nilai jarak (padding/margin) secara spesifik (atas, bawah, kiri, kanan)
- Fungsi pada proyek: Memberi jarak di `Padding`, `Container`, dan `Text`

18. `MediaQuery`
- Fungsi umum: Mendapatkan ukuran layar dan informasi konteks layout
- Fungsi pada proyek: Menyesuaikan lebar kartu `InfoCard` berdasarkan lebar layar

19. `ItemHomepage`: Custom Widget yang digunakan sebagai model data sederhana untuk menyimpan `name` dan `icon` dari tiap menu grid

20. `InfoCard`: Custom widget untuk menampilkan informasi pengguna (NPM, Nama, Kelas) dalam bentuk kartu

21. `ItemCard`: Custom widget untuk menampilkan menu grid interaktif dengan warna dan icon

22. `runApp()`: Titik masuk utama aplikasi Flutter dan memasang (mount) widget yang diberikan ke layar

23. `MyApp`: Widget utama yang membangun struktur dan tema aplikasi

24. `MaterialApp`: Menjadi root dari aplikasi berbasis Material Design

25. `ThemeData`: Menentukan theme (tema) global (warna, gaya tombol, teks, dan lainnya)

26. `ColorScheme.fromSwatch`: Membuat scheme (skema) warna berdasarkan satu warna dasar (primarySwatch)

27. `MyHomePage`: Home screen (halaman utama) aplikasi

### Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Fungsi widget `MaterialApp`:
1. Mengatur tema aplikasi seperti warna utama, font, dan lainnya
2. Mengatur halaman awal (home)
3. Mengatur navigasi antar halaman dengan menyediakan sistem routing untuk pindah halaman
4. Menyediakan struktur Material Design global seperti `Scaffold`, `AppBar`, dan lainnya
5. Mengatur konfigurasi aplikasi seperti `title`, locale (untuk bahasa), debug, dan lainnnya

Widget `MaterialApp` menjadi widget root karena hampir semua aplikasi Flutter menggunakan design dari komponen Material Design, membutuhkan tema (theme) global yang konsisten, dan membutuhkan sistem navigasi yang rapi. Selain itu, `MaterialApp` juga menjadi titik awal suatu aplikasi.

### Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
`StatelessWidget` adalah widget yang tidak memiliki state (keadaan) yang berubah setelah dibuat sehingga ketika sudah di-build, tampilannya akan selalu sama (statis). Sedangkan, `StatefulWidget` adalah widget yang memiliki state (keadaan) yang dapat berubah selama aplikasi berjalan, dan ketika state berubah, UI akan di-rebuild secara otomatis.

Perbedaan yang mendasar dari keduanya adalah sebagai berikut:<br>
`StatelessWidget`
- Bersifat statis
- Data diterima lewat constructor
- Rebuild hanya ketika parent mengirim data baru
- Contoh: `Text`, `Icon`, `Container`

`StatefulWidget`
- Bersifat dinamis
- Data disimpan di objek state (`State<T>`)
- Rebuild menggunakan `setState()`
- Contoh: `Checkbox`, `TextField`, `Slider`

Pemilihan salah satunya bergantung pada jenis tampilan yang diinginkan. Jika tampilan yang diinginkan hanya menampilkan data tanpa perubahan atau layout statis, maka bisa menggunakan `StatelessWidget`. Jika tampilan yang diinginkan adalah tampilan yang bergantung pada input user atau variable yang berubah (seperti mengganti warna, memunculkan pesan), bisa menggunakan `StatefulWidget`.

### Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
`BuildContext` adalah objek yang merepresentasikan posisi sebuah widget di dalam widget tree. Sederhananya, `BuildContext` memberi tahu di mana widget ini berada di widget tree Flutter.

`BuildContext` penting dalam Flutter karena dengan `BuildContext`, Flutter dapat:
1. Menemukan parent atau ancestor suatu widget. Misalkan mencari `Theme` dari suatu widget dengan `Theme.of(context)`.
2. Membuat widget aware terhadap lingkungan sekitarnya. Contohnya adalah widget bisa tahu ukuran layar, warna tema, dan lainnya.
3. Membantu navigasi antar halaman karena `Navigator` perlu `context`
4. Memisahkan tanggung jawab antar bagian UI karena setiap widget punya `BuildContext`-nya masing-masing.

Setiap kali Flutter menggunakan build(), ada parameter `BuildContext` context di dalamnya. Parameter context disini menunjukkan posisi widget yang sedang dibangun dalam tree serta dapat digunakan untuk mengakses data dari ancestor (misal membutuhkan `Theme`)

###  Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah suatu fitur di Flutter yang dapat memasukkan perubahan source code (biasanya UI) ke aplikasi tanpa harus mengulang seluruh proses build dan **tanpa menghapus state** yang sedang berjalan. Jadi kita tidak perlu menjalankan `flutter run` berulang kali, cukup dengan menuliskan `r` (untuk hot reload) pada terminal, maka source code akan berubah.

Cara kerja hot reload:
1. Flutter hanya memuat ulang file Dart yang berubah
2. Kernel runtime Flutter mengganti kode lama dengan kode baru di memori
3. Framework kemudian build() ulang widget yang terpengaruh
4. State (nilai variabel di `StatefulWidget`) tetap dipertahankan

Sedangkan, hot restart memulai ulang aplikasi dari awal, tanpa rebuild penuh seperti menjalankan `flutter run`, tetapi **menghapus semua state** yang tersimpan di memori. Jadi perbedaan dasarnya dengan hot reload adalah hot reload menyimpan state, hot restart tidak.

## Tugas 8
### Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
`Navigator.push()` **menambahkan halaman baru di atas halaman sebelumnya** di dalam stack navigasi. Karena halaman tetap ada di bawah halaman baru, maka user bisa kembali ke halaman lama menggunakan tombol back. Sedangkan, `Navigator.pushReplacement()` **mengganti halaman saat ini dengan halaman baru**. Karena halaman lama diganti dengan halaman baru, maka user tidak bisa kembali ke halaman lama.

Pada Football Shop saya (Ini Sporstation), sebaiknya `Navigator.push()` digunakan ketika user menekan tombol yang memang bisa dilakukan Back. Contohnya adalah ketika user klik tombol "Tambah Produk", maka yang digunakan adalah `Navigator.push()` agar saat user tidak jadi menambahkan produk, user dapat klik tombol Back untuk kembali ke halaman sebelumnya.

Adapun `Navigator.pushReplacement()` sebaiknya digunakan ketika user sebaiknya tidak bisa melakukan tombol Back. Contohnya adalah ketika user selesai mengisi form produk dan menekan save, maka yang digunakan adalah `Navigator.pushReplacement()` agar user tidak bisa kembali ke form produk yang tadi diisi.

### Bagaimana kamu memanfaatkan hierarchy widget seperti `Scaffold`, `AppBar`, dan `Drawer` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
`Scaffold` berfungsi sebagai kerangka utama (layout skeleton) untuk setiap halaman dan mengatur posisi `Drawer`, `AppBar`, dan lainnya. `AppBar` adalah bagian atas halaman yang biasanya berisi judul halaman, tombol navigasi, dan aksi-aksi tambahan lainnya (seperti search dan setting). `Drawer` adalah menu navigasi samping (muncul saat user klik ikon menu berupa tiga garis horizontal) yang biasa berisi `ListTile` untuk pindah halaman.

Pada Football Shop saya (Ini Sportstation), setiap halaman dibangung menggunakan `Scaffold` sebagai kerangka utama. Masing-masing halaman memiliki `AppBar`-nya sendiri tergantung dengan apa yang dapat user lakukan di halaman tersebut. Jika `AppBar` ingin dibuat seragam, maka kita bisa memubat suatu widget yang berisi `AppBar` (misalkan `buildAppBar()`) dan memanggil `buildAppBar()` pada setiap `AppBar` yang ingin kita buat. Jika `Drawer` ingin dibuat seragam, kita bisa membuat suatu widget yang berisi `Drawer` (misalkan `AppDrawer()`) dan memanggil `Drawer` tersebut di setiap halaman yang membutuhkan `Drawer`.

Contohnya adalah pada `app_drawer.dart` yang berisi:
```dart
import 'package:flutter/material.dart';
import 'package:ini_sportstation/menu.dart';
import 'package:ini_sportstation/create_product_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Ini Sportstation',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Halaman Utama
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),

          // Tambah Produk
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Tambah Produk'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateProductPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

pada halaman utama `menu.dart` kita hanya perlu memanggil drawer tersebut dengan

```dart
...
drawer: const AppDrawer(),
...
```

untuk menggunakan widget `Drawer` yang sudah dibuat.

### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
1. `Padding`
- Fungsi: Memberi jarak antar elemen agar tampilan tidak terlalu rapat dan nyaman dilihat
- Kelebihan:
  - Meningkatkan readability
  - Memberi ruang visual antar elemen form
  - Membantu menjaga konsisten layout di seluruh halaman
- Contoh pada aplikasi:
```dart
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'Selamat datang di Ini Sportstation',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            )
```
`Padding` tersebut bertujuan agar teks "Selamat datang di Ini Sportstation" tersebut berjarak dengan elemen lainnya

2. `SingleChildScrollView`
- Fungsi: Membuat halaman dapat di-scroll saat konten melebihi tinggi layar (overflow)
- Kelebihan:
  - Mencegah overflow pada halaman yang panjang
  - Responsif di semua perangkat, baik mobile maupun tablet
  - Memastikan user bisa mengakses seluruh field
- Contoh pada aplikasi:
```dart
SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Nama: ${_nameController.text}'),
                Text('Harga: ${_priceController.text}'),
                Text('Deskripsi: ${_descriptionController.text}'),
                Text('Thumbnail URL: ${_thumbnailController.text}'),
                Text('Kategori: $_selectedCategory'),
                Text('Featured: ${_isFeatured ? "Ya" : "Tidak"}'),
              ],
            ),
          )
```
`SingleChildScrollView` tersebut berguna agar user bisa scroll ke bawah apabila form melebihi tinggi layar (overflow)

3. `ListView`
- Fungsi: Mirip `Column`, tetapi bisa di-scroll dan lebih efisien untuk banyak elemen dinamis
- Kelebihan:
  - Tidak perlu dibungkus `SingleChildScrollView`
  - Lebih efisien untuk daftar panjang sepert daftar produk
  - Mendukung lazy loading (hanya render elemen yang tampak di layar)
- Contoh penggunaan pada aplikasi (belum ada untuk saat ini karena tidak ada produk):
```dart
body: ListView.builder(
  padding: const EdgeInsets.all(16.0),
  itemCount: products.length,
  itemBuilder: (context, index) {
    final product = products[index];
    return Card(
      child: ListTile(
        title: Text(product.name),
        subtitle: Text('Rp ${product.price}'),
      ),
    );
  },
)
```
`ListView` tersebut berguna untuk menampilkan daftar produk yang berisi nama dan harga produk tersebut

### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
1. Menentukan palette warna brand
Primary color dari Football Shop Ini Sportstation versi Web menggunakan warna hijau rumput, maka primary color dari Ini Sportstation versi Mobile juga berwarna hijau rumput agar memberikan kesan lapangan hijau. Adapaun secondary color yang digunakan adalah warna hitam dan accent color adalah abu-abu sesuai dengan Ini Sportstation versi Web

2. Mengatur warna global di `ThemeData` dengan mengubah bagian ini di `main.dart`:
```dart
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.blueAccent[400]),
      )
```
bagian `ColorScheme.fromSwatch()` dapat diubah menjadi `ColorScheme.fromSeed()` agar bisa menentukan `seedColor` (warna dasar brand), `primary` (warna utama), `secondary` (warna sekunder), dan lainnya.

3. Menggunakan warna dari `Theme` pada widget seperti:
```dart
color: Theme.of(context).colorScheme.primary
```
Hal ini bertujuan agar setiap widget dapat menyesuaikan dengan tema warna global.