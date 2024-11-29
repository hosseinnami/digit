import 'package:digicapp/control/val/control_val.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_location_picker/map_location_picker.dart';

import '../../../control/val/val_list.dart';

class select_map extends StatefulWidget {
  const select_map({Key? key}) : super(key: key);

  @override
  State<select_map> createState() => _select_mapState();
}

double latitude = 0.0;
double longitude = 0.0;
String address = '';

class _select_mapState extends State<select_map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            Text("select map",
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: Colors.white,
                  fontSize: font_size_14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
            SizedBox()
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          MapLocationPicker(
            hideLocationButton: true,
            hideMapTypeButton: true,
            hideBottomCard: false,
            minMaxZoomPreference: const MinMaxZoomPreference(0, 21),
            apiKey: 'AIzaSyAFSAQJIdM1VwsSxXZ4VQE95kOpk5ZSU2A',
            popOnNextButtonTaped: true,
            currentLatLng: const LatLng(29.146727, 76.464895),
            onNext: (GeocodingResult? result) {
              if (result != null) {
                setState(() {
                  list_text_edite_val_card[7].text = result.formattedAddress!;
                  val_new_card[0] = result.geometry.location.lat.toString();
                  val_new_card[1] = result.geometry.location.lng.toString();
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
