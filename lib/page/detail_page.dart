import 'package:flutter/material.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/show.dart';
import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.models});
  final Fields models;
  @override
  State<DetailPage> createState() => _DetailPageState(models);
}

class _DetailPageState extends State<DetailPage> {
  Fields models;
  _DetailPageState(this.models);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
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
            ListTile(
              title: const Text('My Watchlist'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              models.title,
              // style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Release Date: ${DateFormat.yMMMd().format(models.releaseDate)}',
              // style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Rating: ${models.rating}',
              // style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Status: ${models.watched == Watched.DONE ? 'Watched' : 'Not yet'}',
              // style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Review: ${models.review}',
              // style: TextStyle(color: Colors.blue),
            ),
            Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWatchlistPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor:
                      Colors.blue,
                      minimumSize: const Size.fromHeight(40.0),
                    ),
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}