import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/balance_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/transaksi_providers.dart';

class TransaksiPage extends StatefulWidget {
  final String token;

  const TransaksiPage({
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  int clickCounter = 5;
  @override
  void initState() {
    super.initState();
    clickCounter = 5;
    Provider.of<TransaksiProviders>(context, listen: false)
        .getPostData(context, widget.token, clickCounter);
    Provider.of<BalanceProviders>(context, listen: false)
        .getPostData(context, widget.token);
  }

  void _incrementCounter() {
    setState(() {
      clickCounter += 1; // Increase counter by 1 on button click
    });
  }

  @override
  Widget build(BuildContext context) {
    final getBalance = Provider.of<BalanceProviders>(context);
    final transaksiProvider = Provider.of<TransaksiProviders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Transaksi",
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
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
                            )),
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
                        "Transaksi",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 350,
                        height: 300,
                        child: Container(
                          child: ListView.builder(
                              padding: EdgeInsets.all(10),
                              itemCount:
                                  transaksiProvider.data.data?.records?.length,
                              itemBuilder: (context, index) {
                                final record = transaksiProvider
                                    .data.data?.records?[index];

                                return record != null
                                    ? Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                              color: const Color.fromARGB(
                                                  255, 221, 220, 220)),
                                        ),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      ' ${record.transactionType == "TOPUP" ? '+' : '-'}${NumberFormat.currency(symbol: 'Rp. ', decimalDigits: 0).format(record.totalAmount)}',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            record.transactionType ==
                                                                    "TOPUP"
                                                                ? Colors.green
                                                                : Colors.red,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      ' ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(record.createdOn ?? ""))}',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.grey[700],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  record.transactionType ?? "",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                    : CircularProgressIndicator();
                              }),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    _incrementCounter();
                    Provider.of<TransaksiProviders>(context, listen: false)
                        .getPostData(context, widget.token, clickCounter);
                  },
                  child: Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Show more",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
