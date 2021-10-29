import 'package:flutter/material.dart';
import 'package:itelective61/shared/firebase_authentication.dart';
import 'package:itelective61/shared/login_notifier.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginNotifier>(
        create: (context) => LoginNotifier(context.read),
        builder: (context, child) {
          return const Scaffold(
            body: Login(),
          );
        });
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _checked = false;
  @override
  Widget build(BuildContext context) {
    Size dsize = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth < 700
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SizedBox(
                    height: dsize.height * .75,
                    width: dsize.width * .7,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: dsize.width,
                          child: const TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_outlined,
                                    size: 25),
                                contentPadding: EdgeInsets.all(20),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'Username or Email'),
                          ),
                        ),
                        SizedBox(width: dsize.width, height: 10),
                        Container(
                          height: 50,
                          width: dsize.width,
                          child: const TextField(
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.vpn_key_outlined, size: 25),
                                contentPadding: EdgeInsets.all(20.0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                hintText: 'Password'),
                          ),
                        ),
                        SizedBox(width: dsize.width, height: 20),
                        Container(
                          height: 50,
                          width: dsize.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: dsize.width * .3,
                                height: double.infinity,
                                child: CheckboxListTile(
                                  title: const Text("Remember me",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey)),
                                  value: _checked,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _checked = newValue!;
                                    });
                                  },
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  fixedSize:
                                      Size(dsize.width * .3, dsize.height),
                                  primary: Colors.white,
                                  backgroundColor: Colors.black45,
                                  shape: const BeveledRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2))),
                                ),
                                onPressed: () {},
                                child: const Text('Login',
                                    style: TextStyle(
                                      fontSize: 17,
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: dsize.width, height: 10),
                        Container(
                          height: 50,
                          width: dsize.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  fixedSize:
                                      Size(dsize.width * .3, dsize.height),
                                  primary: Colors.blue,
                                ),
                                onPressed: () {},
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text('Register now',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ))),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  fixedSize:
                                      Size(dsize.width * .3, dsize.height),
                                  primary: Colors.grey,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: dsize.width, height: 10),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 1,
                                width: dsize.width * .25,
                                color: Colors.grey,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                child: const Text('or',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                              ),
                              Container(
                                height: 1,
                                width: dsize.width * .25,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: dsize.width,
                            child: Column(
                              children: [
                                Container(
                                  width: dsize.width,
                                  height: dsize.height * .07,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 70,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo[800],
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(5)),
                                        ),
                                        child: Image.asset(
                                          "assets/smallFacebook.png",
                                          height: dsize.height * .03,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: dsize.height,
                                          decoration: BoxDecoration(
                                              color: Colors.blue[900],
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                      right:
                                                          Radius.circular(10))),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              fixedSize: Size(dsize.width, 50),
                                              primary: Colors.white,
                                              backgroundColor: Colors.blue[900],
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<
                                                      Firebase_Authentication>()
                                                  .loginwithGoogle();
                                            },
                                            child: const Text(
                                                'LOGIN WITH FACEBOOK',
                                                style: TextStyle(fontSize: 17)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: dsize.width, height: 20),
                                Container(
                                  width: double.infinity,
                                  height: dsize.height * .07,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.blue[600],
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(5)),
                                        ),
                                        child: Image.asset(
                                          "assets/twitter.png",
                                          height: dsize.height * .04,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: dsize.height * .07,
                                          decoration: const BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      right:
                                                          Radius.circular(10))),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              fixedSize: Size(dsize.width, 50),
                                              primary: Colors.white,
                                              backgroundColor: Colors.blue,
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                                'LOGIN WITH TWITTER',
                                                style: TextStyle(fontSize: 17)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: dsize.width, height: 20),
                                Container(
                                  width: double.infinity,
                                  height: dsize.height * .07,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.red[700],
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(5)),
                                        ),
                                        child: Image.asset(
                                          "assets/google.png",
                                          height: dsize.height * .03,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: dsize.height * .07,
                                          decoration: BoxDecoration(
                                              color: Colors.red[700],
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                      right:
                                                          Radius.circular(10))),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              fixedSize: Size(dsize.width, 50),
                                              primary: Colors.white,
                                              backgroundColor: Colors.red[600],
                                            ),
                                            onPressed: () {
                                              context
                                                  .read<
                                                      Firebase_Authentication>()
                                                  .loginwithGoogle();
                                            },
                                            child: const Text(
                                                'LOGIN WITH GOOGLE',
                                                style: TextStyle(fontSize: 17)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                height: dsize.height,
                width: dsize.width,
                alignment: Alignment.center,
                child: Container(
                  height: dsize.height * .8,
                  width: dsize.width * .7,
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
                  child: Row(children: [
                    Container(
                      height: dsize.height,
                      width: dsize.width * .35,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Container(
                        height: dsize.height * .7,
                        width: dsize.width * .2,
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: dsize.width,
                              child: const TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                        Icons.account_circle_outlined,
                                        size: 25),
                                    contentPadding: EdgeInsets.all(20),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                    hintText: 'Username or Email'),
                              ),
                            ),
                            Container(
                                width: dsize.width, height: dsize.height * .01),
                            Container(
                              height: 50,
                              width: dsize.width,
                              child: const TextField(
                                decoration: InputDecoration(
                                    prefixIcon:
                                        Icon(Icons.vpn_key_outlined, size: 25),
                                    contentPadding: EdgeInsets.all(20.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                    hintText: 'Password'),
                              ),
                            ),
                            Container(
                                width: dsize.width, height: dsize.height * .04),
                            Container(
                              height: 50,
                              width: dsize.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: dsize.width * .1,
                                    height: double.infinity,
                                    child: CheckboxListTile(
                                      title: const Text("Remember me",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey)),
                                      value: _checked,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          _checked = newValue!;
                                        });
                                      },
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      fixedSize:
                                          Size(dsize.width * .1, dsize.height),
                                      primary: Colors.white,
                                      backgroundColor: Colors.black45,
                                      shape: const BeveledRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(2))),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Login',
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: dsize.width, height: dsize.height * .03),
                            Container(
                              height: 50,
                              width: dsize.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      fixedSize:
                                          Size(dsize.width * .1, dsize.height),
                                      primary: Colors.blue,
                                    ),
                                    onPressed: () {},
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text('Register now',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ))),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      fixedSize:
                                          Size(dsize.width * .1, dsize.height),
                                      primary: Colors.grey,
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                width: dsize.width, height: dsize.height * .03),
                            Container(
                              height: 50,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 1,
                                    width: dsize.width * .08,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    child: const Text('or',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.grey)),
                                  ),
                                  Container(
                                    height: 1,
                                    width: dsize.width * .08,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                width: dsize.width, height: dsize.height * .03),
                            Expanded(
                              child: Container(
                                width: dsize.width,
                                child: Column(
                                  children: [
                                    Container(
                                      width: dsize.width,
                                      height: dsize.height * .05,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 70,
                                            height: dsize.height,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.indigo[800],
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                      left: Radius.circular(5)),
                                            ),
                                            child: Image.asset(
                                              "assets/smallFacebook.png",
                                              height: dsize.height * .03,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: dsize.height,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue[900],
                                                  borderRadius:
                                                      const BorderRadius
                                                              .horizontal(
                                                          right:
                                                              Radius.circular(
                                                                  10))),
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  fixedSize:
                                                      Size(dsize.width, 50),
                                                  primary: Colors.white,
                                                  backgroundColor:
                                                      Colors.blue[900],
                                                ),
                                                onPressed: () {},
                                                child: const Text(
                                                    'LOGIN WITH FACEBOOK',
                                                    style: TextStyle(
                                                        fontSize: 17)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: dsize.width,
                                        height: dsize.height * .02),
                                    Container(
                                      width: double.infinity,
                                      height: dsize.height * .05,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 70,
                                            height: dsize.height,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.blue[600],
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                      left: Radius.circular(5)),
                                            ),
                                            child: Image.asset(
                                              "assets/twitter.png",
                                              height: dsize.height * .04,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: dsize.height,
                                              decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                          right:
                                                              Radius.circular(
                                                                  10))),
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  fixedSize:
                                                      Size(dsize.width, 50),
                                                  primary: Colors.white,
                                                  backgroundColor: Colors.blue,
                                                ),
                                                onPressed: () {},
                                                child: const Text(
                                                    'LOGIN WITH TWITTER',
                                                    style: TextStyle(
                                                        fontSize: 17)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: dsize.width,
                                        height: dsize.height * .02),
                                    Container(
                                      width: double.infinity,
                                      height: dsize.height * .05,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 70,
                                            height: dsize.height,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.red[700],
                                              borderRadius:
                                                  const BorderRadius.horizontal(
                                                      left: Radius.circular(5)),
                                            ),
                                            child: Image.asset(
                                              "assets/google.png",
                                              height: dsize.height * .03,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: dsize.height,
                                              decoration: BoxDecoration(
                                                  color: Colors.red[700],
                                                  borderRadius:
                                                      const BorderRadius
                                                              .horizontal(
                                                          right:
                                                              Radius.circular(
                                                                  10))),
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  fixedSize:
                                                      Size(dsize.width, 50),
                                                  primary: Colors.white,
                                                  backgroundColor:
                                                      Colors.red[600],
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          Firebase_Authentication>()
                                                      .loginwithGoogle();
                                                },
                                                child: const Text(
                                                    'LOGIN WITH GOOGLE',
                                                    style: TextStyle(
                                                        fontSize: 17)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: dsize.height,
                        child: Image.asset("assets/background.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                  ]),
                ),
              ),
      ),
    );
  }
}
