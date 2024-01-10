import 'package:ecom_app/cart/allProduct.dart';
import 'package:ecom_app/provider/apiprovider.dart';
import 'package:flutter/cupertino.dart';

class AddCart with ChangeNotifier {
  final List<int> _cartitem = [];
  List get cartitem => _cartitem;
  static List cartitemprices = [];
  int? productID;
  DressImgPro? productDatas;

  double _total = 0.0;
  double get totalprice => _total;

  void addtocart(int id) {
    _cartitem.add(id);
    notifyListeners();
  }

  void removefromcart(int id) {
    _cartitem.remove(id);
    notifyListeners();
  }

  void totalPr() {
    cartitemprices = _cartitem.map((productId) {
      final product = productDatas!.imageurl!.firstWhere(
        (p) => p.id == productId,
      );
      return product.price;
    }).toList();
    _total = cartitemprices.fold(0.0, (acc, price) => acc + price);
  }
}
