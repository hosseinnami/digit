import 'package:easy_web_view/easy_web_view.dart'; // Make sure to add easy_web_view
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'control/val/val_pic.dart';

class WebViewScreen extends StatefulWidget {
  final List val;
  const WebViewScreen({Key? key, required this.val}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    // Default variables for width and font size
    double with_screen = MediaQuery.of(context).size.width;
    double font_size_18 = 18.0;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.network(
                val_pic_png_network[15], // Check if correctly initialized
                height: 95,
                fit: BoxFit.fill,
                width: with_screen,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back(); // Go back to the previous page
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Text(
                      widget.val[0],
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Container(
                      width: 30, // Empty space for proper alignment
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: EasyWebView(
              src: widget.val[1], // Your URL
              options: WebViewOptions(
                navigationDelegate: (request) async {
                  // Check URL
                  if (request.url.contains('payment')) {
                    // If the URL contains 'payment', open it in the default browser
                    await launch(request.url);
                    return WebNavigationDecision.prevent; // Prevent loading in WebView
                  }
                  return WebNavigationDecision.navigate; // Allow loading for other URLs
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
