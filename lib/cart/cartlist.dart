import 'package:ecom_app/cart/cartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/apiprovider.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  bool isLoding = true;

  @override
  Widget build(BuildContext context) {
    final idlist = Provider.of<AddCart>(context, listen: true);
    final pdc = Provider.of<DressImgPro>(context, listen: true);

    idlist.productDatas = pdc;
    Provider.of<AddCart>(context, listen: false).totalPr();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: idlist.cartitem.length,
                itemBuilder: (context, index) {
                  final productId = idlist.cartitem[index];
                  final sortedProducts = pdc.imageurl!.firstWhere(
                    (p) => p.id == productId,
                  );
                  //---------------------------------------------------------------------
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => Details(n: names2[index], i: index),
                        // ));
                      },
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 7,
                                  offset: Offset(4, 7),
                                  color: Colors.grey)
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(sortedProducts.image),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      sortedProducts.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                          sortedProducts.rating.rate.toString())
                                    ],
                                  ),
                                  const Text(
                                    "Size: M",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Price : ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w200),
                                        ),
                                        Text(
                                          "\$${sortedProducts.price}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  //---------------------------------------------------------------------------
                },
              ),
              SizedBox(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Promo Code",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.copy_all),
                                hintText: "Paste Here",
                                fillColor: Color.fromARGB(255, 230, 234, 240),
                                filled: true,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Center(
                              child: Text(
                                "Apply",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Amount:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      const Text(
                        "Discount %:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      const Text(
                        "Shipping Fee:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "Total Amount: ${idlist.totalprice}",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: 350,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Text(
                              "checkout",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
