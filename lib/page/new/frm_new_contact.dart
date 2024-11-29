import 'package:digicapp/control/ftp/ftp_panel.dart';
import 'package:digicapp/control/help.dart';
import 'package:digicapp/control/insert.dart';
import 'package:digicapp/control/select.dart';
import 'package:digicapp/control/update.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/page/page_contact.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_location_picker/map_location_picker.dart';

import '../../../control/ftp/ftp_dialog_image_and_camera.dart';
import '../../../control/val/val_pic.dart';
import '../../../widget/btn_nav.dart';

class new_contact extends StatefulWidget {
  final List type_page;
  const new_contact({Key? key, required this.type_page}) : super(key: key);

  @override
  State<new_contact> createState() => _new_cardState();
}

// patch_: "/contact",
// name_file: "${widget.type_page[2]}p",
List<Widget> list_wiget_link = [];
List<Widget> list_add_wiget_link = [];
ValueNotifier<bool> controller1 = ValueNotifier<bool>(false);
ValueNotifier<bool> controller2 = ValueNotifier<bool>(false);
ValueNotifier<bool> controller3 = ValueNotifier<bool>(false);
ValueNotifier<bool> controller4 = ValueNotifier<bool>(false);
ValueNotifier<bool> controller5 = ValueNotifier<bool>(false);
List<bool> list_bool_val = [false, false, false, false, false];
List<int> list_bool_val_int = [0, 0, 0, 0];

