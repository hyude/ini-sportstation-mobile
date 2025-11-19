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

## Tugas 9
### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan `Map<String, dynamic>` tanpa model (terkait validasi tipe, null-safety, maintainability)?
Membuat model Dart penting untuk:
1. Validasi Tipe (Type Safety)
Dart adalah bahasa typed, sehingga membuat model akan membuat setiap field memiliki data type yang pasti. Jika kita langsung menggunakan `Map<String, dynamic>`, maka kita tidak akan mendapat peringatan kalau ternyata tipe-nya salah. Akibatnya, sulit untuk melacak bug.

2. Null-safety dan menghindari Runtime Crash
Jika ada data yang null dan kita melakukan operasi terhadap data tersebut, ada kemungkinan crash. Oleh karena itu, perlu ada model agar kita dipaksa untuk cek apakah suatu field Nullable atau tidak

3. Maintainability (Scalability)
Seiring aplikasi membesar, JSON response juga ikut membesar. Jika semua komponen memakai `Map<String, dynamic>`, maka data menjadi tidak terstruktur, sulit dilakukan refactoring, tidak jelas key apa saja yang tersedia, dan hal buruk lainnya. Membuat model membuat struktur data menjadi tersentralisasi dan self-documenting.

4. Mengurangi Typo Bug
Jika kita menggunakan `Map<String, dynamic>`, ada kemungkinan kita type saat melakukann mapping key. Apabila kita menggunakan model data, maka compiler bisa langsung mendeteksi kesalahan type kita

5. Mudah untuk Serialisasi (Mengirim Data)
Jika kita menggunakan `Map<String, dynamic>`, maka kita harus menuliskan setiap field satu per satu ketika melakukan `request.post()`. Sedangkan, model dart hanya perlu menggunakan `model.toJson()`.

6. Lebih mudah untuk dites menggunakan Unit Test
Penggunaan model dart memudahkan kita untuk Unit Test menggunakan `test()`, dibanding menggunakan `Map<String, dynamic>` yang parsing-nya tersebar.

### Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
`http` adalah package umum untuk melakukan request ke API. Fungsi `http` antara lain:
- Mengirim request GET, POST, PUT, DELETE
- Tidak menyimpan cookie secara otomatis
- Tidak menyimpan session login
- Tidak otomatis mengirimkan CSRF token
- Tidak punya integrasi dengan Django Auth
`http` sebaiknya digunakan untuk API publik yang tidak butuh login, memuat data open API, dan request sederhana lainnya yang tidak terikat session.

`CookieRequest` berasal dari `pbp_django_auth`. Fungsi `CookieRequest` antara lain:
- Menyimpan cookie Django session setelah login
- Mengirim cookie otomatis di setiap request
- Mendukung login/logout Django
- Menangani CSRF token secara otomatis
- Terintegrasi dengan Provider untuk state login
`CookieRequest` sebaiknya digunakan ketika API backend perlu autentikasi seperti login untuk menggunakan fitur-fitur yang perlu login (misal create product).

Jadi secara singkat, perbedaan utama perannya adalah `http` cocok digunakan untuk API publik yang tidak perlu login, `CookieRequest` cocok digunakan untuk API login-protected yang perlu login.

### Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
1. Informasi login/session konsisten di seluruh aplikasi. Berdasarkan arsitektur Flutter, maka setiap page ada widget (instance) baru. Jika setiap halaman membuat instance `CookieRequest` baru, maka session tidak konsisten, CSRF token hilang, dan eror-eror autentikasi lainnya. Oleh karena itu, harus ada **satu instance global** yang dibagikan dan dipakai oleh semua halaman.

2. Perubahan state login bisa di-listen oleh seluruh widget. `CookieRequest` adalah ChangeNotifier sehingga setiap kali login sukses, logout dipanggil, atau session berubah, maka `notifyListeners()` akan dipanggil. Semua widget yang menggunakan `context.watch<CookieRequest>()` akan otomatis rebuild.

3. Performa tetap optimal dengan menghindari re-login dan repeated fetch jika setiap halaman membuat object baru

4. `CookieRequest` harus disimpan di `Provider` (root level) agar state terjaga meski pindah halaman dan hidup selama aplikasi berjalan.

### Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
1. Mengapa perlu menambahkan `10.0.2.2` pada `ALLOWED_HOSTS`?
Karena `localhost` pada Android emulator adalah `localhost` pada emulator itu sendiri, bukan `localhost` pada laptop (yaitu `localhost:8000`). Android emulator menyediakan alias `10.0.0.2` sebagai localhost komputer host. Jadi setiap permintaan dari Flutter ke Django akan dikenali oleh Django sebagai host `10.0.0.2`. Secara default, Django akan menolak host yang tidak ada di `ALLOWED_HOSTS`, oleh karenanya kita perlu menambahkan `10.0.0.2` di `ALLOWED_HOSTS`. Jika tidak ditambahkan, maka Django akan melempar error
```python
Bad Request: Invalid HTTP_HOST header: '10.0.2.2:8000'
```

