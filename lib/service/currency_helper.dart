import 'package:http/http.dart' as http;

class CurrencyHelper {
  var url = Uri.parse(
      'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=2360645A-AF82-4847-9C00-362A52647F97');
  Future<String> getData() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return (data);
    } else {
      return "";
    }
  }
}
