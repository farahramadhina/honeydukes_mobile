# Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter #
## Farah Dhiya Ramadhina/PBP B/2206082934 ##

## A. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON? ##
Bisa, kita bisa mengambil data JSON tanpa perlu membuat model terlebih dahulu di banyak kasus, terutama saat menggunakan JavaScript atau framework yang dinamis. Tapi, membuat model biasanya lebih baik karena:
**Terdapat Struktur Data yang Jelas** 
Model membantu kita mendefinisikan struktur data secara jelas, membuat kode lebih mudah dibaca dan dipelihara.
**Validasi Data** 
Model memudahkan validasi data dan memastikan data yang kita olah sesuai dengan yang kita harapkan.
**Kemudahan dalam Pengembangan** 
Dengan model, kita bisa dengan mudah memanipulasi data, seperti melakukan query, update, atau transformasi data.

## B. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter. ##
**CookieRequest** berguna untuk mengirim atau menerima HTTP request yang membutuhkan cookie, seperti autentikasi atau menyimpan state sesi pengguna.
CookieRequest penting untuk dibagikan ke semua komponen di aplikasi Flutter karena,
**Konsistensi State**
Memastikan bahwa setiap komponen memiliki akses ke state sesi yang sama, sehingga pengguna tidak perlu login berulang kali.
**Keamanan dan Manajemen Sesi**
Mengatur cookie secara sentral memudahkan manajemen keamanan, seperti pembaharuan token atau logout dari semua komponen.

## C. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter. ##
Mekanisme Pengambilan Data JSON untuk Flutter:
**Request Data**
Menggunakan HTTP request (biasanya GET) untuk meminta data dari server atau API.
**Menerima dan Decode JSON**
Server mengirimkan balasan dalam format JSON, yang kemudian diterima oleh aplikasi Flutter.
**Parsing JSON**
Flutter kemudian melakukan parsing pada JSON tersebut, mengubahnya menjadi objek atau struktur data yang bisa digunakan dalam aplikasi.
**Menampilkan Data**
Data yang sudah diparsing ini kemudian bisa ditampilkan di UI Flutter, misalnya dalam bentuk list, card, atau tabel.

## D. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter. ##
Mekanisme Autentikasi Flutter dan Django:
**Input Data Akun** 
Pengguna memasukkan data akun (username dan password) di aplikasi Flutter.
**Kirim ke Django**
Flutter mengirimkan data tersebut ke backend Django, biasanya dengan HTTP POST request.
**Proses di Django**
Django menerima data tersebut, lalu melakukan proses autentikasi. Ini melibatkan pengecekan username dan password di database.
**Balasan dari Django**
Jika autentikasi berhasil, Django mengirimkan response sukses, mungkin dengan token atau cookie untuk sesi.
**Flutter Menampilkan Menu**
Setelah menerima konfirmasi autentikasi, Flutter kemudian menampilkan menu atau halaman berikutnya sesuai dengan hak akses pengguna.

## E. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing. ##
`TextField`	
Memungkinkan pengguna memasukkan teks. Dipakai untuk memasukkan nama pengguna dan kata sandi.
`ListView.builder`
Membuat daftar yang dapat discroll. Dipakai untuk menampilkan daftar album yang diambil
`FutureBuilder`	
Membangun widget secara asinkron. Dipakai untuk mengelola status loading, error, dan data yang tersedia.
`SizedBox`
Menambahkan ruang vertikal	
`Column`	
Menyusun komponen secara vertikal

## F. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! ##
**Membuat Halaman Login dan Mengintegrasikan Sistem Autentikasi Django**
1. Menyiapkan Django App saya di tugas sebelumnya untuk melakukan integrasi autentikasi.
2. Membuat aplikasi `authentication` dan juga meng-install library `corsheaders`.
3. Membuat sebuah fungsi `login` pada `views.py` di aplikasi django saya untuk menangani proses autentikasi login.
4. Menggunakan package `pbp_django_auth` Install package `pbp_django_auth` dan modifikasi root widget untuk menyediakan instance `CookieRequest` dengan semua komponen pada proyek di dalam file `main.dart`
5. Membuat file baru `login.dart` pada folder `lib/screens` dan mengisi file kode untuk menampilkan halaman login seperti yang sudah diajarkan di Tutorial 8.