class _new_cardState extends State<new_contact> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.type_page[2]);
    if (widget.type_page[0] == 1) {
      list_text_edite_val_card[7] = TextEditingController();
      list_text_stayl.add(t1);
      list_text_stayl.add(t2);
      list_text_stayl.add(t2);
      list_text_stayl.add(t2);
      list_text_stayl.add(t2);
      list_text_stayl.add(t2);
      list_bool_val_int[3] = 0;
      list_text_stayl.add(t2);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // list_text_edite_val_card[7].dispose();

    // _currentTime?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  TextStyle t1 = GoogleFonts.roboto(
    textStyle: const TextStyle(fontStyle: FontStyle.italic),
    color: Colors.black,
    fontSize: font_size_16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  TextStyle t2 = GoogleFonts.roboto(
    textStyle: const TextStyle(fontStyle: FontStyle.italic),
    color: Colors.grey.shade700,
    fontSize: font_size_14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  List<TextStyle> list_text_stayl = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      drawerScrimColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.network(
                  val_pic_png_network[15],
                  height: 90,
                  fit: BoxFit.fill,
                  width: with_screen,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Text("New Contact",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: Colors.black,
                            fontSize: font_size_20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 270,
                    child: StreamBuilder(
                        //Error number 2
                        stream: NumberCreator().stream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.connectionState == ConnectionState.done) {
                            return const Text('done');
                          } else if (snapshot.hasError) {
                            return const Text('Error!');
                          } else {
                            return btn_select_image(
                                patch_: "/contact",
                                name_file: "${widget.type_page[2]}p",
                                label_dialog: 'Select picture',
                                Type_image: 1,
                                child_: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image.network(
                                      height: 240,
                                      width: 240,
                                      "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Frame.png",
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.network("https://$address_ip/assets/assets/images/25.png",
                                            width: 70, height: 70, fit: BoxFit.fitWidth);
                                      },
                                    ),
                                    Container(
                                      width: 200,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(135.0)),
                                        image: DecorationImage(
                                          image: list_image_send_ftp[1]['imageview'],
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          }
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 190.0, left: 135),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.network(
                        height: 75,
                        width: 75,
                        "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Frame.png",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: SizedBox(
                          height: 65,
                          width: 65,
                          child: StreamBuilder(
                              //Error number 2
                              stream: NumberCreator().stream,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.connectionState == ConnectionState.done) {
                                  return const Text('done');
                                } else if (snapshot.hasError) {
                                  return const Text('Error!');
                                } else {
                                  return btn_select_image(
                                      patch_: "/contact",
                                      name_file: "${widget.type_page[2]}o",
                                      label_dialog: 'Select picture',
                                      Type_image: 0,
                                      child_: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                                          image: DecorationImage(
                                            image: list_image_send_ftp[0]['imageview'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ));
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: const Color.fromRGBO(187, 187, 201, 1),
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Name",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_contact[0],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "First",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_contact[1],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Last",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Job Title",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_contact[2],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Company",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_contact[3],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Phone",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_contact[4],
                      maxLength: 100,
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Email",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_contact[5],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Web Site",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_contact[6],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10, right: 5),
                    child: Text("Address",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: PlacesAutocomplete(
                    top: false,
                    bottom: false,
                    topCardColor: const Color.fromRGBO(245, 245, 247, 1),
                    searchController: list_text_edite_val_contact[8],
                    apiKey: 'AIzaSyAFSAQJIdM1VwsSxXZ4VQE95kOpk5ZSU2A',
                    mounted: mounted,
                    hideBackButton: true,
                    onGetDetailsByPlaceId: (PlacesDetailsResponse? result) {
                      if (result != null) {
                        setState(() {
                          val_new_contact[0] = result.result.geometry?.location.lat.toString();
                          val_new_contact[1] = result.result.geometry?.location.lng.toString();
                          val_new_contact[2] = result.result.formattedAddress;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10, right: 5),
                    child: Text("Bio",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 10),
                      child: TextField(
                        controller: list_text_edite_val_contact[7],
                        maxLength: 1000,
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Type Here",
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              color: const Color.fromRGBO(187, 187, 201, 1),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: btn_digica_1(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          lbl: "Discard")),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: btn_digica_1(
                          onPressed: () async {
                            please_waite(context);
                            if (widget.type_page[0] == 1) {
                              await insertContact(
                                  widget.type_page[2],
                                  0,
                                  list_text_edite_val_contact[0].text,
                                  list_text_edite_val_contact[1].text,
                                  list_text_edite_val_contact[3].text,
                                  list_text_edite_val_contact[2].text,
                                  list_text_edite_val_contact[4].text,
                                  list_text_edite_val_contact[5].text,
                                  val_new_contact[0],
                                  val_new_contact[1],
                                  list_text_edite_val_contact[8].text,
                                  list_text_edite_val_contact[6].text,
                                  list_text_edite_val_contact[7].text,
                                  "https://$address_ip/digic_pic/user/contact/${widget.type_page[2]}o.jpg",
                                  "https://$address_ip/digic_pic/user/contact/${widget.type_page[2]}p.jpg");
                              for (int i = 0; i < list_image_send_ftp.length; i++) {
                                if (list_image_send_ftp[i]['Type'] != "0") {
                                  await ftp.connect();
                                  final newFileName = "${list_image_send_ftp[i]['newFileName']}";
                                  print(newFileName); // Provide the new file name here
                                  final file = list_image_send_ftp[i]['file'];
                                  final renamedFile = await file.rename("${file.parent.path}/$newFileName");
                                  await ftp.uploadFile(
                                    renamedFile,
                                    sRemoteName: list_image_send_ftp[i]['sRemoteName'],
                                  );
                                  await ftp.disconnect();
                                  print("Upload successful");
                                }
                              }
                            } else if (widget.type_page[0] == 0) {
                              await update_contact(
                                  widget.type_page[1].toString(),
                                  list_text_edite_val_contact[0].text,
                                  list_text_edite_val_contact[1].text,
                                  list_text_edite_val_contact[3].text,
                                  list_text_edite_val_contact[2].text,
                                  list_text_edite_val_contact[4].text,
                                  list_text_edite_val_contact[5].text,
                                  val_new_contact[0],
                                  val_new_contact[1],
                                  list_text_edite_val_contact[8].text,
                                  list_text_edite_val_contact[6].text,
                                  list_text_edite_val_contact[7].text);
                              for (int i = 0; i < list_image_send_ftp.length; i++) {
                                if (list_image_send_ftp[i]['Type'] != "0") {
                                  await ftp.connect();
                                  final newFileName = "${list_image_send_ftp[i]['newFileName']}";
                                  print(newFileName); // Provide the new file name here
                                  final file = list_image_send_ftp[i]['file'];
                                  final renamedFile = await file.rename("${file.parent.path}/$newFileName");
                                  await ftp.uploadFile(
                                    renamedFile,
                                    sRemoteName: list_image_send_ftp[i]['sRemoteName'],
                                  );
                                  await ftp.disconnect();
                                  print("Upload successful");
                                }
                              }
                            }

                            list_text_edite_val_contact = [
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                            ];
                            val_new_contact = [
                              "",
                              "",
                              "",
                              "",
                              "",
                              "",
                            ];
                            await select_tbl_contact_card(widget.type_page[2].toString());
                            await select_tbl_card();
                            list_combo = [];

                            for (int i = 0; i < list_card.length; i++) {
                              list_combo.add(list_card[i]['card_title'].toString());
                            }
                            list_combo.add("Draft");
                            selectedItem = list_combo.first;
                            await select_tbl_card_user_id_titr(selectedItem);
                            await select_tbl_contact_card(list_card_select[0]['id_card'].toString());
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // title: Text('Save Card'),
                                  content: const Text('All your changes has been saved.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        await Get.off(const frm_contact());
                                      },
                                      child: const Text('OK'),
                                    ),
                                    //
                                  ],
                                );
                              },
                            );
                          },
                          lbl: "Save"))
                ],
              ),
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
