import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/balance_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/top_up_providers.dart';

class TopUpPage extends StatefulWidget {
  final String token;

  const TopUpPage({
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  bool isInputFilled = false;
  final TextEditingController nominalTopup = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider.of<BalanceProviders>(context, listen: false)
        .getPostData(context, widget.token);

    String _formatCurrency(String input) {
      return input.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => "${match[1]}.");
    }

    nominalTopup.addListener(() {
      final text = nominalTopup.text.replaceAll('.', '');
      if (text.isNotEmpty) {
        nominalTopup.value = nominalTopup.value.copyWith(
          text: _formatCurrency(text),
          selection:
              TextSelection.collapsed(offset: _formatCurrency(text).length),
        );
      }
    });

    nominalTopup.addListener(() {
      setState(() {
        isInputFilled = nominalTopup.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    nominalTopup.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var topUpCeban;
    var topUpDuaPuluh;
    var topUpGocap;
    var topUpCepe;
    var topUpDuaLimaPuluh;
    var topUpGope;
    final topUpProvider = Provider.of<TopUpProviders>(context);
    final getBalance = Provider.of<BalanceProviders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Top up",
            style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
          ),
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
              children: [
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
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                              getBalance.data.data?.balance != null
                                  ? NumberFormat.currency(
                                          symbol: 'Rp. ', decimalDigits: 0)
                                      .format(getBalance.data.data!.balance)
                                  : 'Rp. 0',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Silahkan masukkan",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Nominal top up",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 330,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: nominalTopup,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 182, 182, 182),
                        )),
                        prefixIcon: Icon(Icons.invert_colors_on_sharp),
                        prefixIconColor: Color.fromARGB(255, 184, 183, 183),
                        hintText: "Masukkan nominal top up",
                        hintStyle: TextStyle(fontWeight: FontWeight.w100)),
                    onChanged: (value) {
                      // Hanya panggil ketika benar-benar perlu menggunakan nilai asli
                      String nominalInput =
                          nominalTopup.text.replaceAll('.', '');

                      print("Nilai tanpa titik: $nominalInput");
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          topUpCeban = '10.000';
                          nominalTopup.text = topUpCeban;
                        },
                        child: Container(
                          height: 60,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Rp. 10.000")],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          topUpDuaPuluh = '20.000';
                          nominalTopup.text = topUpDuaPuluh;
                        },
                        child: Container(
                          height: 60,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Rp. 20.000")],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          topUpGocap = '50.000';
                          nominalTopup.text = topUpGocap;
                        },
                        child: Container(
                          height: 60,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Rp. 50.000"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          topUpCepe = '100.000';
                          nominalTopup.text = topUpCepe;
                          print(topUpCepe);
                        },
                        child: Container(
                          height: 60,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Rp. 100.000")],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          topUpDuaLimaPuluh = "250.000";
                          nominalTopup.text = topUpDuaLimaPuluh;
                        },
                        child: Container(
                          height: 60,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Rp. 250.000")],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          topUpGope = '500.000';
                          nominalTopup.text = topUpGope;
                        },
                        child: Container(
                          height: 60,
                          width: 130,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Rp. 500.000"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    String nominalInput = nominalTopup.text.replaceAll('.', '');
                    int topUpAmount = int.parse(nominalInput);

                    if (topUpAmount < 10000) {
                      toastValidate("Minimal topup 10.000");
                    } else if (topUpAmount > 1000000) {
                      toastValidate("Maximal topup 1.000.000");
                    } else {
                      await Provider.of<TopUpProviders>(context, listen: false)
                          .getPostData(context,
                              int.parse(nominalInput).toString(), widget.token);
                      print("Opup: ${topUpProvider.topupStatus}");
                      print("topup : ${widget.token}");
                      if (topUpProvider.topupStatus == 1) {
                        toastValidateSucces("Top up berhasil");
                        await Provider.of<BalanceProviders>(context,
                                listen: false)
                            .getPostData(context, widget.token);
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isInputFilled ? Colors.red : Colors.grey,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Top up",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