**Membuat Model Kustom**
1. Buka `localhost:8000/json` dan copy seluruh data yg ada 
2. Buka website `Quicktype` lalu ubah name menjadi `Product`, source type menjadi `JSON` dan language menjadi `dart` lalu paste data yg sebelumnya kita ambil dari `localhost:8000/json` dan copy  code yg telah diubah di quicktype
3. Buat file baru `product.dart` pada folder `lib/models` dan isi file dengan kode yg telah kita copy dari Quicktype

**Membuat Halaman Daftar Produk**
Daftar Produk saya ditampilkan pada file `lib/screens/list_product.dart` dimana pengambilan datanya dijelaskan di Mekanisme Pengambilan Data JSON. Isi dari kode `list_product.dart` mirip dengan Tutorial 8 dengan beberapa perubahan (routing dengan halaman detail).

# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements #
## Farah Dhiya Ramadhina/PBP B/2206082934 ##

## A. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat! ##
Dalam Flutter, `Navigator` digunakan untuk mengelola tumpukan halaman atau 'routes'. 
- **`Navigator.push()`**: Metode ini digunakan untuk menavigasi ke halaman baru tanpa menghapus halaman sebelumnya dari *stack*. Maksudnya adalah seperti menambah buku ke tumpukan buku tanpa mengambil yang ada di bawahnya. Contoh penggunaannya: Misalnya, dari halaman beranda, *user* klik tombol untuk ke halaman detail. Dengan `Navigator.push()`, halaman detail ditambahkan ke tumpukan, dan pengguna dapat kembali ke beranda dengan tombol kembali.

- **`Navigator.pushReplacement()`**: Metode ini mengganti halaman saat ini dengan halaman baru dalam *stack*. Metode ini seperti mengganti buku di puncak tumpukan dengan buku lain. Contoh penggunaannya: Dalam kasus login, setelah berhasil masuk, halaman login dapat diganti dengan halaman beranda sehingga pengguna tidak kembali ke halaman login jika menekan tombol kembali.

## B. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing! ##
Flutter menyediakan berbagai widget layout untuk mengatur tampilan UI. Berikut beberapa di antaranya:

- **`Container`**: Widget serba guna untuk dekorasi, padding, dan alignment. Digunakan saat Anda ingin memberikan padding, margin, latar belakang, atau bentuk khusus pada sebagian UI.

- **`Column` dan `Row`**: Untuk layout vertikal dan horizontal. `Column` mengatur anak-anaknya secara vertikal, sedangkan `Row` secara horizontal. Sangat berguna untuk layout linier.

- **`Stack`**: Menumpuk widgets secara berlapis. Berguna untuk membuat tampilan overlay, seperti teks di atas gambar.

- **`GridView`**: Untuk membuat grid yang terdiri dari berbagai elemen. Ideal untuk galeri foto atau grid produk.

- **`ListView`**: Membuat daftar scrollable. Cocok untuk daftar yang panjang seperti feed berita atau daftar email.

## C. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut! ##
`TextFormField`
Saya memakai Text Form Field sebagai elemen input untuk semua variabel pada form karena dengan text form field, saya dapat mengimplementasikan validasi yang tepat untuk membantu memastikan bahwa data yang dimasukkan valid dan lengkap serta sesuai yang diminta (input tidak boleh kosong dan bisa saya atur syarat validitasnya misalnya untuk buntuk harga dan jumlah saya hanya menerima angka bulat karena variabel keduanya merupakan integer)

## D. Bagaimana penerapan clean architecture pada aplikasi Flutter? ##
Clean Architecture adalah pendekatan desain software yang memisahkan elemen kode menjadi lapisan terpisah, meningkatkan modularitas, ketergantungan yang lebih mudah diatur, dan lebih mudah diuji. Dalam konteks Flutter:

