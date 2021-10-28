import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itelective61/shared/reg_users.dart';

class Carditems extends StatelessWidget {
  final Items item;
  const Carditems({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var usdCurrency = NumberFormat.simpleCurrency(locale: "en_US");
    Size dsize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Material(
        elevation: 20,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: Container(
          height: 300,
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 210,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: FittedBox(
                    child: Image.asset(item.photoUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  item.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  item.desc,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      usdCurrency.format(double.parse(item.price)),
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 13),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
