import 'package:cab_economics/models/repository.dart';
import 'package:cab_economics/models/ride_provider.dart';

import '../models/shift.dart';

class DatabaseHelper {
  static Future<void> addNewShiftToDatabase(
      Shift shift, Repository repository) async {
    repository.importShiftToDb(shift);
  }

  static Future<void> endShiftToDb(Repository repository) async {
    repository.endShiftToDb();
  }

  static Future<void> createRideProvider(
      RideProvider rideProvider, Repository repository) async {
    repository.createRideProvider(rideProvider);
  }

  static Future<void> getAllRideProviders(Repository repository) async {
    return repository.getAllRideProviders();
  }
}
