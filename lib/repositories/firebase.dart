import 'package:cab_economics/models/repository.dart';
import 'package:cab_economics/models/shift.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/helper_methods.dart';

class FirebaseRepository implements Repository {
  final DateTime _currentDay = DateTime.now();

  @override
  void importShiftToDb(Shift shift) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(
        'shifts/${_currentDay.year.toString()}/${HelperMethods.currentMonthAsString(_currentDay)}');

    Map newShift = {
      'start': shift.start.toString(),
      'end': 'waiting...',
      'km': shift.km,
      'total_collection': shift.totalIncome,
      'total_fpa': shift.totalFpa,
      'total_black': shift.totalIncomeBlack,
      'total_rides': shift.totalRides,
      'fuel': shift.fuelPrice,
    };

    ref.child(_currentDay.day.toString()).set(newShift).then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setBool('haveShift', true);
    });
  }

  @override
  void endShiftToDb() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    DatabaseReference ref = FirebaseDatabase.instance.ref(
        'shifts/${_currentDay.year.toString()}/${HelperMethods.currentMonthAsString(_currentDay)}/');

    ref.child(_currentDay.day.toString()).update({
      'end': _currentDay.toString(),
    }).then((value) {
      prefs.clear();
    });
  }
}
