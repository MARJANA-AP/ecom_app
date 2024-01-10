import 'package:flutter/material.dart';

class HomeCatGVw extends StatelessWidget {
  const HomeCatGVw({
    super.key,
    required this.icns,
  });

  final List<Map<String, dynamic>> icns;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: icns.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 1, mainAxisSpacing: 1),
      //can add padding to container otherthan this
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
                height: 50,
                width: 50,
                child: Icon(icns[index]["icon:"]),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(100))),
            Text(icns[index]["title"]),
          ],
        );
      },
    );
  }
}
