import 'dart:convert';

import 'package:http/http.dart';

class NetworkFlutter {
  String baseUrl;

  /// Request Header
  final Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /// This is Base Url in Constructor
  NetworkFlutter({required this.baseUrl});


  /// GET HTTPS
  Future<String?> GET(String api, {Map<String, String>? param}) async {
    Uri uri = Uri.https(baseUrl, api, param);
    Response response = await get(uri, headers: _headers);
    return response.statusCode == 200 ? response.body : null;
  }

  /// POST HTTPS
  Future<String?> POST(String api, {Map<String, String>? param}) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await post(uri, headers: _headers, body: jsonEncode(param));
    return (response.statusCode == 200 || response.statusCode == 201)
        ? response.body
        : null;
  }


  /// PUT HTTPS
  Future<String?> PUT(String api, {Map<String, String>? param}) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await put(uri, headers: _headers, body: jsonEncode(param));
    return (response.statusCode == 200 || response.statusCode == 202)
        ? response.body
        : null;
  }

  Future<String?> DEL(String api, {Map<String, String>? param}) async {
    Uri uri = Uri.https(baseUrl, api, param);
    Response response = await delete(uri, headers: _headers);
    return (response.statusCode == 200)
        ? response.body
        : null;
  }

}
