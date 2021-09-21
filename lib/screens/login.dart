import 'package:flutter/material.dart';

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
        builder: (context, constraints) => constraints.maxWidth < 600
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: dsize.height,
                  width: dsize.width,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(5)),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              child: const Icon(Icons.account_circle_outlined,
                                  size: 25),
                            ),
                            Expanded(
                              child: Container(
                                child: const TextField(
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.zero,
                                            right: Radius.circular(5)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.zero,
                                            right: Radius.circular(5)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                      ),
                                      hintText: 'Username or Email'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(5)),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              child: const Icon(Icons.vpn_key_sharp, size: 25),
                            ),
                            Expanded(
                              child: Container(
                                child: const TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.zero,
                                            right: Radius.circular(5)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.zero,
                                            right: Radius.circular(5)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                      ),
                                      hintText: 'Password'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: dsize.width * .4,
                              height: double.infinity,
                              child: CheckboxListTile(
                                value: _checked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _checked = newValue!;
                                  });
                                },
                                title: const Text("Remember me",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey)),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                fixedSize: Size(dsize.width * .4, 50),
                                primary: Colors.white,
                                backgroundColor: Colors.blue,
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2))),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "/loading");
                              },
                              child: const Text('Login',
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                fixedSize:
                                    Size(dsize.width * .4, double.infinity),
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
                                    Size(dsize.width * .4, double.infinity),
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
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 1,
                              width: dsize.width * .3,
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
                              width: dsize.width * .3,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: dsize.height * .27,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: double.infinity,
                              height: dsize.height * .07,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 50,
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
                                      height: dsize.height * .07,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[900],
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  right: Radius.circular(10))),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          fixedSize: Size(dsize.width, 50),
                                          primary: Colors.white,
                                          backgroundColor: Colors.blue[900],
                                        ),
                                        onPressed: () {},
                                        child: const Text('LOGIN WITH FACEBOOK',
                                            style: TextStyle(fontSize: 17)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: dsize.height * .07,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 50,
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
                                          borderRadius: BorderRadius.horizontal(
                                              right: Radius.circular(10))),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          fixedSize: Size(dsize.width, 50),
                                          primary: Colors.white,
                                          backgroundColor: Colors.blue,
                                        ),
                                        onPressed: () {},
                                        child: const Text('LOGIN WITH TWITTER',
                                            style: TextStyle(fontSize: 17)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: dsize.height * .07,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.red[700],
                                      borderRadius:
                                          const BorderRadius.horizontal(
                                              left: Radius.circular(5)),
                                    ),
                                    child: Image.asset(
                                      "assets/google.png",
                                      height: dsize.height * .04,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: dsize.height * .07,
                                      decoration: BoxDecoration(
                                          color: Colors.red[700],
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  right: Radius.circular(10))),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          fixedSize: Size(dsize.width, 50),
                                          primary: Colors.white,
                                          backgroundColor: Colors.red[600],
                                        ),
                                        onPressed: () {},
                                        child: const Text('LOGIN WITH GOOGLE',
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
                    ],
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
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                        spreadRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset("assets/background.jpg",
                            fit: BoxFit.cover),
                      ),
                      Container(
                        height: double.infinity,
                        width: 460,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Container(
                          height: dsize.height * .7,
                          width: 360,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                                left: Radius.circular(5)),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: const Icon(
                                          Icons.account_circle_outlined,
                                          size: 25),
                                    ),
                                    Container(
                                      width: 310,
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 20),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.zero,
                                                      right:
                                                          Radius.circular(5)),
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.zero,
                                                      right:
                                                          Radius.circular(5)),
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0),
                                            ),
                                            hintText: 'Username or Email'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                                left: Radius.circular(5)),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: const Icon(Icons.vpn_key_sharp,
                                          size: 25),
                                    ),
                                    Container(
                                      width: 310,
                                      child: const TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 20),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.zero,
                                                      right:
                                                          Radius.circular(5)),
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left: Radius.zero,
                                                      right:
                                                          Radius.circular(5)),
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0),
                                            ),
                                            hintText: 'Password'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 170,
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
                                        fixedSize: Size(150, 50),
                                        primary: Colors.white,
                                        backgroundColor: Colors.blue,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2))),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, "/loading");
                                      },
                                      child: const Text('Login',
                                          style: TextStyle(
                                            fontSize: 17,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        fixedSize: Size(170, double.infinity),
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
                                        fixedSize: Size(150, double.infinity),
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
                                height: 50,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 120,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      alignment: Alignment.center,
                                      child: const Text('or',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey)),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 120,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: dsize.height * .27,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: dsize.height * .07,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 50,
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
                                          Container(
                                            width: 310,
                                            height: dsize.height * .07,
                                            decoration: BoxDecoration(
                                                color: Colors.blue[900],
                                                borderRadius: const BorderRadius
                                                        .horizontal(
                                                    right:
                                                        Radius.circular(10))),
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
                                                  style:
                                                      TextStyle(fontSize: 17)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: dsize.height * .07,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 50,
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
                                          Container(
                                            width: 310,
                                            height: dsize.height * .07,
                                            decoration: const BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                        right: Radius.circular(
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
                                                  style:
                                                      TextStyle(fontSize: 17)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: dsize.height * .07,
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 50,
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
                                          Container(
                                            width: 310,
                                            height: dsize.height * .07,
                                            decoration: BoxDecoration(
                                                color: Colors.red[700],
                                                borderRadius: const BorderRadius
                                                        .horizontal(
                                                    right:
                                                        Radius.circular(10))),
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                fixedSize:
                                                    Size(dsize.width, 50),
                                                primary: Colors.white,
                                                backgroundColor:
                                                    Colors.red[600],
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                  'LOGIN WITH GOOGLE',
                                                  style:
                                                      TextStyle(fontSize: 17)),
                                            ),
                                          ),
                                        ],
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
      ),
    );
  }
}
