# Tugas 7 : Elemen Utama Flutter

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
<br>

2. Mengubah text title dari aplikasi menjadi Program Counter dengan menuliskan kode
`home: const MyHomePage(title: 'Program Counter'),` dalam fungsi build.
<br>

3. Membuat fungsi untuk melakukan decrement pada counter:
    ```
    void _decrementCounter() {
        setState(() {
            if (_counter > 0) _counter--;
        });
    }
    ```

<br>

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
<br>

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

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
