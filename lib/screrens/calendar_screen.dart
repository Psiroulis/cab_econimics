import 'package:cab_economics/global/globals.dart';
import 'package:cab_economics/helpers/db_helper.dart';
import 'package:cab_economics/helpers/helper_methods.dart';
import 'package:cab_economics/models/shift.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarScreen extends StatefulWidget {
  static const String routeName = 'calendarScreen';

  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool shiftIsRunning = false;

  final DateTime currentDay = DateTime.now();

  Future<bool> _checkIfShiftRunning() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? gg = prefs.getBool('haveShift');

    if (gg == null) {
      return false;
    }

    return true;
  }

  void _startShift() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return const Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Loading...'),
                ],
              ),
            ),
          );
        });

    Shift shift = Shift(start: currentDay, end: currentDay);

    DatabaseHelper.addNewShiftToDatabase(shift, Globals.repository)
        .then((value) {
      setState(() {
        shiftIsRunning = true;
      });

      Navigator.of(context).pop();
    });


  }

  void _stopShift() {
    DatabaseHelper.endShiftToDb(Globals.repository).then((value) {
      setState(() {
        shiftIsRunning = false;
      });
    });
  }

  @override
  void initState() {
    _checkIfShiftRunning().then((value) {
      setState(() {
        shiftIsRunning = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Hello user'),
          Column(
            children: [
              Text(HelperMethods.currentDayOfWeekAsString(currentDay)),
              Text(currentDay.day.toString()),
              Text(HelperMethods.currentMonthAsString(currentDay)),
            ],
          ),
          ElevatedButton(
            onPressed: shiftIsRunning ? _stopShift : _startShift,
            child: Text(shiftIsRunning ? 'End Shift' : 'Start New Shift'),
          ),
          if (shiftIsRunning)
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add new ride to shift')),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Go to shift summary')),
              ],
            )
        ],
      ),
    );
  }
}
