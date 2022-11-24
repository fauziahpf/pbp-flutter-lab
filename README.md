Fauziah Putri Fajrianti - 2106707435 - EZ

Kelas PBP A
<br>



# Tugas 7 : Elemen Dasar Flutter

Fauziah Putri Fajrianti - 2106707435 - EZ

Kelas PBP A
<br>

## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

- Stateless Widget merupakan widget yang tidak dapat mengubah state-nya selama runtime aplikasi Flutter. Oleh karena itu, tampilan dan properti tetap tidak berubah sepanjang lifetime widget tersebut.
- Stateful widget merupakan widget yang dapat mengubah state-nya selama runtime aplikasi Flutter. Widget ini memungkinkan objek state yang dapat berubah seiring waktu dan memicu UI rebuild dari widget, seperti tampilan dan properti.

<br>
Perbedaan dari stateless widget dan stateful widget:

- Stateless widget dapat berguna ketika state tidak bergantung pada widget lain, sedangkan stateful widget berguna ketika state perlu berubah secara dinamis.
- Stateless widget tidak dapat di-update selama runtime aplikasi, sehingga external events diperlukan sebagai trigger. Stateful widget dapat di-update selama runtime.
- Contoh stateless widget adalah teks, icons, icon buttons, dan raised buttons, sedangkan contoh dari stateful widget adalah slider, radio button, form, dan text field.


## 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. Text, yakni widget untuk menampilkan text. Pada tugan 7 ini, berfungsi untuk menampilkan text GANJIL/GENAP dengan styling tertentu, counter, dan title dari aplikasi.
2. Padding, yakni widget yang menampilkan child-nya dengan padding tertentu. Pada tugas 7 ini, berfungsi untuk memberi padding pada row yang berisi floating buttons dan untuk memberi padding pada floating button untuk decrement counter.
3. Row, yakni widget yang menampilkan child-nya ke tata letak yang horizontal. Pada tugas 7 ini, berfungsi untuk menempatkan floating button untuk increment dan decrement counter secara horizontal.
4. FloatingActionButton, yakni widget untuk membuat floating button yang memicu aksi tertentu ketika ditekan. Pada tugas 7 ini, digunakan untuk memicu increment counter dan decrement counter.
5. Expanded, yakni widget yang meng-expand tempat child sehingga child tersebut bisa mengisi ruang yang tersedia di sumbu utama (horizontal maupun vertikal). Pada tugas 7 ini, expanded berfungsi untuk meng-expand child dalam Row, yakni berisi floating action button untuk increment/decrement counter.
6. Align, yakni widget untuk meng-align posisi elemen dengan alignment tertentu. Pada tugas 7 ini, bergungsi untuk menetapkan alignment left bottom untuk floating action button decrement dan menetapkan alignment right bottom untuk floating action button increment.


## 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() berfungsi menginformasikan Flutter atas perubahan dari state. Flutter kemudian akan menjalankan build kembali (rebuild) dan memperlihatkan perubahan yang dilakukan atas state dalam aplikasi. Dalam tugas ini, variabel yang terdapat oleh setState() adalah variabel _text dan variabel _counter.  


## 4. Jelaskan perbedaan antara const dengan final.
<b>final</b> merupakan modifier untuk meng-identifikasi sebuah variable agar tidak dapat diganti nilainya (immutable) dan inisiasi variabelnya tidak harus dilakukan saat compile time, sedangkan <b>const</b> merupakan modifier yang hampir mirip dengan <b>final</b> tetapi inisiasi variabelnya harus dilakukan saat compile time untuk kemudian tidak dapat diubah lagi nilainya. 


## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat sebuah program Flutter baru dengan nama counter_7 dengan menjalankan perintah
`flutter create counter_7`

2. Mengubah text title dari aplikasi menjadi Program Counter dengan menuliskan kode
`home: const MyHomePage(title: 'Program Counter'),` dalam fungsi build.

3. Membuat fungsi untuk melakukan decrement pada counter:
    ```
    void _decrementCounter() {
        setState(() {
            if (_counter > 0) _counter--;
        });
    }
    ```

4. Menambahkan kode di bawah ini (sebagai children dari Column) untuk mengubah text beserta stylingnya jika nilai counter adalah ganjil atau genap.
    ```
    if (_counter % 2 == 1)
                const Text(
                    'GANJIL',
                    style: TextStyle(color: Colors.blue),
                )
                else (
                const Text(
                    'GENAP',
                    style: TextStyle(color: Colors.red))
                ),
    ```