- **Lapisan Presentasi**: Mengandung UI dan logika presentasi. Ini termasuk Widgets dan ViewModels. Widgets menampilkan data, sedangkan ViewModels mengolah data tersebut.

- **Lapisan Bisnis (atau Domain)**: Mendefinisikan aturan bisnis dan kasus penggunaan. Ini adalah bagian inti yang tidak bergantung pada lapisan lain.

- **Lapisan Data**: Bertanggung jawab atas penyimpanan data, pengambilan data, dan API. Ini termasuk Repositories yang berkomunikasi dengan sumber data eksternal seperti API atau database lokal.

Penerapan clean architecture dalam Flutter memudahkan manajemen kode, pengujian, dan pemeliharaan aplikasi. Setiap lapisan memiliki tanggung jawabnya sendiri, memungkinkan perubahan pada satu lapisan tanpa mengganggu lapisan lain.

## E. Implementasi Checklist Tugas 8 ##
**Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru**
1. Buat berkas baru bernama `honeydukes_form.dart` pada folder screens di folder lib 
2. Buat variabel baru bernama `_formKey` ke atribut `key` milik widget `Form`
3. Mengisi widget `Form` dengan *field* dan membuat widget `Column` 
4. Membuat widget `TextFormField` yang dibungkus oleh `Padding` sebagai salah satu children dari widget `Column`. Lalu, tambahkan atribut `crossAxisAlignment` untuk mengatur alignment children dari `Column`.
5. Membuat dua  TextFormField  yang dibungkus dengan `Padding`
6. Buat tombol sebagai child selanjutnya dari `Column`. Bungkus tombol ke dalam widget `Padding` dan `Align`, agar data dapat muncul dalam *pop up* setelah tombol ditekan 

**Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.**
Menggunakan Navigator untuk berpindah-pindah halaman di mana pada halaman utama kita menggunakan `push` untuk menyimpan pada *stack* agar nantinya bisa kembali ke halaman utama
```ruby
onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HoneydukesFormPage(),
                ));
```

**Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.**
Menggunakan AlertDialog seperti ini 
```ruby
return AlertDialog(
    title: const Text('Produk berhasil tersimpan'),
    content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama: $_name'),
          Text('Harga: $_price'),
          Text('Kategori: $_category'),
          Text('Deskripsi: $_description'),
          Text('Jumlah: $_amount'),
          // Add other values if needed
        ],
      ),
    ),
```

**Membuat sebuah drawer pada aplikasi**
1. Membuat file baru pada folder widgets bernama `left_drawer.dart` dan mengimpor halaman yg navigasinya akan ada di drawer tersebut, yaitu halaman `MyHomePage` dan `ShopFormPage` 
2. Buatrouting untuk halaman yang telah diimpor di file `left_drawer.dart`
3. Masukkan bagian drawer header

# Tugas 7: Elemen Dasar Flutter #
## Farah Dhiya Ramadhina/PBP B/2206082934 ##

## A. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter? ##
Dalam pengembangan aplikasi dengan Flutter, yang merupakan *framework* dari Google untuk membuat *interface* pengguna yang indah ada platform mobile, web, dan desktop dari satu basis kode, terdapat dua jenis widget yang sangat fundamental, yaitu *stateless widget* dan *stateful widget*. 

**Stateless Widget:**
*Stateless widget* adalah widget yang tidak memerlukan *state* atau keadaan. Artinya, *stateless widget* tidak dapat tidak dapat merespons secara langsung terhadap perubahan data atau peristiwa pengguna setelah mereka dibangun. Sebuah *stateless widget* hanya menggambarkan bagaimana *interface* pengguna seharusnya terlihat pada saat pembuatannya. Contoh dari stateless widget adalah teks atau ikon yang tidak berubah ketika pengguna berinteraksi dengan aplikasi.

