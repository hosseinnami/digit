import 'package:digicapp/control/delete.dart';
import 'package:digicapp/control/insert.dart';
import 'package:digicapp/control/select.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/page/login/frm_check_email.dart';
import 'package:digicapp/page/login/login_logo.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:show_hide_password/show_hide_password_text_field.dart';

import '../../widget/btn_nav.dart';
import 'new_user.dart';

class frm_login extends StatefulWidget {
  const frm_login({Key? key}) : super(key: key);

  @override
  State<frm_login> createState() => _frm_loginState();
}

class _frm_loginState extends State<frm_login> {
  bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool fail_email = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login",
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    color: Colors.black,
                    fontSize: font_size_18,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
              const SizedBox(
                height: 15,
              ),
              Text("Let's get to work",
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    color: Colors.black,
                    fontSize: font_size_16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Symbols.group,
                              size: 28,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: TextField(
                                  controller: list_text_new_val_insert_user[2],
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    color: Colors.black,
                                    fontSize: font_size_16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "Email / UserName",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            // const Icon(
                            //   Icons.done,
                            //   color: const Color.fromRGBO(23, 54, 245, 1),
                            //   size: 28,
                            // ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Symbols.https,
                              size: 28,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: ShowHidePasswordTextField(
                                  hintText: "Password",
                                  controller: list_text_new_val_insert_user[3],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: fail_email,
                              child: Text("Email or password is incorrect",
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    color: Colors.red,
                                    fontSize: font_size_14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                            TextButton(
                                onPressed: () async {
                                  // if (list_text_new_val_insert_user[2].text.toString().trim().isNotEmpty) {
                                  //   await select_user_email(list_text_new_val_insert_user[2].text);
                                  //   if (list_user.isEmpty) {
                                  //     setState(() {
                                  //       fail_email = true;
                                  //     });
                                  //   } else {
                                  //     setState(() {
                                  //       fail_email = false;
                                  //     });
                                  //     act_forget_pass = [false, false, false];
                                  //     act_forget_pass[0] = true;
                                  //     Get.to(check_email());
                                  //   }
                                  // }
                                  await selectShopify();
                                },
                                child: Text("Forget Password?",
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      color: Colors.black,
                                      fontSize: font_size_14,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                    ))),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
                      child: btn_digica_1(
                          onPressed: () async {
                            if (list_text_new_val_insert_user[2].text.toString().trim().isNotEmpty &&
                                list_text_new_val_insert_user[3].text.toString().trim().isNotEmpty) {
                              //  await select_user(list_text_new_val_insert_user[2].text, list_text_new_val_insert_user[3].text);
                              //   if (list_user.isEmpty) {
                              //     setState(() {
                              //       fail_email = true;
                              //     });
                              //   } else {
                              //     setState(() {
                              //       fail_email = false;
                              //     });
                              //
                              //   }
                              if (list_text_new_val_insert_user[2].text == "Digica.Demo" &&
                                  list_text_new_val_insert_user[3].text == "m/-&RbnMy#DmGdxYo6A#(cF]") {
                                please_waite(context);
                                await select_user_email(list_text_new_val_insert_user[2].text);
                                if (list_user.isEmpty) {
                                  await insert_user("Demo", "Of Digica", "Digica.Demo", "m/-&RbnMy#DmGdxYo6A#(cF]", "123456789", "", "", "", "", "",
                                      "", "", DateTime.now().toString(), "", 1, 1);
                                  await select_user_email(list_text_new_val_insert_user[2].text);

                                  await insert_user_device_add(
                                      list_user.first['id_user'].toString(), deviceId.toString(), DateTime.now().toString(), 1);
                                } else {
                                  await delete_tbl_user_device_add_id_user2(list_user.first['id_user'].toString());
                                  await insert_user_device_add(
                                      list_user.first['id_user'].toString(), deviceId.toString(), DateTime.now().toString(), 1);
                                }

                                Navigator.of(context).pop();
                                Get.off(frm_login_logo());
                              } else if (list_text_new_val_insert_user[2].text != "Digica.Demo") {

                                myauth.setConfig(
                                    appEmail: "hosseimnami@gmail.com",
                                    appName: "Digicapp",
                                    userEmail: list_text_new_val_insert_user[2].text.trim(),
                                    otpLength: 5,
                                    otpType: OTPType.digitsOnly);
                                if (await myauth.sendOTP() == true) {
                                  await ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Digicapp OTP has been sent"),
                                  ));
                                  act_forget_pass = [false, false, false];
                                  act_forget_pass[2] = true;
                                  Get.to(check_email());

                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Oops,Digicapp OTP send failed"),
                                  ));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("The Password is Fail . . ."),
                                ));
                              }
                            }
                          },
                          lbl: "L o g i n"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have an Account?",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              color: Colors.grey.shade600,
                              fontSize: font_size_16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        TextButton(
                            onPressed: () {
                              Get.to(const new_user());
                            },
                            child: Text("Sign Up",
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  color: const Color.fromRGBO(23, 54, 245, 1),
                                  fontSize: font_size_16,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
