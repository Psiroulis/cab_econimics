import 'package:cab_economics/models/ride_provider.dart';
import 'package:cab_economics/models/shift.dart';
import 'package:flutter/cupertino.dart';

abstract class Repository{
  Future<void> importShiftToDb(Shift shift);
  Future<void> endShiftToDb();

  Future<void> createRideProvider(RideProvider rideProvider);

  Future<void> getAllRideProviders();



}