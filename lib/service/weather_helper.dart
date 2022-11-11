import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.cityName);
  String cityName;
  Future<String> getData() async {
    late Uri url;
    if (cityName != "") {
      url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=2586d41f21bd58470aa8a0082803180d');
    } else {
      url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=2586d41f21bd58470aa8a0082803180d');
    }
    print(url);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return (data);
    } else {
      return "";
    }
  }
}
