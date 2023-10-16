import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/ride_provider_entity.dart';

abstract class RideProviderRepository {
  Future<Either<Failure, RideProviderEntity>> getAllRideProviders();
}
