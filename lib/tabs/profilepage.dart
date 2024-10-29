import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_drajatdanuwardana/component/widget/toast.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/get_profile_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/providers/update_profile_providers.dart';
import 'package:sims_ppob_drajatdanuwardana/screens/loginpage.dart';

class ProfilePage extends StatefulWidget {
  final String token;

  const ProfilePage({
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController password = TextEditingController();
  var isEditing = false;

  void _cancelEditing() {
    setState(() {
      isEditing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<GetProfileProviders>(context, listen: false)
        .getPostData(context, widget.token);
  }

  @override
  Widget build(BuildContext context) {
    final updateProfileProvider = Provider.of<UpdateProfileProviders>(context);
    final getDataProfile = Provider.of<GetProfileProviders>(context);
    void _saveProfile() async {
      String fistNameInput = firstName.text;
      String lastNameInput = lastName.text;
      await Provider.of<UpdateProfileProviders>(context, listen: false)
          .getPostData(context, fistNameInput, lastNameInput, widget.token);
      if (updateProfileProvider.topupStatus == 1) {
        toastValidateSucces("Data berhasil diubah");
        isEditing = false;
        Provider.of<GetProfileProviders>(context, listen: false)
            .getPostData(context, widget.token);
        firstName.clear();
        lastName.clear();
      }
      print("Profile saved");
//       setState(() {
//  isEditing = false;
//       });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Akun",
            style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadiusDirectional.circular(20)),
                  child: Stack(children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/allassets/Profilephoto.png',
                            fit: BoxFit.cover,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                               
                                child: Container(
                                  color: Colors.red,
                                  height: 100,
                                  width: 0,
                                ),
                              ),
                              GestureDetector(
                                 onTap: () {
                                  pickImage();
                                },
                                child: Container(child: Icon(Icons.edit)))
                            ],
                          ),
                        ])
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${getDataProfile.data.data?.firstName} ${getDataProfile.data.data?.lastName}",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 330,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Email",
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: email,
                        readOnly: true,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 14, 13, 13),
                            )),
                            prefixIcon: const Icon(Icons.email),
                            prefixIconColor:
                                const Color.fromARGB(255, 14, 13, 13),
                            hintText: "${getDataProfile.data.data?.email}",
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 330,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nama depan",
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: firstName,
                        readOnly: !isEditing,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 14, 13, 13),
                            )),
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor:
                                const Color.fromARGB(255, 14, 13, 13),
                            hintText: "${getDataProfile.data.data?.firstName}",
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 330,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nama belakang",
                            style: GoogleFonts.inter(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: lastName,
                        readOnly: !isEditing,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 14, 13, 13),
                            )),
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor:
                                const Color.fromARGB(255, 14, 13, 13),
                            hintText: "${getDataProfile.data.data?.lastName}",
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: isEditing
                      ? _saveProfile
                      : () {
                          setState(() {
                            isEditing = true;
                          });
                        },
                  child: Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 245, 49, 35)),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isEditing ? "Simpan" : "Edit profile",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 245, 49, 35),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (isEditing)
                  GestureDetector(
                    onTap: _cancelEditing,
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
                            "Batalkan",
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                if (isEditing == false)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
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
                            "Log out",
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
