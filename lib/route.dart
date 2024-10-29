import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_drajatdanuwardana/tabs/home.dart';
import 'package:sims_ppob_drajatdanuwardana/screens/pembayaranpage.dart';
import 'package:sims_ppob_drajatdanuwardana/tabs/profilepage.dart';
import 'package:sims_ppob_drajatdanuwardana/tabs/topuppage.dart';
import 'package:sims_ppob_drajatdanuwardana/tabs/transaksipage.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case '/home':
       
        return MaterialPageRoute(
          builder: (_) =>  const HomePage(token: '',),
        );
      case '/topUp':
        return MaterialPageRoute(
          builder: (_) => const TopUpPage(token: '',),
        );
      case '/pembayaran':
        return MaterialPageRoute(
          builder: (_) => const PembayaranPage(token: '',),
        );
      case '/transaksi':
        return MaterialPageRoute(
          builder: (_) => const TransaksiPage(token: '',),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(token: '',),
        );
      // case '/home':
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );
      // case '/promo':
      //   return MaterialPageRoute(
      //     builder: (_) => const PromoTabScreen(),
      //   );
      // case '/success-registrasi':
      //   return MaterialPageRoute(
      //     builder: (_) => const SuccessRegistrasi(),
      //   );
      // case '/login':
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginScreen(),
      //   );
      // case '/register':
      //   return MaterialPageRoute(
      //     builder: (_) => const RegisterScreen(),
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
