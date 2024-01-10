import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../provider/apiprovider.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
    required this.Season,
    required this.clr,
    required this.Discount,
    required this.pics,
  });

  final List Season;
  final List clr;
  final List Discount;
  final DressImgPro pics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Season.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: clr[index],
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Season[index],
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          Discount[index],
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Buy Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(pics.imageurl![index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