**Stateful Widget:**
Sebaliknya, *stateful widget* adalah widget yang dapat mempertahankan state. Artinya, *stateful widget* dapat merespons terhadap perubahan data atau peristiwa pengguna dan dapat memperbarui tampilannya sesuai dengan perubahan tersebut. *Stateful widget* sangat berguna ketika bagian dari *interface* pengguna perlu diperbarui dinamis, seperti dalam kasus formulir atau game yang keadaannya berubah berdasarkan interaksi pengguna.

Perbedaan utama antara keduanya adalah:
1. **Pengelolaan State:**
   - *Stateless widget* tidak memiliki *state internal*, sehingga tidak dapat diubah setelah dibuat.
   - *Stateful widget* memiliki *state internal* dan dapat diubah setelah dibuat, memungkinkan widget untuk memperbarui tampilan.
2. **Siklus Hidup:**
   - *Stateless widget* memiliki siklus hidup yang sederhana karena tidak perlu mengelola *state*.
   - *Stateful widget* memiliki siklus hidup yang lebih kompleks karena harus mengelola inisialisasi *state* dan pembuangan *state* ketika widget dihapus dari pohon widget.
3. **Penggunaan:**
   - *Stateless widget* digunakan untuk bagian UI yang statis dan tidak berubah.
   - *Stateful widget* digunakan untuk bagian UI yang interaktif dan dinamis.
4. **Pembangunan Kembali Widget:**
   - S*tateless widget* dibangun kembali ketika data eksternal yang mereka terima sebagai parameter berubah.
   - *Stateful widget* dapat memicu pembangunan kembali diri mereka sendiri dari dalam, menggunakan `setState()` untuk menandai bahwa *state* telah berubah.

## B. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing. ##
Dalam proyek Flutter honeydukes_mobile untuk Tugas 7, berbagai widget telah digunakan untuk membangun *interface* pengguna. Berikut adalah daftar widget tersebut beserta fungsinya:

1. **MaterialApp** : Widget ini biasanya digunakan sebagai root dari aplikasi yang menggunakan *Material Design*. Di tugas ini, widget ini tidak ditampilkan secara eksplisit, tetapi biasanya ada di atas dalam hirarki widget.
2. **Scaffold** : Widget ini menyediakan struktur dasar tata letak visual *Material Design*. Di tugas ini, ia digunakan untuk membuat struktur dasar halaman dengan *app bar* dan *body*.
3. **AppBar** : Widget ini menampilkan *app bar* di bagian atas Scaffold. Di tugas ini, ia digunakan untuk menampilkan judul halaman 'Honeydukes'.
4. **Text** : Widget ini menampilkan string teks dengan berbagai *styling*. Di tugas ini, digunakan beberapa kali untuk menampilkan judul aplikasi dan nama item pada kartu.
5. **SingleChildScrollView** : Widget ini menyediakan *scroll* pada konten yang mungkin melebihi layar. Di sini, ia digunakan untuk memastikan bahwa kolom dengan *item-item* dapat di-*scroll* jika kontennya melebihi tinggi layar.
6. **Padding** : Widget ini memberikan *padding* pada widget anaknya. Di sini, digunakan untuk memberikan jarak di sekitar konten utama dan di antara elemen-elemen di dalam kartu.
7. **Column** : Widget ini menata widget anaknya dalam bentuk kolom vertikal. Di sini, digunakan untuk menata teks judul dan *GridView*.
8. **GridView.count** : Widget ini membuat *grid* dengan jumlah kolom yang tetap. Di sini, digunakan untuk menampilkan kartu-kartu item dalam bentuk grid dengan tiga kolom.
9. **Material** : Widget ini memberikan efek visual *Material Design* pada widget anaknya. Di sini, digunakan untuk memberikan latar belakang pada kartu item.
10. **InkWell** : Widget ini menanggapi sentuhan pengguna dan menunjukkan *splash*. Di sini, digunakan untuk menanggapi ketukan pada kartu dan menampilkan *SnackBar*.
11. **Container** : Widget ini digunakan untuk menata, memposisikan, dan menambahkan *styling* pada widget anaknya. Di sini, digunakan untuk menata konten di dalam kartu.
12. **Center** : Widget ini menengahkan widget anaknya. Di sini, digunakan untuk menengahkan ikon dan teks di dalam kartu.
13. **Icon** : Widget ini menampilkan ikon dari set ikon material. Di sini, digunakan untuk menampilkan ikon yang sesuai dengan nama item pada kartu.
14. **SnackBar** : Widget ini menampilkan pesan ringan di bagian bawah layar. Di sini, digunakan untuk memberikan umpan balik ketika pengguna menekan kartu.
15. **ShopItem** : Ini bukan widget, tetapi sebuah kelas yang mendefinisikan data yang akan digunakan oleh widget ShopCard.
16. **ShopCard** : Ini bukan widget bawaan Flutter, melainkan kelas yang dibuat pengguna yang mengembalikan widget Material. Di sini, digunakan untuk menampilkan informasi dari objek ShopItem dalam bentuk kartu yang bisa diklik.

