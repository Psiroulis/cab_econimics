import 'package:cab_economics/core/errors/failure.dart';
import 'package:cab_economics/core/params/params.dart';
import 'package:cab_economics/core/success/success.dart';
import 'package:cab_economics/features/shifts/business/repositories/shifts_repository.dart';
import 'package:dartz/dartz.dart';

class CreateShift {
  final ShiftsRepository repository;

  CreateShift(this.repository);

  Future<Either<Failure, Success>> call({required ShiftParams params}) async {
    return repository.create(params: params);
  }
}
