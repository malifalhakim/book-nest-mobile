Nama: M.Alif Al Hakim <br>
Kelas : C

# Tugas 7

###  Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
*State* sendiri adalah data/informasi yang digunakan oleh aplikasi. Pada *stateless widget* tidak terdapat *state*. *Stateless widget* tidak dapat berubah sendiri melalui perilaku ataupun *internal action*. *Stateless widget* hanya bisa berubah melalui *event* yang terjadi pada *parent widgets*-nya. Pada *Stateful widget* terdapat *state* sehingga ketika input data atau lokal *state* berubah UI/*Widget* juga ikut berubah.

###  Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Widget yang digunakan pada tugas ini diantaranya:
1. MyApp: Ini merupakan widget root dari aplikasi. Widget ini mengembalikan sebuah MaterialApp widget.
2. MaterialApp: MaterialApp adalah *predefined* class atau *widget* dari flutter. MaterialApp berperan sebagai sebuah *wrapper* bagi *Material Widget* lain. Pada tugas, MaterialApp mempunyai properties *title,theme, dan home*. Properties home akan mengambil widget objek yang diberikan untuk ditampilkan di *default route* aplikasi.
3. MyHomePage: Widget ini menjadi value bagi properties home pada widget MaterialApp sehingga widget ini dapat berperan sebagai *home page* bagi aplikasi. Widget ini akan mengembalikan sebuah widget Scaffold.
4. Scaffold: Widget ini menyediakan *framework* untuk mengimplementasikan *basic material visual design layout* dari aplikasi. Jadi pada widget ini kita bisa menambahkan widget seperti AppBar,SnackBar, dan lainnya. Widget ini akan menggunakan seluruh layar dari perangkat yang digunakan. Pada tugas, scaffold memiliki widget AppBar, dan beberapa widget lain di dalam *body* dari aplikasi.
5. AppBar: Widget ini berfungsi untuk menampilkan horizontal bar yang dapat menyimpan informasi seperti *title*, *button*, dan lainnya. Pada tugas AppBar terdiri dari title dengan *background color* indigo.
6. SingleChildScrollView: Widget ini merupakan sebuah kotak yang berisi satu widget yang dapat di-*scroll*. Jadi widget ini dapat berperan sebagai *wrapper*.
7. Padding: Widget ini memberikan *padding* pada anak widget (*child widget*) yang disisipkan di *widget* *padding*.
8. Column : Widget ini mengatur anak-anaknya di dalam *array* vertikal.
9. Text : Widget yang berguna untuk menampilkan teks yang ingin ditampilkan.
10. GridView.count : Widget yang berguna untuk mengubah tata letak elemen menjadi grid.
11. ShopCard : Kustom widget yang digunakan untuk menampilakan kotak yang berisi icon dan nama item. Widget ini akan mengembalikan Material Widget.
12. Material : Ini merupakan widget yang memberikan *visual touch feedback* dan *Ink Effect* untuk memberikan kesan interaktif.
13. InkWell : Sebuah widget yang merupakan area persegi yang dapat memberikan respon ketika di tekan
14. Container : Sebuah widget yang dapat berisi dan mengkombinasikan widget-widget lain seperti widget *painting*,*positioning*, dan *sizing*.
15. Icon : Widget untuk menampilkan ikon atau simbol grafis yang tersedia.
16. Center : Widget yang berguna untuk mengatur *child*-nya ke tengah dari layar yang tersedia.

###  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step
1. Membuah proyek flutter baru dengan perintah `flutter create book_nest_mobile`
2. Inisiasi git pada proyek dengan `git init`
3. Merapikan Struktur proyek dengan membuat dua file `main.dart` dan `menu.dart`
File `main.dart` berisi class MyApp yang merupakan root dari aplikasi. File `menu.dart` berisi class MyHomePage dan _MyHomePageState.
4. Ubah konfigurasi colorScheme dan parameter MyHomePage (berguna karena MyHomePage akan diubah ke stateless widget) widget pada halaman `main.dart` sehingga menjadi seperti berikut.
```
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
5. Ubah class MyHomePage pada file `menu.dart` menjadi stateless widget dan hapus state-nya. Isi dari file `menu.dart` akan menjadi seperti berikut.
```
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key); // ubah dari ({super.key, required this.title}) menjadi ({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```

6. Buat Class untuk objek item yang akan ditampilkan.
```
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```

7. Buat List berisi objek-objek item yang ingin ditampilkan sebelum fungsi widget build.
```
final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist, Colors.lightBlue),
    ShopItem("Tambah Produk", Icons.add_shopping_cart, Colors.lightGreen),
    ShopItem("Logout", Icons.logout, Colors.black),
  ];
```

8. Membuat kode widget scaffold yang akan dikembalikan. Kode berikut berisi AppBar, Judul 'Book Nest', dan Daftar Item yang telah dibuat
```
return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BookNest',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Book Nest', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
```

9. Membuat Widget yang merepresentasikan setiap Item di dalam List. Widget berisi Area yang dapat ditekan, Text, Icon, dan Warna sesuai properti objek yang telah didefinisikan.
```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
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