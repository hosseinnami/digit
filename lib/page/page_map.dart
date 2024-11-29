import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/widget/btn_nav.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';

class frm_map extends StatefulWidget {
  const frm_map({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<frm_map> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page_navig = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          MapLocationPicker(
            apiKey: 'AIzaSyAFSAQJIdM1VwsSxXZ4VQE95kOpk5ZSU2A',
            liteModeEnabled: false,
            hideBackButton: true,
            hideBottomCard: true,
            popOnNextButtonTaped: true,
            hideMapTypeButton: true,
            currentLatLng: const LatLng(43.642567, -79.387054),
            onNext: (GeocodingResult? result) {
              if (result != null) {
                setState(() {
                  address = result.formattedAddress ?? "";
                });
              }
            },
            onSuggestionSelected: (PlacesDetailsResponse? result) {
              if (result != null) {
                setState(() {
                  autocompletePlace = result.result.formattedAddress ?? "";
                });
              }
            },
          ),
        ],
      ),
      //bottomNavigationBar: mainFooterPage(),
      bottomNavigationBar: navig(),
    );
  }
}
