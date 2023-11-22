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

# Tugas 9

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Namun, pendekatan ini tidak lebih baik dibanding membuat model. Hal ini dikarenakan model dapat membantu strukturasasi data sehingga kita dapat lebih mudah mengelola dan melakukan query data. Selain itu, dengan menggunakan model, membuat kode kita menjadi lebih mudah dibaca dan dijaga.

###  Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` berfungsi untuk menyimpan informasi mengenai sesi pengguna. Dengan menggunakan `CookieRequest`, dapat dilakukan proses *holding state* sehingga user tetap berada di aplikasi walaupun berpindah-pindah halaman. *Instance* `CookieRequest` ini perlu untuk dibagikan ke semua komponen, karena:
1. Untuk mempertahankan sesi pengguna. Hal ini dilakukan untuk memastikan pengguna tetap masuk saat mereka melakukan navigasi melalui berbagai halaman. 
2. Untuk menjaga konsistensi data. Dengan berbagi instance yang sama di semua komponen, kita memastikan bahwa semua komponen bekerja dengan data *user* yang sama.

### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
1. Data diambil dengan membuat *http* *request* ke *web service* menggunakan dependensi *http*.
2. Data yang telah diambil kemudian di *decode* menjadi Data JSON.
3. Mengkonversikan setiap data di dalam json menjadi model yang sesuai dengan json yang diambil.
4. Menampilkan data yang telah dikonversi menjadi objek model ke aplikasi dengan `FutureBuilder`

### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
1. Pengguna mengisi form TextField pada aplikasi flutter. Dan disimpan data `username` dan `password`.
2. Data `username` dan `password` tersebut kemudian dikirimkan ke *web service* dengan *end point* `/auth/login`.
3. Django akan menerima request yang berisi `username` dan `password` tersebut. Django akan melakukan autentikasi terhadap `username` dan `password`.
4. Setelah dilakukan autentikasi, maka Django akan mengirimkan JsonResponse yang berisi status, dan pesan ke aplikasi Flutter. 
5. Aplikasi flutter kemudian akan memeriksa status dari response yang didapat.
6. Jika `status=True`, maka login berhasil dan user diarahkan ke halaman HomePage.
7. Jika `status=False`, maka login tidak berhasil dan ditampilkan *alert box*

###  Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
- Scaffold: Widget ini menyediakan framework untuk mengimplementasikan basic material visual design layout dari aplikasi. Jadi pada widget ini kita bisa menambahkan widget seperti AppBar,SnackBar, dan lainnya. Widget ini akan menggunakan seluruh layar dari perangkat yang digunakan. 

- AppBar: Widget ini berfungsi untuk menampilkan horizontal bar yang dapat menyimpan informasi seperti title, button, dan lainnya.

- Text : Widget yang berguna untuk menampilkan teks yang ingin ditampilkan.

- Padding: Widget ini memberikan padding pada anak widget (child widget) yang disisipkan di widget padding.

- Column : Widget ini mengatur anak-anaknya di dalam array vertikal.

- Center : Widget yang berguna untuk mengatur child-nya ke tengah dari layar yang tersedia.

- SizedBox : Widget dalam Flutter yang memaksa anaknya memiliki lebar dan tinggi yang spesifik.

- ElevatedButton : widget dalam Flutter yang digunakan untuk menampilkan tombol dengan efek elevasi saat ditekan.

- Form : widget dalam Flutter yang digunakan untuk mengelompokkan beberapa widget FormField yang berfungsi untuk mengumpulkan input dari pengguna.

- SingleChildScrollView: Widget ini merupakan sebuah kotak yang berisi satu widget yang dapat di-scroll. Jadi widget ini dapat berperan sebagai wrapper.

- TextFormField : Widget yang menyediakan input field berupa teks string.

- InputDecoration : widget dalam Flutter yang digunakan untuk menentukan tampilan dan gaya dari TextField atau TextFormField.

- FutureBuilder: Widget yang berguna untuk melakukan operasi asinkron dan memperbarui tampilan aplikasi berdasarkan hasil operasi tersebut.

- DetailItemPage : Widget stateless yang berguna untuk menampilkan detail informasi dari setiap item.

- BookFormPage : Widget statefull yang berguna untuk menampilkan dan meminta input pengguna untuk sebuah form.

- ItemPage : Widget statefull yang berguna untuk menampilkan list seluruh item. List item didapat dari proses fetch Data pada web service django.

- LoginApp : widget yang berfungsi menampilkan halaman login.

- LoginPage : widget stateful yang berfungsi sebagai halaman isi dari LoginApp

- RegisterApp : widget yang berfungsi menampilkan halaman register.

- RegisterPage : widget stateful yang berfungsi sebagai halaman isi dari RegisterApp.


###  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!
#### 1. Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
Dilakukan dengan melakukan deployment ulang dan menambahkan `@csrf_exempt` pada fungsi views login dan register.

