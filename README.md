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
