import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseNetworking {
  static BaseNetworking shared = BaseNetworking();

  String get _baseUrl => "https://private-453fde-markets4.apiary-mock.com";

  Future get({String partUrl}) async {
    final url = _baseUrl + "/" + partUrl;

    final response = await http.get(url);

    return _processApiResponse(response);
  }

  Future<Map<String, dynamic>> _processApiResponse(
      http.Response response) async {
    final body = response.body ?? "";

    if (body.isNotEmpty) {
      final jsonBody = json.decode(response.body);
      return jsonBody;
    }

    return {"error": true};
  }
}
