import 'package:flutter/material.dart';
import 'package:wande/pages/HomePageEva.dart';
import 'package:wande/pages/HomePageRank.dart';
import 'package:wande/pages/HomePageUser.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var currentPage = 0;
  var homePages = [HomePageEva(), HomePageRank(), HomePageUser()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homePages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            currentPage = index;
          },
          items: getNavigationItems()),
    );
  }

  getNavigationItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon_home_eva.png"),
          activeIcon: Image.asset("assets/images/icon_home_eva_checked.png"),
          backgroundColor: Colors.white,
          title: Text('评价')),
      BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon_home_rank.png"),
          activeIcon: Image.asset("assets/images/icon_home_rank_checked.png"),
          backgroundColor: Colors.white,
          title: Text('榜单')),
      BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon_home_user.png"),
          activeIcon: Image.asset("assets/images/icon_home_user_checked.png"),
          backgroundColor: Colors.white,
          title: Text('我的'))
    ];
  }
}
