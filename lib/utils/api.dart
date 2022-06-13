import 'dart:convert';
import 'dart:io';

import 'package:connectgamermobile/resources/strings.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../main.dart';

class ApiUtils {

  ApiUtils._();

  static String authority = Strings.serverAuthority;
  // static String authority = "203.167.9.213:5001";

  static Future<http.Response> post({
    required String path,
    Map<String, dynamic>? body,
    String? token,
    Map<String, String>? queryParams,
    List<String>? pathVariables,
  }) {
    return http.post(getUrl(path, queryParams, pathVariables),
      body: body != null ? jsonEncode(body): null,
      headers: {
        if (token != null) HttpHeaders.authorizationHeader: "Bearer $token",
        'content-type': 'application/json',
      }
    );
  }
  static Future<http.Response> get({
    required String path,
    String? token,
    Map<String, String>? queryParams,
    List<String>? pathVariables,
  }) {
    HttpOverrides.global = MyHttpOverrides();
    return http.get(getUrl(path, queryParams, pathVariables),
      headers: {
        if (token != null) HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
  }

  static Future<http.Response> put({
    required String path,
    Map<String, dynamic>? body,
    String? token,
    Map<String, String>? queryParams,
    List<String>? pathVariables,
  }) {
    return http.put(getUrl(path, queryParams, pathVariables),
      headers: {
        if (token != null) HttpHeaders.authorizationHeader: "Bearer $token",
        'content-type': 'application/json',
      },
      body: body != null ? jsonEncode(body): null,
    );
  }

  static Future<http.Response> delete({
    required String path,
    Map<String, dynamic>? body,
    String? token,
    Map<String, String>? queryParams,
    List<String>? pathVariables,
  }) {
    return http.delete(getUrl(path, queryParams, pathVariables),
      headers: {
        if (token != null) HttpHeaders.authorizationHeader: "Bearer $token",
        'content-type': 'application/json',
      },
      body: body != null ? jsonEncode(body): null,
    );
  }

  static Future<http.Response> uploadImage({
    required String path,
    required String filePath,
    String? token,
    Map<String, String>? queryParams,
    List<String>? pathVariables,
  }) async {
    var postUri = getUrl(path, queryParams, pathVariables);
    var request = http.MultipartRequest("POST", postUri);

    request.files.add(await http.MultipartFile.fromPath('avatar', filePath, contentType: MediaType('image', 'png')));

    request.headers.addAll({
      if (token != null) HttpHeaders.authorizationHeader: "Bearer $token",
    });

    return await http.Response.fromStream(await request.send());
  }

  static Future<http.Response> postMultipart({
    required String path,
    String? token,
    Map<String, String>? queryParams,
    List<String>? pathVariables,
    List<http.MultipartFile>? files,
    Map<String, String>? fields,
  }) async {
    var postUri = getUrl(path, queryParams, pathVariables);
    var request = http.MultipartRequest("POST", postUri);

    request.files.addAll(files ?? []);
    request.fields.addAll(fields ?? {});

    request.headers.addAll({
      if (token != null) HttpHeaders.authorizationHeader: "Bearer $token",
    });

    return await http.Response.fromStream(await request.send());
  }

  static Uri getUrl(String unencodedPath, [Map<String, String>? queryParams, List<String>? pathVariables]) {
    return Uri.https(authority, "$unencodedPath${pathVariablesToString(pathVariables)}", queryParams);
  }

  static String pathVariablesToString(List<String>? pathVariables) {
    if (pathVariables == null) {
      return "";
    } else {
      var buffer = StringBuffer();

      for (var variable in pathVariables) {
        buffer.write("/$variable");
      }

      return buffer.toString();
    }
  }
}