import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<String> getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=2586d41f21bd58470aa8a0082803180d');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return (data);
    } else {
      return "";
    }
  }
}
