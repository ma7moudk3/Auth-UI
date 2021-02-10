import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_assignment/widgets/custom_text_field.dart';
import 'package:form_assignment/widgets/primary_button.dart';
import 'package:string_validator/string_validator.dart';
import 'package:toast/toast.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int selectedRadio;
  int selectedRadioTile;
  final _formKey = GlobalKey<FormState>();
  String name;
  String accountNumber;
  String instaAccount;
  String mobNumber;
  String email;
  String pass;
  String city;
  String confPass;
  String country = 'country';
  String gender = 'gender';

  List<String> genders = [
    "male",
    "female",
  ];
  List<String> countries = [
    "palestine",
    "Syria",
    "Iraq",
    "Qatar",
    "Sadi Arabia",
    "UAI"
  ];

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: Stack(
          children: [
            Positioned(
              child: SvgPicture.asset('images/header_image.svg'),
              top: 0,
              left: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 26,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 135.0, left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setSelectedRadioTile(val);
                          },
                          activeColor: Colors.blue,
                        ),
                        GestureDetector(
                          child: Text('Company'),
                          onTap: () {
                            setState(() {
                              setSelectedRadioTile(1);
                            });
                          },
                        ),
                        Radio(
                          value: 2,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setSelectedRadioTile(val);
                          },
                          activeColor: Colors.blue,
                        ),
                        GestureDetector(
                          child: Text('Name'),
                          onTap: () {
                            setState(() {
                              setSelectedRadioTile(2);
                            });
                          },
                        ),
                      ],
                    ),
                    CustomTextField(
                      text:
                          selectedRadioTile == 1 ? 'Company Name' : 'UserName',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.name = newValue;
                      },
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFE4E4E4),
                      ),
                      child: DropdownButton<String>(
                          hint: Text(gender),
                          isExpanded: true,
                          underline: Container(),
                          items: genders
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            this.gender = value;
                            setState(() {});
                          }),
                    ),
                    CustomTextField(
                      text: '@Account Number',
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value.length < 10) {
                          return "This is not an Account Number 🤦‍♂️ !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.accountNumber = newValue;
                      },
                    ),
                    CustomTextField(
                      text: 'Instagram Account',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.instaAccount = newValue;
                      },
                    ),
                    CustomTextField(
                      text: 'Mobile Number',
                      keyboardType: TextInputType.phone,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value.length < 10) {
                          return "This is not a phone Number 🤦‍♂️ !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.mobNumber = newValue;
                      },
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      text: 'Email',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (!isEmail(value)) {
                          return "This is not an Email 🤦‍♂️ !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.email = newValue;
                      },
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFE4E4E4),
                      ),
                      child: DropdownButton<String>(
                          hint: Text(country),
                          isExpanded: true,
                          underline: Container(),
                          items: countries
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            this.country = value;
                            setState(() {});
                          }),
                    ),
                    CustomTextField(
                      text: 'City',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.city = newValue;
                      },
                    ),
                    CustomTextField(
                      text: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onChanged: (value) {
                        this.pass = value;
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value.length < 7) {
                          return "Your Password is too short !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.pass = newValue;
                      },
                    ),
                    CustomTextField(
                      text: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value != pass) {
                          return "Passwords does not match !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.confPass = newValue;
                      },
                    ),
                    Center(
                      child: PrimaryButton(
                        text: 'Sign up',
                        onPress: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Toast.show(
                                'Your Phone Number : $mobNumber', context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.BOTTOM);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HomeScreen()));
                          } else {
                            return;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: '   Already Have Account ?  ',
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.grey)),
                                TextSpan(
                                    text: 'Signin',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => HomeScreen()));
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: SvgPicture.asset('images/bottom_image.svg'),
              bottom: 0,
              right: 0,
            ),
          ],
        )));
  }
}
