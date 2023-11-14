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

# Tugas 8

### Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
Pada flutter, navigasi antar halaman diatur dengan cara kerja seperti stack. Jika digunakan Navigator.push, maka halaman yang dituju akan berada di stack teratas sehingga jika ditekan tombol 'back' / Navigator.pop, akan ditampilkan halaman sebelumnya. Sementara jika digunakan Navigator.pushReplacement(), maka halaman yang ditujua akan menggantikan route dari stack teratas sehingga jika ditekan tombol 'back'/Navigator.pop, akan ditampilkan dua halaman sebelum halaman ini dibuka.

Contoh penggunaan Navigator.push():
- Membuat suatu halaman yang dapat diakses oleh pengguna, dan ketika halaman tersebut dibuka, pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol "back".

Contoh penggunaan Navigator.pushReplacement():
- Membuat suatu halaman seperti halaman formulir sehingga ketika user telah menekan submit dan beralih ke halaman lain, user tersebut tidak bisa menekan tombol back untuk kembali ke halaman formulir

### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- Row : untuk mengatur widget yang berada di dalamnya secara horizontal
- Columns: untuk mengatur widget yang berada di dalamnya secara vertikal
- Container: untuk menyimpan sebuah widget dalam sebuah container sehingga bisa diatur padding, margin, border, background color, dan dekorasi lain.
- GridView: untuk menampilkan widget-widget di dalamnya dalam sebuah grid dengan banyak kolom tertentu
- ListView: untuk menampilkan widget-widget nya dalam sebuah kolom dan memberikan kemampuan untuk melakukan *scrolling* ketika kontennya lebih besar dari *render box*.
- Stack : untuk membuat widget berada di atas widget lain (*base widget*)
- Card: widget yang digunakan untuk menampilkan konten dalam suatu area dengan desain kotak yang teratur menyerupai kartu.
- ListTile : widget yang menyerupai row tetapi mempunyai spesialisasi dalam membuat sebuah (*row*) yang terdiri dari 3 baris teks dan optional *leading* dan *trailing* icon.

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Elemen input yang digunakan pada tugas ini adalah TextFormField. TextFormField berguna untuk membuat kolom input teks yang memungkinkan pengguna memasukkan teks. Elemen ini digunakan karena elemen ini dapat memenuhi kebutuhan input untuk objek model yang akan dibuat yang mana terdiri dari atribut string dan int. Untuk input yang ditujukan untuk meminta int, dilakukan proses validasi terlebih dahulu apakah input teks merupakan angka atau bukan.

### Bagaimana penerapan clean architecture pada aplikasi Flutter?
*Clean architecture* dapat diterapkan dengan membuat 4 *main modules*, yaitu `App`,`Domain`,`Data`, dan `Device`. Hal ini bertujuan agar dapat membagi *concers* dalam membangun sebuah aplikasi sehingga memudahkan dalam menyelesaikan masalah dan skalabilitas aplikasi. `Domain` berisi *bussiness logic* dari aplikasi. `App` berisi *user interface* dan *event handlers* dari aplikasi. `App` akan berkomunikasi dengan `Domain` dalam mengatasi suatu event. `Data` merepresentasikan *data-layer* dari aplikasi. `Data` module bertanggung jawab dalam pengambilan data. `Device` adalah modul yang berkomunikasi langsung dengan platform seperti Android dan iOS. `Device` bertanggung jawab untuk berkomunikasi dengan *native functionality* seperti GPS atau *file system*.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)!

#### Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru

1. Membuat berkas baru pada direktori `lib` dengan nama `book_form.dart`
2. Membuat tampilan halaman form yang merupakan *stateful widget*. Halaman dibuat menggunakan widget Scaffold untuk membuat halaman yang memiliki bar, input form, dan button. Input form terdiri dari 4 *field* yaitu name,price, amount, author, dan description. Button berguna untuk memvalidasi input dan nantinya untuk membuat dialog mengenai buku yang ditambahkan.
```
class BookFormPage extends StatefulWidget {
  const BookFormPage({super.key});

  @override
  State<BookFormPage> createState() => _BookFormPageState();
}

class _BookFormPageState extends State<BookFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  int _amount = 0;
  String _author = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Judul Buku",
                  labelText: "Judul Buku",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            .................
            // Input Form Lain
            ..................
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.reset();
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

```
#### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
Pada file `shop_card.dart` di folder `widgets` tambahkan navigasi ketika tombol dengan nama "Lihat Item" ditekan.
```
onTap: () {
          ......
          if (item.name == "Lihat Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListBook(),
                ));
          }
          .......
}
```

#### Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
Pada file `book_form.dart` tambahkan kode untuk menambah dialog (`showDialog`) ketika tombol `Save` ditekan.
```
// Atribut ElevatedButton 
.....
onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Item berhasil tersimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Titile: $_name'),
                                  Text('Price: $_price'),
                                  Text('Author: $_author'),
                                  Text('Amount : $_amount'),
                                  Text('Description: $_description'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      _formKey.currentState!.reset();
                    }
                  }
......
```

#### Membuat sebuah drawer pada aplikasi 
1. Buat berkas baru dalam direktori `widgets` dengan nama `left_drawer.dart`
2. Buat kerangka drawer seperti kode berikut.
```
class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
          ),
          // TODO: Bagian routing
        ],
      ),
    );
  }
}
```
3. Import halaman yang ingin dimasukkan ke dalam drawer pada file `left_drawer.dart`
```
import 'package:book_nest_mobile/screens/menu.dart';
import 'package:book_nest_mobile/screens/book_form.dart';
```

4. Memasukkan routing untuk halaman-halaman yang telah diimpor
```
// TO DO: Bagian routing
ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookFormPage(),
                  ));
            },
          ),
```

5. Menghias drawer header dengan mengubah warna, dan menambahkan teks
```
const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Book Nest',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Catat seluruh daftar bukumu di sini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
```

6. Menambahkan drawer ke halaman yang ingin ditambahkan drawer. Penambahan dilakukan dengan menambahkan parameter `drawer` pada widget halaman yang ingin ditambahkan drawer.
```
// Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
drawer: const LeftDrawer(),
```
