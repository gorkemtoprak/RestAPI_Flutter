class CoinModel {
  final String? name;
  final String? symbol;
  final String? imageUrl;
  final num? price;
  final num? change;
  final num? percentage;
  CoinModel({
    this.name,
    this.symbol,
    this.imageUrl,
    this.price,
    this.change,
    this.percentage,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      price: json['current_price'],
      change: json['price_change_24h'],
      percentage: json['price_change_percentage_24h'],
    );
  }
}