5. Menambahkan kode di bawah ini (dalam body) untuk membuat FloatingActionButton yang memicu increment dan decrement dari counter.
    ```
    floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
            if (_counter > 0)
            Expanded(
                child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                    ),
                ),
                ),
            ),
            Expanded(
            child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
                ),
            )
            )
        ],
        )
    )
    ```
    - Membuat widget Padding (untuk memberi padding sebesar 20.0) dengan child berupa Row dengan alignment spaceAround pada main axis.
    - Membuat children dalam Row berupa dua widget Expanded. Widget Expanded yang pertama berfungsi untuk membuat FloatingActionButton untuk decrement counter dengan alignment bottom left. Button ini akan muncul jika nilai _counter > 0, sedangkan widget Expanded yang kedua berfungsi untuk membuat FloatingActionButton untuk increment counter dengan alignment bottom right.

<br>

# Tugas 8 : Flutter Form

## 1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
- `Navigator.push`, akan menggantikan halaman pada top of stack dengan halaman baru. Dapat menggunakan tombol back karena memiliki halaman sebelumnya yang dapat diakses oleh navigator dengan `pop`.

- `Navigator.pushReplacement`, akan menimpa (seperti stack) halaman pada top of stack dengan halaman baru.

## 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- `Drawer` berfungsi sebagai menu drawer untuk pindah ke tampilan atau page lain
- `TextFormField` berfungsi untuk ask input text
- `Form` -> Membuat sebuah container untuk dijadikan parent dari input input yang dideklarasikan
- `ListTile` -> component yang didalamnya juga bisa digunakan widget
- `Padding` berfungsi untuk menampilkan child-nya dengan padding tertentu. 
- `Row` berfungsi untuk  menampilkan child-nya ke tata letak yang horizontal. 
- `Column` berfungsi untuk  menampilkan child-nya ke tata letak yang vertikal. 
- `DropdownButtonTextField` berfungsi untuk membuat form field untuk user memilih input
- `Text` berfungsi untuk menampilkan text
- `TextStyle` berfungsi untuk melakukan styling terhadap text
- `Container` berfungsi sebagai tempat untuk menampung komponen
- `TextButton` berfungsi untuk membuat tombol dengan text tertentu

## 3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
- `onChanged`, event yang trigger saat widget mengalami perubahan, seperti saat text ditulis oleh user
- `onPressed`, event yang muncul saat button ditekan oleh user
- `onSaved`, event yang muncul saat form telah disimpan
- `onTap`, event yang muncul saat widget dipencet oleh user

## 4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator bekerja mirip dengan implementasi stack. Halaman yang sedang dilihat oleh user berada pada bagian stack paling atas.

- `push` untuk membuat halaman baru menjadi top of stack dan halaman lama bukan top of stack lagi

- `pop` untuk mengganti halaman ke halaman sebelumnya

- `pushReplacement` untuk menggantikan halaman pada top of stack dengan halaman baru yang kemudian akan menjadi top of stack.

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Menambahkan file form.dart untuk page Form Budget dan file show.dart untuk page Data Budget
2. Menambahkan drawer dalam build pada main.dart, form.dart, dan show.dart, yang berfungsi untuk navigasi  ke page lainnya.
    ```
    drawer: Drawer(
        child: Column(
            children: [
              // Menambahkan clickable menu
              ListTile(
                title: const Text('counter_7'),
                onTap: () {
                  // Route menu ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyShowPage()),
                  );
                },
              ),
            ],
          ),
        ),
    ```
3. Membuat class Budget yang berisi dengan atribut-atribut dari form budget tersebut dan constructornya.
    ```
    class Budget {
        String judulBudget;
        int nominalBudget;
        String jenisBudget;
        static List<Budget> listBudget = [];

        Budget(String this.judulBudget, int this.nominalBudget, String this.jenisBudget);
    }
    ```
