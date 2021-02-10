import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_assignment/screens/home_screen.dart';
import 'package:form_assignment/screens/signup_screen.dart';
import 'package:form_assignment/widgets/custom_text_field.dart';
import 'package:form_assignment/widgets/primary_button.dart';
import 'package:toast/toast.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String password;
  String phone;
  final _formKey = GlobalKey<FormState>();

  saveForm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: SvgPicture.asset('images/bottom_image.svg'),
              bottom: 0,
              right: 0,
            ),
            Positioned(
              child: SvgPicture.asset('images/header_image.svg'),
              top: 0,
              left: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 150,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Sign in',
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
              padding: const EdgeInsets.only(top: 220.0, left: 20, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value.length < 10) {
                          return "This is not a phone Number 🤦‍♂️ !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.phone = newValue;
                      },
                      text: 'Phone',
                      keyboardType: TextInputType.phone,
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "This Field is Required 😒 !";
                        } else if (value.length < 7) {
                          return "Your Password should be greater than 7 charcters 🤦‍♂️ !";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        this.password = newValue;
                      },
                      text: 'Password',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 220),
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: PrimaryButton(
                        text: 'Login',
                        onPress: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Toast.show('Your Phone Number : $phone', context,
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
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SignUpScreen()));
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '   Don\'t have account?  ',
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.grey)),
                              TextSpan(
                                  text: 'Signup',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
