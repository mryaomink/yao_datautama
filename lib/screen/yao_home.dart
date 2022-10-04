import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class YaoHome extends StatefulWidget {
  const YaoHome({super.key});

  @override
  State<YaoHome> createState() => _YaoHomeState();
}

class _YaoHomeState extends State<YaoHome> {
  final List<String> imgList = [
    "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1496171367470-9ed9a91ea931?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1581090700227-1e37b190418e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/headerdu.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 240.0,
                child: GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Card(
                            child: Image.asset(
                              'assets/images/dulogo.png',
                              fit: BoxFit.cover,
                              width: 180,
                              height: 60,
                            ),
                          ),
                        ),
                        Text("MENU: $index")
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              CarouselSlider(
                  options: CarouselOptions(autoPlay: true),
                  items: imgList.map((imagePath) {
                    return Builder(builder: (context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Image.network(imagePath));
                    });
                  }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
