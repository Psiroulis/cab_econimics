import 'package:cab_economics/core/errors/failure.dart';
import 'package:cab_economics/features/shifts/business/entities/shift_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/params/params.dart';
import '../../../../core/success/success.dart';

abstract class ShiftsRepository {
  Future<Either<Failure, Success>> create({required ShiftParams params});

  Future<Either<Failure, List<ShiftEntity>>> read();

  Future<Either<Failure, List<ShiftEntity>>> readPerYear(int year);

  Future<Either<Failure, List<ShiftEntity>>> readPerMonth(int month);

  Future<Either<Failure, List<ShiftEntity>>> readPerWeek(int week);

  Future<Either<Failure, Success>> update({required ShiftParams params});

  Future<Either<Failure, Success>> delete({required ShiftParams params});
}
