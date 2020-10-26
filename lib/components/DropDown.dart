import 'package:Calendar/Utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown({Key key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List _location = ["Linh Trung", "Nguyen Van Cu"];
  String _selected;

  @override
  void initState() {
    super.initState();
    _selected = "Linh Trung";
  }
  String getSelected(){
    return _selected;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            decoration: kBoxDecorationStyle,
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Icon(CupertinoIcons.location, color: Colors.white,),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      elevation: 2,
                      dropdownColor: kPrimaryLightColor,
                      items: _location.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value, style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      value: _selected,
                      isExpanded: true,
                      style: TextStyle(color: Colors.white70, fontSize: 16, fontFamily: "OpenSans"),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selected = value;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
