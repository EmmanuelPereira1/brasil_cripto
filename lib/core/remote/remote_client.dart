import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:brasil_cripto/core/enums/enum_remote_error.dart';
import 'package:brasil_cripto/core/generics/generic_response.dart';

abstract class AbstractRemoteClient {
  Future<GenericResponse<dynamic, EnumRemoteError>> get(
      String url);
}

class RemoteClient implements AbstractRemoteClient {
  
  final _headers = {
   "header" : dotenv.env['API_KEY'] ?? "KEY NOT FOUND",
  };

  @override
  Future<GenericResponse<dynamic, EnumRemoteError>> get(
      String url) async {
    try {
      final response = await http.get(Uri.parse(url), headers: _headers);

      if (response.statusCode != 200) {
        return GenericResponse(
            statusCode: response.statusCode,
            error: EnumRemoteError.badRequest);
      }
      final dynamic data = json.decode(response.body);
      return GenericResponse(statusCode: 200, data: data);
    } catch (_) {
      return GenericResponse(
          statusCode: 400, error: EnumRemoteError.badRequest);
    }
  }
}