import 'package:flutter/material.dart';
import 'package:sims_ppob_drajatdanuwardana/component/nav_item.dart';
import 'package:sims_ppob_drajatdanuwardana/tabs/home.dart';
import 'package:sims_ppob_drajatdanuwardana/tabs/profilepage.dart';
import 'package:sims_ppob_drajatdanuwardana/tabs/topuppage.dart';
import 'package:sims_ppob_drajatdanuwardana/tabs/transaksipage.dart';

class Mainpage extends StatefulWidget {
  final String token;

  const Mainpage({
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int currentIdx = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIdx);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    if (pageController.hasClients) {
      pageController.jumpToPage(page);
    }
    setState(() {
      currentIdx = page;
    });
  }

  List<Widget> widgetTabs() {
    return [
      HomePage(token: widget.token),
       TopUpPage(token: widget.token),
       TransaksiPage(token: widget.token,),
       ProfilePage(token: widget.token,),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false; // Mengatur agar tidak kembali ke halaman sebelumnya
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
          children: widgetTabs(),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                bottomNavButton("Home", Icons.home, () {
                  onPageChanged(0);
                }, currentIdx == 0),
                bottomNavButton("Top Up", Icons.account_balance_wallet, () {
                  onPageChanged(1);
                }, currentIdx == 1),
                bottomNavButton("Transaksi", Icons.receipt_long, () {
                  onPageChanged(2);
                }, currentIdx == 2),
                bottomNavButton("Profile", Icons.person, () {
                  onPageChanged(3);
                }, currentIdx == 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

