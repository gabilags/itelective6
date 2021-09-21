import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Carditems extends StatelessWidget {
  final id;
  final name;
  final desc;
  final price;
  final imagelocation;

  Carditems({this.id, this.name, this.desc, this.price, this.imagelocation});

  @override
  Widget build(BuildContext context) {
    var usdCurrency = NumberFormat.simpleCurrency(locale: "en_US");
    Size dsize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(name, style: TextStyle(fontSize: dsize.width * .02)),
          content: Row(
            children: [
              Container(
                height: dsize.height * .6,
                width: dsize.width * .3,
                child: FittedBox(
                  child: Image.asset(imagelocation),
                ),
              ),
              Expanded(
                child: Container(
                  height: dsize.height * .6,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Shop Now: ${usdCurrency.format(double.parse(price))}",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: dsize.width * .02),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          desc,
                          style: TextStyle(fontSize: dsize.width * .022),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Close'),
              child: Text(
                'Close',
                style:
                    TextStyle(color: Colors.green, fontSize: dsize.width * .02),
              ),
            ),
          ],
        ),
      ),
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
                    child: Image.asset(imagelocation),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  desc,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      usdCurrency.format(double.parse(price)),
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
