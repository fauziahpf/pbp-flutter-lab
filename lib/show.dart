import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';
import 'package:counter_7/main.dart';

class MyShowPage extends StatefulWidget {
  const MyShowPage({super.key});

  @override
  State<MyShowPage> createState() => _MyShowPageState();
}

class _MyShowPageState extends State<MyShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
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
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
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
      ),
    );
  }
}
