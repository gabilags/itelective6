import 'package:flutter/material.dart';
import 'package:itelective61/screens/loading.dart';
import 'package:itelective61/screens/login.dart';
import 'package:itelective61/shared/card_items.dart';
import 'package:itelective61/shared/class_list.dart';
import 'package:itelective61/shared/drawer.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      routes: {
        '/': (context) => const Login(),
        '/loading': (context) => const LoadingScreen(),
        '/home': (context) => const HomeScreen(),
      },
    ));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> items = [
    Item(
        "1",
        "Pothos",
        "Calling all black thumbs: This trailing vine has earned the nickname 'devil's ivy' for its ability to withstand nearly pitch-black conditions as well as under- and over-watering.",
        "19.00",
        "assets/assets/1.jpg"),
    Item(
        "2",
        "Aglaonema",
        "'If you're more of a waterer, an excellent plant is a Chinese evergreen,' Fried says. Aglaonema can withstand excess H2O, and it comes in a spectrum of colors, including green, pink, white, and red.",
        "14.99",
        "assets/assets/2.jpg"),
    Item(
        "3",
        "Jade Plant",
        "Jade retains water in its round leaves, so it can sometimes survive more than a month without any attention whatsoever. 'If they do get water, they start to rehydrate and grow,' says Neil Mattson, an associate professor in the horticulture department at Cornell University. Position it in a sunny window (south- or west-facing, preferably) and water when the soil feels dry.",
        "5.99",
        "assets/assets/3.jpg"),
    Item(
        "4",
        "Asparagus Fern",
        "This fluffy plant tolerates a lot more abuse than other ferns — thanks to the fact that it's technically not a fern. Asparagus setaceus adapts to both bright spots and darker corners. Keep the soil moist and it'll thrive.",
        "13.99",
        "assets/assets/4.jpg"),
    Item(
        "5",
        "Chinese Money Plant",
        "Pilea peperomioides grows best in a shady spot (or winter windowsill) with weekly watering, according to The Little Book of House Plants and Other Greenery. Bonus: You can replant the offshoots that sprout from the base of the stem and give them as gifts.",
        "12.99",
        "assets/assets/5.jpg"),
    Item(
        "6",
        "Yucca",
        "The recipe for a happy yucca is easy: sun, sun, and more sun. Plant in a container deep enough to balance the top-heavy woody stems and water sparingly. ",
        "32.00",
        "assets/assets/6.jpg"),
    Item(
        "7",
        "Air Planta",
        "You can keep the potting soil in the shed for this one. Tillandsia grows without dirt altogether. 'Just dunk them in water for about two or three hours every 10 days or so,' says Tovah Martin, expert gardener and author of The Indestructible Houseplant.",
        "18.95",
        "assets/assets/7.jpg"),
    Item(
        "8",
        "Spider Plant",
        "What's better than one spider plant? Multiple spider plants. The fast-growing shoots produce little 'babies' that you can re-pot for added greenery elsewhere. Just stick to well-lit spots, and don't forget weekly watering.",
        "18.00",
        "assets/assets/8.jpg"),
    Item(
        "9",
        "Peace Lily",
        "If you're prone to overwatering, try Spathiphyllum. Peace lilies can 'almost grow in a fish tank,' Fried says. With enough light, they'll also produce their spade-shaped flowers throughout the year. ",
        "12.00",
        "assets/assets/9.jpg"),
    Item(
        "10",
        "Aloe",
        "With its preference for indirect light, aloe would love a spot on your desk or bedside table. Give it a good soak every week or two for optimal growth.",
        "17.99",
        "assets/assets/10.jpg"),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> createPlantList() {
    List<Widget> widgets = [];
    for (var i = 0; i < items.length; i++) {
      widgets.add(Carditems(
        id: items[i].id,
        name: items[i].name,
        desc: items[i].desc,
        price: items[i].price,
        imagelocation: items[i].imagelocation,
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    Size dsize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 100,
        shadowColor: Colors.black,
        title: const Text(
          'INDOOR PLANTS',
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.manage_accounts,
              size: 30,
            ),
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
          )
        ],
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                height: 20,
                width: double.infinity,
              ),
              Container(
                width: dsize.width * .9,
                alignment: Alignment.topCenter,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: createPlantList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
