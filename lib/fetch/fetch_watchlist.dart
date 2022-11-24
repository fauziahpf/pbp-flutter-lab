import 'package:http/http.dart' as http;
import 'package:counter_7/model/mywatchlist.dart';
import 'dart:convert';

Future<List<MyWatchlist>> fetchWatchlist() async {
  var url = Uri.parse('http://tugas-2-sissy.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo
  List<MyWatchlist> listToDo = [];
  for (var d in data) {
    if (d != null) {
      listToDo.add(MyWatchlist.fromJson(d));
    }
  }

  return listToDo;
}