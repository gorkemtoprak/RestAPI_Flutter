import 'dart:async';
import 'dart:convert';

import 'package:rest_api/model/coin_model.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends BaseViewModel {
  List<CoinModel> coinList = [];
  void init() {
    fetchCoins();
    Timer.periodic(
      const Duration(seconds: 10),
      (timer) => fetchCoins(),
    );
  }

  Future<List<CoinModel>?>? fetchCoins() async {
    coinList = [];
    final response = await http.get(
      Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false',
      ),
    );
    if (response.statusCode == 200) {
      List<dynamic> coins = [];
      coins = jsonDecode(response.body);
      if (coins.isNotEmpty) {
        for (int i = 0; i < coins.length; i++) {
          if (coins[i] != null) {
            Map<String, dynamic> map = coins[i];
            coinList.add(CoinModel.fromJson(map));
          }
        }
        coinList;
        notifyListeners();
      }
      return coinList;
    } else {
      throw Exception('ERROR! Failure when load coins...');
    }
  }
}
