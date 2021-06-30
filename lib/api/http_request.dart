import 'package:cable_vasool/hive_helper/hive_helper.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class StringRequest {
  static String baseURL = "https://cable-backend.herokuapp.com/Api/";

  static Future<String?> get(String url) async {
    Box headerBox = Hive.box(HiveHelper.headerBox);
    var res = await http.get(Uri.parse(baseURL + url),
        headers: {"Authorization": headerBox.get(HiveHelper.headerKey)});
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return null;
    }
  }

  static Future<String?> post(String url, Map<String, String> body) async {
    Box headerBox = Hive.box(HiveHelper.headerBox);
    var res = await http.post(Uri.parse(baseURL + url),
        body: body,
        headers: {"Authorization": headerBox.get(HiveHelper.headerKey)});
    if (res.statusCode == 200) {
      return res.body;
    } else {
      return null;
    }
  }

}
