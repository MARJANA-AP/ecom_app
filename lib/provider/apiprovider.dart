import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/fakestoreapimodel.dart'; //to access get post etc

class DressImgPro with ChangeNotifier {
  List<FakeStoreModel>? _imageurl;
  List<FakeStoreModel>? get imageurl => _imageurl;
  String baseurl = "https://fakestoreapi.com/products";

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse(baseurl));

    if (response.statusCode == 200) {
      _imageurl = fakeStoreModelFromJson(response.body);

      notifyListeners();
    } else {
      print("error");
    }
  }
}
