import 'package:counter_7/page/detail_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/show.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/fetch/fetch_watchlist.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({Key? key}) : super(key: key);

  @override
  _MyWatchlistPageState createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  final Future<List<MyWatchlist>> futureFetch = fetchWatchlist();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('My Watchlist'),
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
        body: FutureBuilder(
            future: futureFetch,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada to do list :(",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      // SizedBox(height: 3),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> InkWell (
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      models: snapshot.data![index].fields)));
                        },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color:Colors.white,
                                border: Border.all(
                                  color: snapshot.data![index].fields.watched == Watched.DONE ?
                                    Colors.green : Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2.0
                                  )
                                ]
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: snapshot.data![index].fields.watched == Watched.DONE ? true : false,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (value!)
                                        snapshot.data![index].fields.watched = Watched.DONE;
                                      else
                                        snapshot.data![index].fields.watched = Watched.NOT_YET;
                                    });
                                  },
                                ),
                                Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Text("${snapshot.data![index].fields.watched}"),
                              ],
                            ),
                          )

                      ),
                  );

                }
              }
            }
        )
    );
  }

}

