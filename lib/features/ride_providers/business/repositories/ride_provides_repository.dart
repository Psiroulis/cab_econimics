import 'package:cab_economics/core/params/params.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/ride_provider_entity.dart';

abstract class RideProviderRepository {
  Future<Either<Failure, List<RideProviderEntity>>> getAllRideProviders();

  Future<Either<Failure, RideProviderEntity>> getRideProvider(
      {required RideProviderParams params});
}
