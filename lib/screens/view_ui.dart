import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itelective61/screens/home_ui.dart';

class ItemView extends StatelessWidget {
  String itemName;
  String itemDesc;
  String itemPrice;
  String itemPhoto;
  ItemView(
      {Key? key,
      this.itemName = "",
      this.itemDesc = "",
      this.itemPrice = "",
      this.itemPhoto = ""});

  @override
  Widget build(BuildContext context) {
    var usdCurrency = NumberFormat.simpleCurrency(locale: "en_US");
    Size dsize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shadowColor: Colors.black45,
        title: const Text(
          'INDOOR PLANTS',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false),
          )
        ],
      ),
      body: Center(
          child: Container(
        height: dsize.height * .8,
        width: dsize.width * .71,
        decoration: const BoxDecoration(
          color: Colors.white38,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 30,
              spreadRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: dsize.height * .8,
              width: dsize.width * .3,
              child: FittedBox(
                child: Image.asset(itemPhoto),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: dsize.height,
              width: dsize.width * .01,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: dsize.height * .15,
                  width: dsize.width * .4,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    usdCurrency.format(double.parse(itemPrice)),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                ),
                SizedBox(
                  height: dsize.height * .01,
                  width: dsize.width * .4,
                ),
                Container(
                  height: dsize.height * .1,
                  width: dsize.width * .4,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      itemName,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: dsize.height * .01,
                  width: dsize.width * .4,
                ),
                Container(
                  height: dsize.height * .39,
                  width: dsize.width * .4,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      itemDesc,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: dsize.height * .01,
                  width: dsize.width * .4,
                ),
                Container(
                  height: dsize.height * .13,
                  width: dsize.width * .4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            fixedSize:
                                Size(dsize.width * .1, dsize.height * .08),
                            primary: Colors.white,
                            backgroundColor: Colors.blue,
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2))),
                          ),
                          onPressed: () {},
                          child: const Text('Add to Chart',
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        ),
                        SizedBox(
                          height: dsize.height,
                          width: dsize.width * .01,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            fixedSize:
                                Size(dsize.width * .1, dsize.height * .08),
                            primary: Colors.white,
                            backgroundColor: Colors.green,
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2))),
                          ),
                          onPressed: () {},
                          child: const Text('Buy Now',
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
