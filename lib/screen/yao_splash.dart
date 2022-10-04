import 'dart:async';

import 'package:flutter/material.dart';

class YaoSplash extends StatefulWidget {
  const YaoSplash({Key? key}) : super(key: key);

  @override
  State<YaoSplash> createState() => _YaoSplashState();
}

class _YaoSplashState extends State<YaoSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/auth'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/dusp.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
