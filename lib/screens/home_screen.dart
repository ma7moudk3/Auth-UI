import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imagesUrls = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
    'images/image7.jpg',
    'images/image8.jpg',
    'images/image9.jpg',
    'images/image10.jpg',
    'images/image11.jpg',
    'images/image12.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SvgPicture.asset(
              'images/home_icon.svg',
              height: 60,
              width: 60,
            ),
            SvgPicture.asset(
              'images/search_icon.svg',
              height: 25,
              width: 25,
            ),
            SvgPicture.asset(
              'images/favorite_icon.svg',
              height: 30,
              width: 30,
            ),
            SvgPicture.asset(
              'images/profile_icon.svg',
              height: 25,
              width: 25,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.menu,
            color: Colors.grey,
            size: 30,
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.white,
        title: Text(
          'Stylish',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 27,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 30,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/person.jpg'),
                maxRadius: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 75,
                        child: Text(
                          '1,252',
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color(0xff262627),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        child: Text(
                          '580',
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color(0xff262627),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 75,
                        child: Text(
                          '902',
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color(0xff262627),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: Text(
                            'posts',
                            style: TextStyle(
                              fontSize: 15,
                              color: const Color(0xff999999),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 95,
                          child: Text(
                            'followers',
                            style: TextStyle(
                              fontSize: 15,
                              color: const Color(0xff999999),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: 75,
                          child: Text(
                            'following',
                            style: TextStyle(
                              fontSize: 15,
                              color: const Color(0xff999999),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDEDEDE),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: EdgeInsets.only(top: 20),
                      width: 230,
                      height: 40,
                      child: Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            fontSize: 15,
                            color: const Color(0xe5606060),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Text(
              'Home Furniture',
              style: TextStyle(
                fontFamily: 'Proxima Nova',
                fontSize: 20,
                color: const Color(0xff262627),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Text(
              'Home accessories, some information about us',
              style: TextStyle(
                fontSize: 15,
                color: const Color(0xff999999),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  color: const Color(0xff262627),
                ),
                children: [
                  TextSpan(
                    text: 'Contact us:\n',
                  ),
                  TextSpan(
                    text: '+925 987 952 2365',
                    style: TextStyle(
                      color: const Color(0xff175ed4),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Text(
              'Chennai, India',
              style: TextStyle(
                fontSize: 15,
                color: const Color(0xff999999),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFDEDEDE),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.only(top: 20, left: 20),
                  width: 115,
                  height: 45,
                  child: Center(
                      child: Text(
                    'Add Product',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xe5606060),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ))),
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFDEDEDE),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.only(top: 20, left: 10),
                  width: 115,
                  height: 45,
                  child: Center(
                      child: Text(
                    'Share',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xe5606060),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ))),
              Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFDEDEDE),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  margin: EdgeInsets.only(top: 20, left: 10),
                  width: 115,
                  height: 45,
                  child: Center(
                      child: Text(
                    'Contact us',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xe5606060),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ))),
            ],
          ),
          SizedBox(
            height: 20,
            child: Divider(color: Colors.grey),
          ),
          Expanded(
              child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 3,
            children: List.generate(12, (index) {
              return Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                        image: AssetImage(imagesUrls[index]),
                        fit: BoxFit.cover)),
              );
            }),
          )),
        ],
      ),
    );
  }
}
