import 'package:http/http.dart' as http;

class UserLoginServies {
  String ip = 'https://jsonplaceholder.typicode.com/users';
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  Future<http.Response> userApi() {
    try {
      Uri url = Uri.parse(ip);
      return http
          .get(url, headers: headers)
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<http.Response> userPhoto(int index) {
    String ip2 = 'https://picsum.photos/id/$index/info';
    try {
      Uri url = Uri.parse(ip2);
      return http
          .get(url, headers: headers)
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      return Future.error(e);
    }
  }
}
