import 'package:ecom_app/cart/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartlist.dart';

class Cartpage extends StatefulWidget {
  final int id;
  final String title;
  final String img;
  final String price;
  final String rate;
  final String description;
  final String count;

  const Cartpage(
      {super.key,
      required this.title,
      required this.img,
      required this.price,
      required this.rate,
      required this.description,
      required this.count,
      required this.id});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  String btntext = "Add To Cart";

  @override
  Widget build(BuildContext context) {
    final addcart = Provider.of<AddCart>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.img), fit: BoxFit.contain),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(widget.rate)
                    ],
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        ("Reviews"),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "(${widget.count})",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            const Text(
                              "Price : ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w200),
                            ),
                            Text(
                              "\$${widget.price}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                      addcart.cartitem.contains(widget.id)
                          ? InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CartList(),
                                ));
                                // if (addcart.cartitem.contains(widget.id)) {
                                //   addcart.removefromcart(widget.id);
                                //   print("no");
                                // } else {
                                //   addcart.addtocart(widget.id);
                                //   print("yes");
                                // }
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 24, 11, 16),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Center(
                                      child: Text(
                                    "go to"
                                    // btntext.toString(),
                                    ,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  )),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  // if (addcart.cartitem.contains(widget.id)) {
                                  //   addcart.removefromcart(widget.id);
                                  //   print("yes");
                                  // } else {
                                  addcart.addtocart(widget.id);
                                  // print("no");
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 24, 11, 16),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Center(
                                        child: Text(
                                      "add to",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    )),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
