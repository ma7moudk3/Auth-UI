import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_assignment/screens/home_screen.dart';
import 'package:form_assignment/screens/signin_screen.dart';
import 'package:form_assignment/widgets/primary_button.dart';
import '../widgets/image_slider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              SvgPicture.asset('images/header_image.svg'),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Text(
                        'Buy your favourites',
                        style: TextStyle(
                          fontSize: 21,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'personalization of your shopping brands',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 34, bottom: 10),
                        child: CarouselSlider(
                          items: imageSliders,
                          options: CarouselOptions(
                              autoPlay: true,
                              height: 330,
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                            width: _current == index ? 20.0 : 10,
                            height: 6.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 1.0),
                            decoration: BoxDecoration(
                              borderRadius: _current == index
                                  ? BorderRadius.circular(32)
                                  : null,
                              shape: _current == index
                                  ? BoxShape.rectangle
                                  : BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                    PrimaryButton(
                        text: 'Start Shoping',
                        onPress: () {
                          Navigator.push(this.context,
                              MaterialPageRoute(builder: (_) => HomeScreen()));
                        }),
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              this.context,
                              MaterialPageRoute(
                                  builder: (_) => SignInScreen()));
                        },
                        child: Text.rich(
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 16),
                            children: [
                              TextSpan(
                                  text: '   or  ',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.grey)),
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                child: SvgPicture.asset('images/bottom_image.svg'),
                bottom: 0,
                right: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
