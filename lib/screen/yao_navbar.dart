import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yao_datautama/provider/screen_index_provider.dart';
import 'package:yao_datautama/screen/yao_absensi.dart';
import 'package:yao_datautama/screen/yao_home.dart';
import 'package:yao_datautama/screen/yao_profil.dart';

// ignore: must_be_immutable
class YaoNav extends StatelessWidget {
  List<dynamic> screens = [
    const YaoHome(),
    const YaoAbsensi(),
    const YaoProfil(),
  ];

  YaoNav({super.key});

  @override
  Widget build(BuildContext context) {
    final screenProvider = Provider.of<ScreenIndexProvider>(context);
    int currentScreenIndex = screenProvider.currentIndex;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: currentScreenIndex,
        onTap: (value) => screenProvider.updateScreenIndex(value),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
                (currentScreenIndex == 0) ? Icons.home : Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Absensi',
            icon: Icon(
              (currentScreenIndex == 1)
                  ? Icons.date_range
                  : Icons.date_range_outlined,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            icon: Icon((currentScreenIndex == 2)
                ? Icons.person
                : Icons.person_outline),
          ),
        ],
      ),
      body: screens[currentScreenIndex],
    );
  }
}
