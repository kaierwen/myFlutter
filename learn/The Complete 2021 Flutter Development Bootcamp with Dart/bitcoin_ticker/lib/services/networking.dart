import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final Uri uri;
  Map<String, String>? headers;
  NetworkHelper(this.uri, {this.headers});

  Future getData() async {
    http.Response response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