4. Membuat validator untuk memeriksa apakah text field numerik untuk input nominal budget.
5. Membuat form dalam halaman Form Budget dengan menambahkan widget-widget seperti seperti TextFormField, DropdownButtonFormField, TextButton, dan lain-lain seperti yang sudah dijelaskan pada soal nomor 2. Sebagai contoh, berikut untuk kode yang membuat input Judul Budget:
    ```
    TextFormField(
        decoration: InputDecoration(
            hintText: "Judul",
            labelText: "Judul",
            // Menambahkan icon agar lebih intuitif
            icon: const Icon(Icons.assignment_ind),
            // Menambahkan circular border agar lebih rapi
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            ),
        ),
        // Menambahkan behavior saat nama diketik
        onChanged: (String? value) {
            setState(() {
            _judulBudget = value!;
            });
        },
        // Menambahkan behavior saat data disimpan
        onSaved: (String? value) {
            setState(() {
            _judulBudget = value!;
            });
        },
        // Validator sebagai validasi form
        validator: (String? value) {
            if (value == null || value.isEmpty) {
            return 'Judul tidak boleh kosong!';
            }
            return null;
        },
        ),
    ```

6. Menambahkan data-data dari budget melalui ListView Builder:
    ```
    ListView.builder(
          itemCount: Budget.listBudget.length,
          itemBuilder: (BuildContext build, int index) {
            return Card(
              child: Column(children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Budget.listBudget[index].judulBudget,
                        style: const TextStyle(fontSize: 20.0),
                    ),

                  ),

                  ),
                ),
                Container(
                  child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                                Budget.listBudget[index].nominalBudget.toString(),
                                style: const TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              Budget.listBudget[index].jenisBudget,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ),

                  ]),
                  )
                )
              ]),
            );
          },
        ),
    ```

<br>

# Tugas 9 : Integrasi Web Service pada Flutter

## 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Data JSON dapat diambil tanpa harus membuat model terlebih dahulu. Hal ini dikarenakan JSON sudah berisi data yang bisa diakses. Akan tetapi, tanpa adanya model, akan mempersulit kita dalam mengakses dan menyimpan data-data tersebut. Dengan adanya model, kita bisa menggunakan variable untuk merepresentasikan data pada JSON sehingga lebih mudah untuk menyimpan dan mengakses data-data di dalamnya.

## 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- `FutureBuilder`, Widget yang mengakses suatu list dari hasil fetch suatu website JSON. Dalam proyek ini, akan mengakses list hasil dari fetch website endpoint JSON.
- `InkWell`, Widget suatu kotak yang bisa diclick untuk navigasi ke page yangn berisi detail-detail lain dari film.
- `Checkbox`, Widget untuk membuat suatu checkbox dimana user dapat menchecklist atau tidak kotak tersebut sehingga dapat mengubah value dan status dari `Watched` suatu film
- `CircularProgressIndicator`, Widget yang menunjukkan proses loading suatu lingkaran yang berputar dalam melakukan loading terhadap data-data dari endpoint JSON.

## 3. Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
- Membuat model dari data endpoint JSON dengan menggunakan website `Quicktype`
- Memasang dependensi `http` pada proyek Flutter supaya bisa melakukan `http request` berupa fetch untuk mendapatkan data-data JSON sehingga bisa dilakukan parsing dan dikembalikan dalam suatu list yang nantinya akan diakses oleh `FutureBuilder`
- Mengakses data-data dari `FutureBuilder` menggunakan `snapshot` dan dilakukan indexing menggunakan index beserta fields dan variabel yang ingin diakses berdasarkan model yang telah dibuat.

## 4. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
1. Menambahkan ListTitle pada drawer di setiap halaman aplikasi untuk menavigasi menuju halaman `MyWatchlistPage`
2. Membuat model `MyWatchlist` berisi atribut fields yang sama dengan objek watchlist yang ada pada endpoint JSON di Django dari Tugas 3, dengan bantuan QuickType.
3. Menambahkan dependensi HTTP pada proyek melalui perintah `flutter pub add http` pada terminal proyek Flutter untuk menambahkan package http
4. Menampilan data-data film dari endpoint JSON di Heroku pada halaman `MyWatchlistPage`, yakni berupa judul-judul film yang ditampilkan secara vertikal menggunakan `FutureBuilder`
5. Menavigasi pengguna ke halaman `DetailPage` berisi detail film ketika salah satu film dari halaman `MyWatchlistPage` di-klik. 
6. Menambahkan tombol `Back` pada setiap halaman `DetailPage` yang menampilkan detail film, untuk kembali ke halaman `MyWatchlistPage`.

<br>

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
