import 'package:cab_economics/models/repository.dart';

import '../models/shift.dart';

class DatabaseHelper {
  static void addNewShiftToDatabase(
      Shift shift, Repository repository) async {
    repository.importShiftToDb(shift);
  }

  static void endShiftToDb(Repository repository){
    repository.endShiftToDb();
  }
}