2. Mengapa kita perlu mengaktifkan CORS?
CORS (Cross-Origin Resource Sharing) diperlukan karena Flutter (aplikasi mobile/JS-like environment) mengakses API Django dari domain berbeda. Jika tidak diaktifkan, maka:
- Request GET bisa ditolak dengan error CORS.
- Request POST/PUT/DELETE bisa gagal pada preflight (OPTIONS request).
- Cookie login tidak dikirim, sehingga login gagal, session tidak tersimpan, dan endpoint lainnya yang butuh autentikasi selalu unauthorized.

3. Mengapa kita perlu mengatur Cookie `SameSite`?
Flutter mengirim cookie login untuk setiap request, sehingga Django harus mengizinkannya. Cookie modern bersifat strict sehingga cookie dari cross-origin (Flutter → Django) tidak akan dikirim kecuali `SameSite=None` dan `Secure=True`. Jika tidak diatur, maka `CookieRequest` tidak bisa mempertahakan session loginnya. Contohnya adalah bisa login, namun saat pindah halaman maka selalu dianggap logout. Endpoint yang memerlukan login akan selalu membalas
```python
403 Forbidden (CSRF Error)
```
atau
```python
401 Unauthorized
```

4. Mengapa kita perlu menambahkan izin internet di Android `AndroidManifest.xml`?
Secara default, Emulator Android tidak memiliki izin internet untuk aplikasi kecuali diaktifkan. Tanpa izin ini, Flutter tidak bisa login, fetch data, mengirim POST, dan lainnya. Jika tidak ditambahkan, maka semua request akan gagal dengan error
```python
SocketException: Failed host lookup
```

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. User mengisi input di Flutter
Misalkan user mengisi form tambah produk, widget yang menerima input biasanya adalah `TextFormField`, `Checkbox` dan lainnya. Saat user klik tombol Submit, Flutter mengumpulkan data dari controller dan memegang data dalam bentuk variabel Dart.

2. Flutter mengirim data JSON ke backend via `CookieeRequst` atau `http`
Jika menggunakan `CookieRequest` (untuk endpoint yang butuh login atau session), maka `CookieRequest` akan mengirim request POST dan menyertakan cookie session serta secara otomatis menyimpan cookie dari server.

Jika menggunakan `http` (tanpa login atau cookie), maka cookie tidak disimpan.

3. Django menerima request
Saat request masuk, Djanngo akan:
- Melakukan validasi HTTP method
- Mengambil body JSON (parsing)
- Jika endpoint butuh login, maka Django akan membaca cookie `sessionid` yang dikirim oleh `CookieRequest`. Jika valid maka user diizinkan. Jika tidak maka Django akan membalas `401 Unauthorized`.
- Menyimpan data ke database. Misalkan
```python
product = Product(name=name, price=price)
product.save()
```

4. Backend merespons ke Flutter
Server Django mengirim status sukses atau gagal ke Flutter seperti:
```python
{
  "status": "success",
  "id": 12,
  "name": "Bola",
  "price": 50000
}
```
atau
```python
{
  "status": "error",
  "message": "Invalid price"
}
```

5. Flutter menerima response
Flutter mendapatkan JSON dan melakukan parsing. Jika menggunakan `CookieRequest`, maka sudah dalam bentuk `Map`. Jika menggunakan `http`, maka perlu parsing manual.
```dart
final data = jsonDecode(response.body);
```

6. Mapping reponse ke model Dart
Data dari JSON yang diterima diubah menjadi model Dart
```dart
final product = Product.fromJson(data);
```
Penggunaan model disini untuk type-safety, null-safety, dan kelebihan-kelebihan lainnya seperti yang sudah dijelaskan di pertanyaan sebelumnya

7. Menyimpan ke state
Data yang sudah berbentuk model akan dimasukkan ke state (misalkan via `setState`). Jika menggunakan `FutureBuilder`, maka state secara otomatis diperbarui setelah future selesai
```dart
setState(() {
  products.add(product);
});
```
8. Flutter melakukan render data ke widget
Setelah state berubah, Flutter akan rebuild UI. Misalkan pada `GridView`
```dart
GridView.builder(
  itemCount: products.length,
  itemBuilder: (context, index) {
    final p = products[index];
    return Text(p.name);
  },
);
```
Flutter disini akan mapping setiap produk ke widget.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Berikut adalah penjelasan mekanisme autentikasi dari sisi Flutter dan Django.
1. Register
a. Flutter
  - User mengisi form register berupa username, password, dan password diulang.
  - Saat tombol submit (register) di-klik, flutter akan mengirim suatu request ke Django
