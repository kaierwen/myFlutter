import 'package:bitcoin_ticker/services/networking.dart';

class CoinApi {
  static const host = 'rest.coinapi.io';
  static const apiKey = 'F5116F01-45A3-4740-BA29-8CD79DF26C68';
  Map<String, String> requestHeaders = {
    'Accept': 'text/plain',
    'X-CoinAPI-Key': apiKey,
  };

  Future<double> getRate({required String base, required String quote}) async {
    var weatherUri = Uri.https(host, 'v1/exchangerate/$base/$quote');
    var result =
        await NetworkHelper(weatherUri, headers: requestHeaders).getData();
    print('data = $result');
    return result['rate'];
  }
}
