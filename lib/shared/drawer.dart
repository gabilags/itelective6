import 'package:flutter/material.dart';
import 'package:itelective61/screens/login_ui.dart';
import 'package:itelective61/shared/firebase_authentication.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: Center(
              child: Column(
            children: [
              CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      radius: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("assets/profile.jpg"),
                      ))),
              const Text(
                'Jerwell Jones Gabilagon',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              const Text(
                'BS Information Technology',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          )),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Your Profile'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.inbox),
          title: const Text('Your Inbox'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.cancel_outlined),
          title: const Text('Logout'),
          onTap: () async {
            await Firebase_Authentication().logOut(context).whenComplete(() {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                  (route) => false);
            });
          },
        ),
      ],
    );
  }
}
