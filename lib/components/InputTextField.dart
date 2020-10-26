import 'package:Calendar/Utilities/constants.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    Key key,
    this.text,
    this.hint,
    this.icon,
  }) : super(key: key); 

  final String text, hint;
  final IconData icon;

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60,
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextFormField(
            //key: widget.key,
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter test name";
              }
              return null;
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                widget.icon,
                color: Colors.white,
              ),
              hintText: "Enter test name",
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
