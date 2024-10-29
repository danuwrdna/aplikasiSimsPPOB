import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/register_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/screens/loginpage.dart';
import 'package:sims_ppob_drajatdanuwardana/services/services_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

bool _obscure = true;
final TextEditingController email = TextEditingController();
final TextEditingController firstName = TextEditingController();
final TextEditingController lastName = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController confirmpassword = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final postDataRegister = Provider.of<RegisterProviders>(context);
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
                  "Lengkapi data untuk \n membuat akun ",
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
                    controller: firstName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 182, 182, 182),
                        )),
                        prefixIcon: Icon(Icons.person),
                        prefixIconColor: Color.fromARGB(255, 184, 183, 183),
                        hintText: "Nama depan",
                        hintStyle: TextStyle(fontWeight: FontWeight.w100)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: lastName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 182, 182, 182),
                        )),
                        prefixIcon: Icon(Icons.person_2),
                        prefixIconColor: Color.fromARGB(255, 184, 183, 183),
                        hintText: "Nama belakang",
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
                        hintText: "Buat password",
                        hintStyle:
                            const TextStyle(fontWeight: FontWeight.w100)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    obscureText: _obscure,
                    controller: confirmpassword,
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
                        hintText: "Konfirmasi password",
                        hintStyle:
                            const TextStyle(fontWeight: FontWeight.w100)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () async {
                    final dataModelRegister = ServicesRegister();
                    String emailInput = email.text;
                    String fistNameInput = firstName.text;
                    String lastNameInput = lastName.text;
                    String passwordInput = password.text;
                    String confirmpasswordInput = confirmpassword.text;
                    if (confirmpasswordInput != passwordInput) {
                      toastValidate("Konfrimasi password salah");
                      return;
                    }

                    await Provider.of<RegisterProviders>(context, listen: false)
                        .getPostData(context, emailInput, fistNameInput,
                            lastNameInput, passwordInput);
                    print(dataModelRegister.registerProses);
                    if (postDataRegister.registerStatus == 1) {
                      toastValidateSucces("Akun berhasil didaftarkan");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                      email.clear();
                      firstName.clear();
                      lastName.clear();
                      password.clear();
                      confirmpassword.clear();
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
                          "Registrasi",
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
                                  builder: (context) => LoginPage()),
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
