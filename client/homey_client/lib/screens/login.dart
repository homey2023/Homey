import 'package:flutter/material.dart';

import '../config/palette.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isSignup = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              color: Palette.mainColor,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 100,
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '믿고 거래하는 부동산앱',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '나의 공인중개사',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 입력 폼
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: 220,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              padding: const EdgeInsets.all(20.0),
              height: isSignup ? 280.0 : 250.0,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignup = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: !isSignup
                                      ? Palette.mainColor
                                      : Palette.textColor),
                            ),
                            if (!isSignup)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Palette.mainColor,
                              )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignup = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignup
                                      ? Palette.mainColor
                                      : Palette.textColor),
                            ),
                            if (isSignup)
                              Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Palette.mainColor,
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                  if (isSignup)
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Palette.textColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  hintText: 'User name',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Palette.textColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  hintText: 'email',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Palette.textColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  hintText: 'password',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor),
                                  contentPadding: EdgeInsets.all(10)),
                            )
                          ],
                        ),
                      ),
                    ),
                  if (!isSignup)
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Palette.textColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  hintText: 'email',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor),
                                  contentPadding: EdgeInsets.all(10)),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Palette.textColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  hintText: 'password',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Palette.textColor),
                                  contentPadding: EdgeInsets.all(10)),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          // 이동 버튼
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            top: isSignup ? 470 : 430,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Home();
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Palette.mainColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 170,
            right: 0,
            left: 0,
            child: Column(
              children: [
                const Text('or'),
                const SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      iconColor: Colors.white,
                      minimumSize: const Size(155, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Palette.googleColor),
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text(
                    'Google',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
