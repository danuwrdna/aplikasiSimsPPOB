import 'package:flutter/material.dart';

import 'package:sims_ppob_drajatdanuwardana/providers/balance_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/banner_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/get_profile_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/login_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/pembayaran_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/register_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/services_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/top_up_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/transaksi_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/update_profile_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/screens/loginpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<RegisterProviders>(
            create: (_) => RegisterProviders()),
        ChangeNotifierProvider<GetProfileProviders>(
            create: (_) => GetProfileProviders()),
        ChangeNotifierProvider<BalanceProviders>(
            create: (_) => BalanceProviders()),
        ChangeNotifierProvider<ServicesProviders>(
            create: (_) => ServicesProviders()),
        ChangeNotifierProvider<BannerProviders>(
            create: (_) => BannerProviders()),
        ChangeNotifierProvider<TopUpProviders>(create: (_) => TopUpProviders()),
        ChangeNotifierProvider<UpdateProfileProviders>(
            create: (_) => UpdateProfileProviders()),
        ChangeNotifierProvider<PembayaranProviders>(
            create: (_) => PembayaranProviders()),
        ChangeNotifierProvider<TransaksiProviders>(
            create: (_) => TransaksiProviders())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
