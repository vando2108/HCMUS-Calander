import 'package:Calendar/Utilities/CTask.dart';
import 'package:Calendar/components/DescriptionField.dart';
import 'package:Calendar/components/DropDown.dart';
import 'package:Calendar/components/TextFieldDayPicker.dart';
import 'package:Calendar/Utilities/constants.dart';
import 'package:Calendar/components/TextFieldTimePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Utilities/database.dart';

class AddTest extends StatefulWidget {
  AddTest({Key key, @required this.daypicked}) : super(key: key);
  final DateTime daypicked;
  @override
  _AddTestState createState() => _AddTestState();
}

class _AddTestState extends State<AddTest> {
  String selected;
  final _formKey = GlobalKey<FormState>();
  final titleTextController = TextEditingController();
  DatabaseService _firebase;
  @override
  void dispose() {
    super.dispose();
    titleTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: kPrimaryDarkColor,
        height: size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text("Add Test",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: size.width * 0.9,
                alignment: Alignment.center,
                decoration: kBoxDecorationStyle,
                child: TextFormField(
                  controller: titleTextController,
                  validator: (value) {
                    if (value.isEmpty) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text("Error"),
                              content: Text("Please enter title !!!"),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text("Yes"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(
                      Icons.assignment,
                      color: Colors.white,
                    ),
                    hintText: "Enter title",
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldDayPicker(
                text: "Date",
                time: (widget.daypicked != null)
                    ? widget.daypicked
                    : DateTime.now(),
              ),
              SizedBox(height: 20),
              DropDown(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Row(
                  children: [
                    TextFieldTimePicker(
                      text: "Start time",
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    TextFieldTimePicker(
                      text: "End time",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DescriptionField(),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  height: 40,
                  width: size.width * 0.25,
                  decoration: kBoxDecorationStyle,
                  alignment: Alignment.center,
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onTap: () {
                  if (_formKey.currentState.validate() != null) {
                    Task task = Task(DateTime.now(), 450, 540, "OOP",
                        "Task description", "Linh Trung");
                    _firebase.addTask(task);
                  }
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
