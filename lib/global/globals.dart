import 'package:cab_economics/models/repository.dart';
import 'package:cab_economics/repositories/firebase.dart';

class Globals {

  static Repository repository = FirebaseRepository();

}