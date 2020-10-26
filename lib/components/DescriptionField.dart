import 'package:Calendar/Utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionField extends StatefulWidget {
  DescriptionField({Key key}) : super(key: key);

  @override
  _DescriptionFieldState createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  String description;
  final myController=TextEditingController();
  void initState(){
    super.initState();
    description = 'No';
  }
  String getDescription(){
    return myController.text;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          //alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 150,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Flexible(
            child: TextField(
              controller: myController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.pen,
                  color: Colors.white,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                hintText: "Enter test description or not",
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
