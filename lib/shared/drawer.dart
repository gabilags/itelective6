import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:itelective61/screens/login_ui.dart';
import 'package:itelective61/shared/firebase_authentication.dart';
import 'package:itelective61/shared/reg_users.dart';
import 'package:provider/provider.dart';

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
            child: StreamProvider<RegUsers>.value(
              value: Firebase_Authentication().getUser,
              builder: (context, snapshot) {
                RegUsers users = Provider.of<RegUsers>(context);
                return Column(
                  children: [
                    CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(users.photoUrl),
                            ))),
                    Text(
                      users.displayname,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Text(
                      users.email,
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                );
              },
              initialData: RegUsers(),
            ),
          ),
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
          leading: const Icon(Icons.logout),
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
