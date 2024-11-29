import 'dart:async';
import 'dart:math';

import 'package:http/http.dart' as http;

class NumberCreator {
  NumberCreator() {
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      //add count to stream
      _controller.sink.add(_count);
      _count++;
    });
  }
  var _count = 1;
  final _controller = StreamController<int>();


  Stream<int> get stream => _controller.stream;

  dispose() {
    _controller.close();
  }
}

class NumberCreator222 {
  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void addNumber(int number) {
    _controller.sink.add(number);
  }

  void dispose() {
    _controller.close();
  }
}

String create_new_code() {
  DateTime now = DateTime.now();
  int timestamp = now.microsecondsSinceEpoch;

  // Generate a random 3-digit number
  int random = Random().nextInt(900) + 100 + timestamp;

  // Random number between 100 and 999

  // Concatenate timestamp and random number, and take the last 7 digits
  String code = (random).toString().substring(random.toString().length - 10, random.toString().length);

  return code;
}

String string_line(String val, int leangt_) {
  String val1 = val;
  if (val.length > leangt_) {
    val1 = "${val.substring(0, leangt_)}...";
  }

  return val1;
}

class NumberCreator2 {
  NumberCreator2() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      //add count to stream
      _controller.sink.add(_count);
      _count++;
    });
  }
  var _count = 1;
  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  dispose() {
    _controller.close();
  }
}

String extractLastPart(String url) {
  List<String> parts = url.split('/');
  return parts.last;
}

String url_test_ = "";
String url_end_ = "";
Future<void> check_Image_url(test_url, end_url) async {
  try {
    final response = await http.get(Uri.parse(test_url));
    if (response.statusCode == 200) {
      url_test_ = test_url;
    } else {
      url_test_ = end_url;
    }
  } catch (e) {}
}
