import 'package:flutter/material.dart';

class MyPtofile extends StatefulWidget {
  const MyPtofile({super.key});

  @override
  State<MyPtofile> createState() => _MyPtofileState();
}

class _MyPtofileState extends State<MyPtofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 180, 203, 203),
          leading: const Image(
            image: AssetImage("assets/logo.png"),
          ),
          actions: const [
            Icon(
              Icons.alarm,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            )
          ],
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: const Color.fromARGB(255, 181, 212, 212),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hello, ",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          "Marjana",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Icon(Icons.person)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
