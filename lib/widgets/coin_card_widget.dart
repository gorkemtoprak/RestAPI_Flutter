import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final String? image;
  final String? name;
  final String? symbol;
  final double? price;
  final double? change;
  final double? percentage;
  const CoinCard({
    Key? key,
    this.image,
    this.name,
    this.symbol,
    this.price,
    this.change,
    this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        height: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.network(
                image!,
                height: 50,
                width: 50,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  symbol!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price!.toDouble().toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    change!.toDouble() < 0
                        ? change!.toDouble().toString()
                        : '+' + change!.toDouble().toString(),
                    style: TextStyle(
                      color: change!.isNegative ? Colors.red : Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    percentage!.toDouble() < 0
                        ? percentage!.toDouble().toString() + '%'
                        : '+' + percentage!.toDouble().toString() + '%',
                    style: TextStyle(
                      color: percentage!.isNegative ? Colors.red : Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
