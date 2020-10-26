import 'package:Calendar/Screens/AddTest/AddTest.dart';
import 'package:Calendar/Utilities/CTask.dart';
import 'package:Calendar/Utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'components/ShowTask.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'components/LoadEvent.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _calendarController;
  DateTime _daySelected;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _daySelected = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
    _calendarController.dispose();
  }

  loadEvent() async {
    String jsonString =
        await rootBundle.loadString('../../../assets/Events.json');
    print(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        backgroundColor: Colors.white,
        animatedIconTheme: IconThemeData(
          color: kPrimaryLightColor,
        ),
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.book,
              color: kPrimaryLightColor,
            ),
            backgroundColor: Colors.white,
            label: "Add a subject",
            labelBackgroundColor: Colors.white,
          ),
          SpeedDialChild(
              child: Icon(
                Icons.access_alarm,
                color: kPrimaryLightColor,
              ),
              backgroundColor: Colors.white,
              label: "Add exercises",
              labelBackgroundColor: Colors.white,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  print(1);
                  return AddTest(
                    daypicked: _daySelected,
                  );
                }));
              }),
          SpeedDialChild(
            child: Icon(
              Icons.date_range,
              color: kPrimaryLightColor,
            ),
            backgroundColor: Colors.white,
            label: "Show date range",
            labelBackgroundColor: Colors.white,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: kPrimaryDarkColor,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  child: TableCalendar(
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                        weekdayStyle: dayStyle(FontWeight.normal),
                        weekendStyle: dayStyle(FontWeight.normal),
                        todayStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        weekendStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        headerPadding:
                            EdgeInsets.only(left: 0, top: 15, bottom: 15),
                        centerHeaderTitle: true,
                        titleTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          size: 0,
                        ),
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          size: 0,
                        )),
                    onDaySelected: (date, event) {
                      setState(() {
                        _daySelected = _calendarController.selectedDay;
                      });
                    },
                    calendarController: _calendarController,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 30),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: kPrimaryLightColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            "Today",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TaskCompleted(
                          task: Task(
                              _daySelected,
                              450,
                              540,
                              "Object Oriented Programming",
                              "Task 1 description",
                              "Linh Trung"),
                        ),
                        TaskUncompleted(
                          task: Task(
                              _daySelected,
                              450,
                              540,
                              "Probability and Statistics ",
                              "Task 2 description",
                              "Linh Trung"),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
