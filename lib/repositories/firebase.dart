import 'package:cab_economics/models/repository.dart';
import 'package:cab_economics/models/ride_provider.dart';
import 'package:cab_economics/models/shift.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/helper_methods.dart';

class FirebaseRepository with ChangeNotifier implements Repository {
  final DateTime _currentDay = DateTime.now();
  final DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  final List<RideProvider> _rideProviders = [];

  List<RideProvider> get rideProviders => _rideProviders;

  @override
  Future<void> importShiftToDb(Shift shift) async {
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
  Future<void> endShiftToDb() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    DatabaseReference ref = FirebaseDatabase.instance.ref(
        'shifts/${_currentDay.year.toString()}/${HelperMethods.currentMonthAsString(_currentDay)}/');

    ref.child(_currentDay.day.toString()).update({
      'end': _currentDay.toString(),
    }).then((value) {
      prefs.clear();
    });
  }

  @override
  Future<void> createRideProvider(RideProvider rideProvider) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref();

    Map newProvider = {
      'created_at': _currentDay.toString(),
      'name': rideProvider.name,
      'commission': rideProvider.commission,
    };

    ref.child('ride_providers').push().set(newProvider);
  }

  @override
  Future<void> getAllRideProviders() async {
    print('in firebase repo running 1');

    dbRef.child('ride_providers').onValue.listen((data) {

      print('in firebase repo running 2');



      var gg = data.snapshot.value as Map;

      print('$gg');

      gg.forEach((key, value) {
        var provider = RideProvider.fromJson(value);
        print('provider: ${provider.name}');
        _rideProviders.add(provider);
      });

      print('in firebase repo running 3');

      print('in firebase repo running 4');

      notifyListeners();

    });


  }
}
