import 'package:ecom_app/cart/allProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home_listview_Summersale.dart';
import '../widgets/homepg_gvw.dart';
import '../provider/apiprovider.dart';

class EHomePage extends StatefulWidget {
  const EHomePage({super.key});

  @override
  State<EHomePage> createState() => _EHomePageState();
}

class _EHomePageState extends State<EHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<DressImgPro>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    List Season = ["Summer Sale", "Winter Sale", "Mansoon Sale"];
    // ignore: non_constant_identifier_names
    List Discount = ["50% OFF", "30% OFF", "60% OFF"];
    List clr = [
      const Color.fromARGB(255, 199, 236, 200),
      const Color.fromARGB(255, 224, 219, 171),
      const Color.fromARGB(255, 220, 179, 193),
      const Color.fromARGB(255, 204, 230, 240),
    ];

    List<Map<String, dynamic>> icns = [
      {"title": "Men", "icon:": Icons.man_rounded},
      {"title": "Woman", "icon:": Icons.woman},
      {"title": "Kids", "icon:": Icons.man_3_rounded},
      {"title": "Shirts", "icon:": Icons.collections_sharp},
      {"title": "Watch", "icon:": Icons.person},
      {"title": "Shoes", "icon:": Icons.person},
      {"title": "Belts", "icon:": Icons.person},
      {"title": "more", "icon:": Icons.person},
    ];
    List imgs = [
      "assets/img5.jpg",
      "assets/img6.jpg",
      "assets/img7.jpg",
      "assets/img8.jpg",
      "assets/img9.jpg",
      "assets/img10.jpg",
    ];

    final pics = Provider.of<DressImgPro>(context, listen: true);

    return Scaffold(
      body: pics.imageurl == null
          ? const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(child: CircularProgressIndicator()),
            )
          : SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black54,
                                size: 30,
                              ),
                              hintText: "Search",
                              hintStyle: const TextStyle(
                                  color: Colors.black54, fontSize: 20),
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.location_on,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 220,
                      child: HomeListView(
                          Season: Season,
                          clr: clr,
                          Discount: Discount,
                          pics: pics),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Top Catagories",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                    ),
                    HomeCatGVw(icns: icns),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Best Sellers",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AllProducts(),
                            ));
                          },
                          child: Container(
                            height: 30,
                            width: 80,
                            color: const Color.fromARGB(255, 176, 167, 167),
                            child: const Center(
                              child: Text(
                                "See All",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imgs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 210,
                                width: 170,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 160,
                                      decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 7,
                                                offset: Offset(0, 5),
                                                color: Colors.grey)
                                          ],
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Center(
                                        child: Container(
                                          height: 170,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              image: DecorationImage(
                                                  image:

                                                      // AssetImage(imgs[index])
                                                      NetworkImage(pics
                                                          .imageurl![index]
                                                          .image),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        //drs[index]["dr"]
                                        pics.imageurl![index].title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        Text(

                                            //"(${drs[index]["rvs"].toString()} Reviews)"
                                            pics.imageurl![index].rating.rate
                                                .toString())
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        //"\$${drs[index]["price"].toString()}"

                                        "\$${pics.imageurl![index].price.toString()}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
