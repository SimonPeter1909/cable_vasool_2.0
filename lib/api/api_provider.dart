import 'package:cable_vasool/api/http_request.dart';
import 'package:cable_vasool/api/urls.dart';
import 'package:cable_vasool/models/general_response_model.dart';

class ApiProvider {
  static Future<GeneralResponseModel?> checkPhoneNumber(
      String phoneNumber) async {
    return generalResponseModelFromJson(await StringRequest.post(
        URLs.checkPhoneNumber, {"phoneNumber": phoneNumber}));
  }
}
