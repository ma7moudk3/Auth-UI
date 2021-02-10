import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool obscureText;
  final Function validator;
  final String text;
  final TextInputType keyboardType;
  final Function onSaved;
  final Function onChanged;
  const CustomTextField(
      {Key key,
      this.validator,
      this.text,
      this.keyboardType,
      this.onSaved,
      this.obscureText,
      this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(
          color: Color(0xFFE4E4E4), borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        obscureText: obscureText == null ? false : true,
        keyboardType: keyboardType,
        onChanged: onChanged == null ? (_) => null : onChanged,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          labelText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