#### 2.  Membuat halaman login pada proyek tugas Flutter.
1. Membuat LoginApp yang merupakan stateless widget yang nantinya akan berisi widget lain.
```dart
class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
```
2. Membuat LoginPage yang merupakan stateful widget. Widget ini berfungsi untuk melakukan proses logic dari login dan menampilkan halamannya.
```dart
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                //Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                final response = await request.login(
                    "https://malif-al-tugas.pbp.cs.ui.ac.id/auth/login/", {
                  'username': username,
                  'password': password,
                });

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  usernameLogIn = username;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("$message Selamat datang, $uname.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text(
                    "Tidak mempunyai akun? Daftarkan dirimu terlebih dahulu"))
          ],
        ),
      ),
    );
  }
}
```
- Pada kode ini terdapat TextFormField yang berfungsi untuk menyimpan input username atau password dari user.
- Pada kode ini juga terdapat proses melakukan permintaan login ke webservice yang mana jika login berhasil akan ditampilkan halaman homePage.

### 3.  Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
1. Membuat app `authentication` pada project Django terlebih dahulu dan menambahkannya pada `INSTALLED_APPS`. Serta menambahkan path ke `urls.py` di folder project.
2. Tambahkan requirements `django-cors-headers` dan install library nya.
3. Tambahkan `corsheaders` ke `INSTALLED_APPS` Project django.
4. Menambahkan `corsheaders.middleware.CorsMiddleware` pada main project settings.py aplikasi Django.
5. Menambahkan variabel berikut pada `settings.py` project django.
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
6. Membuat sebuah fungsi view pada `authentication/views.py` dan Menambahkannya ke `urls.py` di aplikasi `authentication`
```python
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```
7. Menginstall *package* `provider` dan `pbp_django_auth`.
8. Memberikan `CookieRequest` ke semua *child widgets* dengan menggunakan `Provider`.
```dart
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: true,
          ),
          home: const LoginPage()),
    );
  }
```
9. Pada halaman login gunakan `CookieRequest` untuk membuat permintaan login.

### 4. Membuat model kustom sesuai dengan proyek aplikasi Django.
1. Ambil data JSON yang ada pada web service dengan membuka `nama_web/json`
2. Salin data JSON tersebut ke situs web QuickType.
3. Pada situs tersebut, ubah *setup name* menjadi `Book`, source type menjadi `JSON`, dan *language* menjadi `Dart`.
4. Klik `Copy Code` pada situs tersebut.
5. Buat file baru pada direktor `lib/models/book.dart` dan tempel code yang telah dicopy ke file tersebut.

### 5. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
1. Melakukan *fetch* data dari *web service* secara asinkronus menggunakan fungsi berikut.
```dart
class _ItemPageState extends State<ItemPage> {
  Future<List<Book>> fetchProduct() async {
    // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'https://malif-al-tugas.pbp.cs.ui.ac.id/get_item/$usernameLogIn/');

    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Book> list_item = [];
    for (var d in data) {
      if (d != null) {
        list_item.add(Book.fromJson(d));
      }
    }
    return list_item;
  }
```
2. Menampilkan data yang telah diambil menggunakan fungsi diatas menggunakan `FutureBuilder` dan `ListView.builder`.
```dart
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyBook List'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) { // Jika data masih belum selesai diambil
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {  // Jika data tidak ada
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder( // Jika ada data
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailItemPage(
                                        item: snapshot.data![index])));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.name}",  // MENAMPILKAN FIELD NAMA
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                    "Amount : ${snapshot.data![index].fields.amount}"), // MENAMPILKAN FIELD AMOUNT
                                const SizedBox(height: 10),
                                Text(
                                    "Description : ${snapshot.data![index].fields.description}"), // MENAMPILKAN FIELD DESKRIPSI
                              ],
                            ),
                          )));
                }
              }
            }));
  }
```

### 6. Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
1. Pada argumen `itemBuilder` dari widget `ListView.builder` pastikan bahwa widget didalamnya berada di dalam widget `InkWell` seperti berikut.
```dart
itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailItemPage(
                                        item: snapshot.data![index])));
                          },
                          child: Container(
                            .................
                          ));
```
2. Tambahkan argumen `onTap` pada InkWell untuk menjalankan perintah ketika item ditekan.
3. Ketika ditekan maka akan diarahkan ke halaman detail item. Buat halaman detail item pada folder `lib/screens`.
4. Buat widget untuk halaman detail item dan tampilkan seluruh informasi dari item.
```dart
class DetailItemPage extends StatelessWidget {
  final Book item;

  const DetailItemPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Detail Item"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                item.fields.name, // FIELD NAMA
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Text("Author: ${item.fields.author}"), // FIELD AUTHOR
            const SizedBox(height: 12),
            Text("Price: ${item.fields.price}"), // FIELD PRICE
            const SizedBox(height: 12),
            Text("Amount: ${item.fields.amount}"), // FIELD AMOUNT
            const SizedBox(height: 12),
            Text("Description: ${item.fields.description}"), // FIELD DESKRIPSI
            const Spacer(), // Spacer untuk membuat tombol BACK di bagian bawah
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}

```
5. Tambahkan widget `ElevatedButton` yang jika ditekan akan kembali ke halaman Daftar Item.


