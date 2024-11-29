import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/page/login/frm_check_email.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:phone_input/phone_input_package.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:show_hide_password/show_hide_password_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../control/val/val_list.dart';
import '../../widget/btn_nav.dart';
import 'login_page.dart';

class new_user extends StatefulWidget {
  const new_user({Key? key}) : super(key: key);

  @override
  State<new_user> createState() => _frm_loginState();
}

enum FieldType { outlined, underlined }

bool isChecked1 = false;
bool isChecked2 = false;
FieldType fieldType = FieldType.outlined;
LayerLink layerLink = LayerLink();
bool _shouldFormat = true;
bool _isFlagCircle = true;
bool _showFlagInInput = true;
bool _showArrow = true;
late List<CountrySelectorNavigator> navigators;
late CountrySelectorNavigator selectorNavigator;

class _frm_loginState extends State<new_user> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigators = <CountrySelectorNavigator>[
      const CountrySelectorNavigator.searchDelegate(),
      const CountrySelectorNavigator.dialog(),
      const CountrySelectorNavigator.bottomSheet(),
      const CountrySelectorNavigator.modalBottomSheet(),
      const CountrySelectorNavigator.draggableBottomSheet(),
      CountrySelectorNavigator.dropdown(
        backgroundColor: const Color(0xFFE7DEF6),
        borderRadius: BorderRadius.circular(5),
        layerLink: layerLink,
        showSearchInput: true,
      ),
    ];
    selectorNavigator = navigators.first;
  }

  Future<void> _checkConditions() async {
    if (isChecked2) {
      // دستورات مورد نظر زمانی که هر دو چک باکس تیک خورده‌اند
      if (list_text_new_val_insert_user[0].text.toString().trim() != "" &&
          list_text_new_val_insert_user[1].text.toString().trim() != "" &&
          list_text_new_val_insert_user[2].text.toString().trim() != "" &&
          list_text_new_val_insert_user[3].text.toString().trim() != "" &&
          list_text_new_val_insert_user[4].text.toString().trim() != "") {
        if (list_text_new_val_insert_user[3].text.toString().trim() == list_text_new_val_insert_user[4].text.toString().trim()) {

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
            //list_text_new_val_insert_user[5].text=PhoneNumber(isoCode: isoCode, nsn: nsn)
            Get.to(const check_email());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Oops,Digicapp OTP send failed"),
            ));
          }
        } else {
          Alert(
            context: context,
            type: AlertType.error,
            title: "approval of laws",
            desc: "Please confirm the rules of the site Digicaapp.",
            buttons: [],
          ).show();
        }
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Create Account",
          desc: "Please complete all required fields.",
          buttons: [],
        ).show();
      }
    } else {
      // پیغام هشدار
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must accept both checked terms & Privacy policy")),
      );
    }
  }

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
              Text("Create Account",
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
              Text(
                  "Join DIGICA today and become part of a global network committed to growth, collaboration, and a greener planet. Start saving trees while you build meaningful connections.",
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    color: Colors.black,
                    fontSize: font_size_14,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal,
                  )),
              const SizedBox(
                height: 30,
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
                                  controller: list_text_new_val_insert_user[0],
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    color: Colors.black,
                                    fontSize: font_size_16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "First name",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
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
                                  controller: list_text_new_val_insert_user[1],
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    color: Colors.black,
                                    fontSize: font_size_16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "Last name",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Symbols.email,
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
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    labelStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Symbols.phone,
                              size: 28,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: PhoneInput(
                                  defaultCountry: IsoCode.CA,
                                  onChanged: (val) {
                                    list_text_new_val_insert_user[5].text = "+${val!.countryCode.toString()}${val!.nsn.toString()}";
                                    print(list_text_new_val_insert_user[5].text);
                                  },
                                  showArrow: true,
                                  shouldFormat: true,
                                  validator: PhoneValidator.compose([PhoneValidator.required(), PhoneValidator.valid()]),
                                  showFlagInInput: true,
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(color: Colors.grey, fontSize: 22),
                                    // labelText: 'Phone number',
                                  ),
                                  countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
                                ),
                              ),
                            ),
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
                                  hintText: "Confirm Password",
                                  controller: list_text_new_val_insert_user[4],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: isChecked1,
                            activeColor: Colors.black,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked1 = value ?? false;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 5), // فاصله ۵ پیکسل بین Checkbox و متن
                        SizedBox(
                          width: with_screen - 100,
                          child: Text(
                            "I agree to recieve updates and special Offers.",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                                    color: Colors.black,
                                    fontSize: font_size_12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: isChecked2,
                            activeColor: Colors.black,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked2 = value ?? false;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "I agree",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: Colors.black,
                                  fontSize: font_size_12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                          ),
                        ),
                        TextButton(
                            onPressed: () async {
                              final Uri url = Uri.parse("https://www.digica.app/policies/terms-of-service");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              "Terms",
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                                      color: const Color.fromRGBO(23, 54, 245, 1),
                                      fontSize: font_size_12,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.underline, // افزودن خط زیر متن
                                      decorationColor: const Color.fromRGBO(23, 54, 245, 1),
                                      decorationThickness: 1.5, // تنظیم ضخامت خط (اختیاری)
                                    ),
                              ),
                            )),
                        Text(
                          "and",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: Colors.black,
                                  fontSize: font_size_12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                          ),
                        ),
                        TextButton(
                            onPressed: () async {
                              final Uri url = Uri.parse("https://www.digica.app/policies/privacy-policy");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              "Privacy policy",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                                      color: const Color.fromRGBO(23, 54, 245, 1),
                                      fontSize: font_size_12,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.underline, // افزودن خط زیر متن
                                      decorationColor: const Color.fromRGBO(23, 54, 245, 1),
                                      decorationThickness: 1.5, // تنظیم ضخامت خط (اختیاری)
                                    ),
                              ),
                            )),
                        Text(
                          ".",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: Colors.black,
                                  fontSize: font_size_12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
                      child: btn_digica_1(onPressed: _checkConditions, lbl: "Sign Up"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do you have an account?",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              color: Colors.grey.shade600,
                              fontSize: font_size_16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        TextButton(
                            onPressed: () {
                              Get.to(const frm_login());
                            },
                            child: Text("Login",
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  color: const Color.fromRGBO(23, 54, 245, 1),
                                  fontSize: font_size_16,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                )))
                      ],
                    ),
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
