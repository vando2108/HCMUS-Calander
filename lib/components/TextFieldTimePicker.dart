import 'package:Calendar/Utilities/constants.dart';
import 'package:flutter/material.dart';

class TextFieldTimePicker extends StatefulWidget {
  TextFieldTimePicker({Key key, this.text}) : super(key: key);

  final String text;

  @override
  _TextFieldTimePickerState createState() => _TextFieldTimePickerState();
}

class _TextFieldTimePickerState extends State<TextFieldTimePicker> {
  TimeOfDay time;
  @override
  void initState() {
    super.initState();
    time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      GestureDetector(
        child: Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.4,
            height: 60,
            decoration: kBoxDecorationStyle,
            child: TextField(
              style: TextStyle(color: Colors.white),
              enabled: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                hintText: convert(time),
                hintStyle: TextStyle(color: Colors.white),
              ),
            )),
        onTap: _pickTime,
      )
    ]);
  }

  void _pickTime() async {
    TimeOfDay temp = await showTimePicker(
        context: context,
        initialTime: time,
        builder: (BuildContext context, Widget child) {
          return Theme(data: ThemeData(), child: child);
        });
    if (temp != null) {
      setState(() {
        time = temp;
      });
    }
  }

  String convert(TimeOfDay x) {
    String min = "";
    if (x.minute < 10)
      min = '0' + x.minute.toString();
    else
      min = x.minute.toString();
    if (x.hour > 12) {
      return "${x.hour - 12}:$min PM";
    }
    return "${x.hour}:$min AM";
  }
}
