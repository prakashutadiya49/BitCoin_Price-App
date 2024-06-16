import 'dart:convert';
import 'package:http/http.dart' as http;

const String apikey='66CDC568-DC99-465F-95A5-5BDAC89B306A';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '66CDC568-DC99-465F-95A5-5BDAC89B306A';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      var url = Uri.parse(requestURL);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        cryptoPrices[crypto] = price.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
// CupertinoPicker(
// backgroundColor:Colors.lightBlueAccent, itemExtent: 32,
// onSelectedItemChanged: (selectedIndex) {
// print(selectedIndex);
// },
// children: getpikeritems(),
//
// ),
// List<Text>?  getpikeritems(){
// List<Text> pickeritem=[];
// for(String item in currenciesList) {
// var X=Text(item);
// pickeritem.add(X);
// return pickeritem;
//
// }
// }