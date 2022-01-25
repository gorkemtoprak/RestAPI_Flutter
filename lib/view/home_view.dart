import 'package:flutter/material.dart';
import 'package:rest_api/viewmodel/home_view_model.dart';
import 'package:rest_api/widgets/coin_card_widget.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      disposeViewModel: false,
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
            elevation: 0,
            title: const Text(
              'CRYPTO API',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.grey[100],
          body: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 10,
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: model.coinList.length,
              itemBuilder: (context, index) {
                return CoinCard(
                  image: model.coinList[index].imageUrl,
                  name: model.coinList[index].name,
                  symbol: model.coinList[index].symbol,
                  price: model.coinList[index].price!.toDouble(),
                  change: model.coinList[index].change!.toDouble(),
                  percentage: model.coinList[index].percentage!.toDouble(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