b. Django
  - Menerima request dari Flutter dan membaca body JSON tersebut
  - Validasi apakah data tersebut valid. Misal apakah username sudah ada atau password sudah valid.
  - Membuat user baru
  - Mengembalikan response status (berupa sukses atau error)
c. Flutter
  - Mendapatkan response dari Django
  - Menampilkan hasil dari response tersebut. Apabila sukses maka dia pindah ke halaman login, jika tidak maka akan error

2. Login
a. Flutter
  - User mengisi form login berupa username dan password
  - Dengan `CookieRequest`, Flutter mengirim request ke Django berisi username dan password yang diisi. Request menggunakan login() sehingga otomatis menyimpan cookie dari Django dan menyetel header yang dibutuhkan. Kemudian dia akan menyimpan status login dalam atribut request.loggedIn,
b. Django
  - Menerima request dari Flutter dan membaca body JSON
  - Mencari username dan verifikasi password
  - Memanggil login jika valid. Disini Django akan membuat session di database dan memberikan cookie `sessionid` pada response
  - Mengirim JSON berupa status dan message
c. Flutter
  - Flutter menerima response dari Django
  - `CookieRequest` membaca cookie `sessionid`, menyimpannya dalam memori Flutter, menandai `loggedIn = true`. 
  - Semua request berikutnya otomatis mengirimkan session cookie sehingga user tidak perlu mengirim username/password berulang
  - User diarahkan ke halaman utama karena `request.loggedIn == true`

3. Akses halaman yang perlu login
a. Flutter
  - Setiap Flutter memanggil API yang membutuhkan login, `CookieRequest` akan otomatis menambah header `sessionid`
b. Django
  - Django middleware akan membaca cookie tersebut. Django akan memeriksa `request.user.is_authenticated`
  - Django akan mengirim response sesuai berhasil tidaknya request tersebut

4. Logout
a. Flutter
  - User klik tombol Logout
  - Flutter mengirim request logout ke Django
b. Django
  - Menerima request dari Flutter
  - Melakukan logout(request) yang menghapus session di database dan mengirim response yang menghapus cookie session
c. Flutter
  - Flutter menerima response
  - `CookieRequest` mengubah status `request.loggedIn` menjadi false dan cookie dibersihkan
  - Mengarahkan user ke halaman login

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
SETTING APPS AUTHENTICATION
- Membuat apps `authentication` yang berfungsi untuk autentikasi pada Flutter dengan `python manage.py startapp authentication`
- Menambahkan `authentication` ke `INSTALLED_APPS` di `settings.py`

SETTING CORS-HEADERS dan ALLOWED_HOSTS
- Menambahkan `django-cors-headers` ke `requirements.txt`
- Install `cors-header` menggunakan `pip install -r requirements.txt`
- Menambahkan `corsheaders` ke `INSTALLED_APPS` di `settings.py`
- Menambahkan `corsheaders.middleware.CorsMiddleware` ke `MIDDLEWARE` pada main project `settings.py`
- Menambahkan variabel-variabel penting ke `settings.py`
- Menambahkan `10.0.0.2` ke `ALLOWED_HOSTS`

LOGIN DAN REGISTER PADA AUTHENTICATION
- Menambahkan fungsi `login` dan `register` pada `views.py`
- Menambahkan endpoint `login` dan `register` pada `urls.py`

INTEGRASI SISTEM AUTENTIKASI
- Install `provider` dan `pbp_django_auth` pada Flutter
- Menambahkan `Provider` pada `main.dart`
- Menambahkan halaman login `login.dart` dan register `register.dart` pada `screens/`

MEMBUAT MODEL DART
- Membuat model Dart dari `Quicktype`
- Copy model Dart ke `models/product_entry.dart`

FETCH DATA DARI DJANGO DAN INTEGRASI PRODUCT DETAIL (READ)
- Install `http` pada Flutter
- Setting Android agar bisa mengakses internet
- Menambahkan fungsi `proxy_image` pada `views.py`
- Menambahkan `product_detail.dart` ke `screens/`
- Menambahkan `product_entry_card.dart` untuk card product pada `screens/`
- Menambahkan `product_entry_list.dart` untk list all product pada `screens/`
- Mengubah redirection pada halaman utama

CREATE PRODUCT
- Mengubah `productlist_form.dart` agar bisa mengirim data ke Django

LOGOUT
- Menambahkan fungsi `logout` di `views.py`
- Menambahkan path untuk `logout` di `urls.py`
- Menambahkan button logout pada `menu.dart` di Flutter