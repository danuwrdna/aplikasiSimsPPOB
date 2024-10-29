import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/balance_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/banner_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/get_profile_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/login_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/services_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/screens/pembayaranpage.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  var providerLogin = LoginProvider();
  @override
  void initState() {
    super.initState();
    Provider.of<GetProfileProviders>(context, listen: false)
        .getPostData(context, widget.token);
    Provider.of<BalanceProviders>(context, listen: false)
        .getPostData(context, widget.token);
    Provider.of<ServicesProviders>(context, listen: false)
        .getPostData(context, widget.token);
    Provider.of<BannerProviders>(context, listen: false)
        .getPostData(context, widget.token);

    print(providerLogin.bearerTokenLogin);
    _startAutoScroll();
  }

  bool _isObscured = true;
  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_scrollController.position.pixels <
          _scrollController.position.maxScrollExtent) {
        _scrollController.animateTo(
          _scrollController.position.pixels + 10,
          duration: Duration(milliseconds: 100),
          curve: Curves.linear,
        );
      } else {
        _scrollController.jumpTo(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final getDataProfile = Provider.of<GetProfileProviders>(context);
    final getBalance = Provider.of<BalanceProviders>(context);
    final getServices = Provider.of<ServicesProviders>(context);
    final getBanner = Provider.of<BannerProviders>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "assets/allassets/Logo.png",
              height: 20,
              width: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "SIMS PPOB",
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Image.asset(
              "assets/allassets/Profilephoto.png",
              height: 20,
              width: 20,
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Selamat Datang",
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "${getDataProfile.data.data?.firstName ?? 'test'} ${getDataProfile.data.data?.lastName ?? 'test'}",
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset(
                        "assets/allassets/BackgroundSaldo.png",
                        height: 150,
                        width: 330,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "Saldo anda",
                            style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            children: [
                              Visibility(
                                visible: _isObscured,
                                child: Text(
                                  "Rp ******",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: !_isObscured,
                                  child: Text(
                                    getBalance.data.data?.balance != null
                                        ? NumberFormat.currency(
                                                symbol: 'Rp. ',
                                                decimalDigits: 0)
                                            .format(
                                                getBalance.data.data!.balance)
                                        : 'Rp. 0',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Lihat saldo  ',
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: _toggleVisibility,
                                    child: const Icon(
                                      Icons.lock,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 230,
                  width: 335,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.all(0.0),
                    itemCount: getServices.data.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Expanded(
                            flex: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PembayaranPage(
                                            token: widget.token,
                                          )),
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          getServices.data.data?[index]
                                                  .serviceIcon ??
                                              "",
                                        ),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            getServices.data.data![index].serviceCode ??
                                "Service Name",
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 330,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Temukan promo menarik",
                            style: GoogleFonts.inter(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              height: 168,
                              width: 330,
                              child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: getBanner.data.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final bannerData =
                                        getBanner.data.data?[index];

                                    return bannerData != null
                                        ? Card(
                                            child: Column(
                                              children: [
                                                Image.network(
                                                  bannerData.bannerImage ?? '',
                                                  height: 160,
                                                  width: 330,
                                                  fit: BoxFit.fill,
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container();
                                  }))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<String> listData;

  CardList({required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('List ${listData[0]}'),
          ),
          Divider(),
          ListView.builder(
            itemCount: listData.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listData[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
