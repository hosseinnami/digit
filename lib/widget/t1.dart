import 'package:digicapp/page/login/login_logo.dart';
import 'package:digicapp/widget/btn_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../control/insert.dart';
import '../control/select.dart';
import '../control/val/control_val.dart';
import '../control/val/val_list.dart';
import '../page/login/new_user.dart';

String code_insert_verify = "";

class PinputExample extends StatefulWidget {
  final String code_check;
  const PinputExample({Key? key, required this.code_check}) : super(key: key);

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 5,
              controller: pinController,
              focusNode: focusNode,

              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                return value == code_insert_verify ? null : 'Pin is incorrect';
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
                code_insert_verify = pin;
              },
              onChanged: (value) async {
                debugPrint('onChanged: $value');
                code_insert_verify = value;
                if (await myauth.verifyOTP(otp: code_insert_verify) == true) {
                  please_waite(context);
                  if (act_forget_pass[2] == true) {
                    await select_user_email(list_text_new_val_insert_user[2].text.trim());
                    await selectShopify();
                    int counter = 0;
                    for (int i = 0; i < list_user_sopify.length; i++) {
                      if (list_user_sopify[i]['email'].toString() == list_text_new_val_insert_user[2].text.trim()) {
                        counter++;
                        list_text_new_val_insert_user[0].text = list_user_sopify[i]['first_name'].toString();
                        list_text_new_val_insert_user[1].text = list_user_sopify[i]['last_name'].toString();
                        list_text_new_val_insert_user[2].text = list_user_sopify[i]['email'].toString();
                        list_text_new_val_insert_user[3].text = "";
                        list_text_new_val_insert_user[5].text = list_user_sopify[i]['phone'].toString();
                        break;
                      }
                    }
                    int email_marketing = 0;
                    if (isChecked2) {
                      email_marketing = 1;
                    } else {
                      email_marketing = 0;
                    }
                    if (list_user.isEmpty) {
                      if (counter == 1) {
                        await insert_user(
                            list_text_new_val_insert_user[0].text,
                            list_text_new_val_insert_user[1].text,
                            list_text_new_val_insert_user[2].text,
                            list_text_new_val_insert_user[3].text,
                            list_text_new_val_insert_user[5].text,
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            DateTime.now().toString(),
                            "",
                            1,
                            email_marketing);
                        await select_user_email(list_text_new_val_insert_user[2].text.toString().trim());
                        await insert_user_device_add(list_user[0]['id_user'].toString(), deviceId.toString(), DateTime.now().toString(), 1);
                      } else {
                        await insert_user_2(
                            list_text_new_val_insert_user[0].text,
                            list_text_new_val_insert_user[1].text,
                            list_text_new_val_insert_user[2].text,
                            list_text_new_val_insert_user[3].text,
                            list_text_new_val_insert_user[5].text,
                            context);
                      }
                    } else {
                      if (counter == 1) {
                        await select_user_email(list_text_new_val_insert_user[2].text.toString().trim());
                        await insert_user_device_add(list_user[0]['id_user'].toString(), deviceId.toString(), DateTime.now().toString(), 1);
                      } else {
                        await insert_user_3(
                            list_text_new_val_insert_user[0].text,
                            list_text_new_val_insert_user[1].text,
                            list_text_new_val_insert_user[2].text,
                            list_text_new_val_insert_user[3].text,
                            list_text_new_val_insert_user[5].text,
                            context);
                      }
                    }
                  } else if (act_forget_pass[1] == true) {
                    await insert_user_2(list_text_new_val_insert_user[0].text, list_text_new_val_insert_user[1].text,
                        list_text_new_val_insert_user[2].text, list_text_new_val_insert_user[3].text, list_text_new_val_insert_user[5].text, context);
                  } else if (act_forget_pass[0] == true) {}
                  Navigator.of(context).pop();
                  await ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("user is create")));

                  await Get.off(frm_login_logo());
                  print("yesssss");
                } else {}
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     focusNode.unfocus();
          //     formKey.currentState!.validate();
          //   },
          //   child: const Text('Validate'),
          // ),
        ],
      ),
    );
  }
}
