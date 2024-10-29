import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';

import 'package:sims_ppob_drajatdanuwardana/providers/login_providers.dart';

import 'package:sims_ppob_drajatdanuwardana/tabs/mainpage.dart';
import 'package:sims_ppob_drajatdanuwardana/screens/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<LoginProvider>(context, listen: false).getPostData(context);
  }

  bool _obscure = true;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  Widget build(BuildContext context) {
    final postDataLogin = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/allassets/Logo.png",
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "SIMS PPOB",
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Align(
                    child: Text(
                  "Masuk atau buat akun \n untuk memulai ",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 182, 182, 182),
                        )),
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Color.fromARGB(255, 184, 183, 183),
                        hintText: "Masukkan email anda",
                        hintStyle: TextStyle(fontWeight: FontWeight.w100)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: _obscure,
                    controller: password,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 182, 182, 182),
                        )),
                        prefixIcon: const Icon(Icons.lock),
                        prefixIconColor:
                            const Color.fromARGB(255, 184, 183, 183),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscure = !_obscure;
                              });
                            },
                            icon: const Icon(Icons.lock_open)),
                        hintText: "Masukkan password anda",
                        hintStyle:
                            const TextStyle(fontWeight: FontWeight.w100)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () async {
                    String emailInput = email.text;
                    String passwordInput = password.text;
                    await Provider.of<LoginProvider>(context, listen: false)
                        .getPostData(context, emailInput, passwordInput);

                    print("bearer toke: ${postDataLogin.bearerTokenLogin}");

                    print("JOHNNNN: ${postDataLogin.loginStatus}");
                    if (postDataLogin.loginStatus == 1) {
                      final String token = postDataLogin.bearerTokenLogin;

                      toastValidateSucces("Berhasil login");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mainpage(
                                  token: token,
                                )),
                      );
                    }
                    ;
                    if (postDataLogin.data.email!.isNotEmpty) {
                      print(
                          'Login berhasil: ${postDataLogin.data.email} ${postDataLogin.data.password}');
                    } else {
                      print(
                          'Login gagal : ${postDataLogin.data.email} ${postDataLogin.data.password}');
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 245, 49, 35),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Masuk",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Belum punya akun? registrasi',
                        style: TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                      ),
                      TextSpan(
                        text: ' disini',
                        style: TextStyle(
                          color: Color.fromARGB(255, 245, 49, 35),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                      ),
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
