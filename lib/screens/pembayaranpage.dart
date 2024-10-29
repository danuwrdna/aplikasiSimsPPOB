import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/balance_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/pembayaran_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/services_providers.dart';

class PembayaranPage extends StatefulWidget {
  final String token;

  const PembayaranPage({
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final TextEditingController pembayaran = TextEditingController();
  @override
  void initState() {
    super.initState();

    Provider.of<ServicesProviders>(context, listen: false)
        .getPostData(context, widget.token);
    Provider.of<BalanceProviders>(context, listen: false)
        .getPostData(context, widget.token);
  }

  @override
  Widget build(BuildContext context) {
    final getBalance = Provider.of<BalanceProviders>(context);
    final getServices = Provider.of<ServicesProviders>(context);
    final getPembayaran = Provider.of<PembayaranProviders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Pembayaran",
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
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            "Rp ${getBalance.data.data?.balance.toString()}",
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
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
                        "Pembayaran",
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
                      child: Row(
                        children: [
                          Image.network(
                            '${getServices.data.data?[0].serviceIcon}',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${getServices.data.data?[0].serviceCode}",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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
                    readOnly: true,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 14, 13, 13),
                        )),
                        prefixIcon: const Icon(Icons.invert_colors_on_sharp),
                        prefixIconColor: const Color.fromARGB(255, 14, 13, 13),
                        hintText: "${getServices.data.data?[0].serviceTariff}",
                        hintStyle:
                            const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    await Provider.of<PembayaranProviders>(context,
                            listen: false)
                        .getPostData(
                            context,
                            getServices.data.data?[0].serviceCode ?? "",
                            widget.token);

                    if (getPembayaran.pembayaranStatus == 1) {
                      toastValidateSucces("Pembayaran berhasil");

                      Provider.of<BalanceProviders>(context, listen: false)
                          .getPostData(context, widget.token);
                          
                    Navigator.pop(context);

                    }
                  },
                  child: Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 245, 49, 35),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bayar",
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
