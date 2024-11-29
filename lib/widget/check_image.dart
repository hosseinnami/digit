import 'dart:io';

import 'package:digicapp/control/val/control_val.dart';

Future<String> validateAndReturnUrl(String url, String defaultUrl) async {
  // اگر مقدار URL صفر است، لینک پیش‌فرض را برگردان
  if (url == '0') {
    print('حالت 2: مقدار صفر است، لینک پیش‌فرض بازگردانده شد.');
    return defaultUrl;
  }

  try {
    // بررسی وضعیت لینک
    final uri = Uri.parse(url);
    final request = await HttpClient().headUrl(uri);
    final response = await request.close();

    // اگر وضعیت 200 است، لینک را برگردان
    if (response.statusCode == 200) {
      print('حالت 1: لینک معتبر است و تصویر به درستی بارگذاری شد.');
      return url;
    } else if (response.statusCode == 404) {
      print('حالت 3: لینک وجود دارد اما تصویر یافت نشد (خطای 404). لینک پیش‌فرض بازگردانده شد.');
    } else {
      print('خطای غیرمنتظره (${response.statusCode}). لینک پیش‌فرض بازگردانده شد.');
    }
  } catch (e) {
    // مدیریت خطاهای ناشی از مشکلات شبکه یا سرور
    print('حالت 3: خطا رخ داد (${e.toString()})، لینک پیش‌فرض بازگردانده شد.');
  }

  // در صورت هرگونه خطا یا وضعیت غیرمنتظره، لینک پیش‌فرض را برگردان
  return defaultUrl;
}

Future<void> main() async {
  // نمونه داده‌ها
  final url = "select_tbl_card_id_card/"; // لینک نمونه برای آزمایش

  final defaultUrl =
      "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Add_Profile.png";

  // متغیر profileImage
  String profileImage;

  // بررسی و تنظیم مقدار profileImage
  profileImage = await validateAndReturnUrl(url, defaultUrl);

  // چاپ لینک نهایی
  print('لینک نهایی تصویر: $profileImage');
}
