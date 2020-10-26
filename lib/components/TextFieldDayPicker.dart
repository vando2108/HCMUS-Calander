import 'package:Calendar/Utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextFieldDayPicker extends StatefulWidget {
  const TextFieldDayPicker({
    Key key,
    this.time,
    this.text,
  }) : super(key: key);

  final String text;
  final DateTime time;

  @override
  _TextFieldDayPickerState createState() => _TextFieldDayPickerState();
}

class _TextFieldDayPickerState extends State<TextFieldDayPicker> {
  DateTime _datepicked;
  @override
  void initState() {
    super.initState();
    _datepicked = widget.time;
  }

  DateTime getDatePicked() {
    return _datepicked;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text,
            style: TextStyle(
              color: Colors.white,
            )),
        SizedBox(height: 10),
        GestureDetector(
            child: Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width * 0.9,
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
                    hintText: DateFormat('MMMM dd yyyy').format(_datepicked),
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                )),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: _datepicked,
                firstDate: DateTime(2010),
                lastDate: DateTime(2030),
              ).then((value) {
                setState(() {
                  if (value != null) _datepicked = value;
                  print(_datepicked.toIso8601String());
                  if (value != null) {
                    _datepicked = value;
                  }
                });
              });
            }),
      ],
    );
  }
}
