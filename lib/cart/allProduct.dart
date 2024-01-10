/////seeall to detailes of item

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/apiprovider.dart';
import 'singleProductScrn.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  void initState() {
    super.initState();
    Provider.of<DressImgPro>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final pics = Provider.of<DressImgPro>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(),
      body: pics.imageurl == true
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
                itemCount: pics.imageurl!.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Cartpage(
                                    img: pics.imageurl![index].image,
                                    title: pics.imageurl![index].title,
                                    rate: pics.imageurl![index].rating.rate
                                        .toString(),
                                    price:
                                        pics.imageurl![index].price.toString(),
                                    description: pics
                                        .imageurl![index].description
                                        .toString(),
                                    count: pics.imageurl![index].rating.count
                                        .toString(),
                                    id: pics.imageurl![index].id,
                                  ),
                                ));
                              },
                              child: Container(
                                height: 150,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                          pics.imageurl![index].image),
                                    ),
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  pics.imageurl![index].title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.amber[400],
                                    ),
                                    Text(
                                      pics.imageurl![index].rating.rate
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w100),
                                    ),
                                    Text(
                                        "( ${pics.imageurl![index].rating.count.toString()} Reviews)"),
                                  ],
                                ),
                                Text(
                                  "\$ ${pics.imageurl![index].price.toString()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w100),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