## C. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial) ##
**Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya**
1. Men-*generate* proyek Flutter baru dengan nama honeydukes_mobile pada direktori yg saya mau (disini saya taro di Desktop/PBP Farah) pada terminal, kemudian masuk ke dalam direktori proyek tersebut dengan command
`flutter create honeydukes_mobile`
`cd honeydukes_mobile`
2. Menjalankan proyek baru saya pada terminal dengan command `flutter run` (saya menggunakan google chrome) tidak lupa juga untuk meng-*enable web support* 
3. Untuk menerapkan *clean architecture* dalam pengembangan aplikasi saya, saya merapikan struktur proyek dengan cara:
- Membuat file `menu.dart` pada honeydukes_mobile/lib dan menambahkan kode ini `import 'package:flutter/material.dart';` lalu memindahkan kode baris ke-39 sampai akhir yang berisi class MyHomePage dan _MyHomePageState dari file `main.dart` ke `menu.dart`
- Karena *file* `main.dart` tidak lagi mengenali kelas MyHomePage yg sudah saya pindahkan ke file `menu.dart`, maka tambahkan kode ini pada file `main.dart`
`import 'package:honeydukes_mobile/menu.dart';`

**Membuat tiga tombol sederhana dengan ikon dan teks untuk:**
- Melihat daftar item (Lihat Item)
- Menambah item (Tambah Item)
- Logout (Logout)
1. Menghapus `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()` pada file `main.dart` 
2. Mengubah sifat widget pada halaman `menu.dart` menjadi *stateless* dengan mengganti bagian `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);` dan menghapus `final String title;` sampai bawah lalu menambahkan widget build seperti ini dibawahnya 
```ruby
@override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
```
juga menghapus fungsi *State* di bawah bagian *stateless* widget ini
3. *Define* tipe pada list untuk menambahkan item yang dijual sebelum menambahkan teks dan card seperti ini 
```ruby
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```
4. Lalu di bawah kode `MyHomePage({Key? key}) : super(key: key);` kita tambahkan kode untuk menambahkan item yang dijual (nama, harga, ikon barang, warna)
```ruby
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Color.fromARGB(255, 89, 192, 158)),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Color.fromARGB(255, 92, 166, 193)),
    ShopItem("Logout", Icons.logout, Color.fromARGB(255, 150, 41, 64)),
  ];
```
5. Tambahkan kode di bawah ini dalam widget build. Saya kustomisasi untuk merubah warna tiap tombol
```ruby
return Scaffold(
      appBar: AppBar(
        title: const Text('Honeydukes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Honeydukes Mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
```

**Memunculkan Snackbar dengan tulisan:**
- "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan.
- "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan.
- "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
1. Membuat widget *stateless* baru untuk menampilkan card
```ruby
class ShopItem {
  final String name;
  final IconData icon;
  final Color cardColor;

  ShopItem(this.name, this.icon, this.cardColor);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.cardColor,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

---- 

# honeydukes_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
