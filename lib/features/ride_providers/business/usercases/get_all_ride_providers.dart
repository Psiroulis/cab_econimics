import 'package:cab_economics/core/errors/failure.dart';
import 'package:cab_economics/features/ride_providers/business/entities/ride_provider_entity.dart';
import 'package:cab_economics/features/ride_providers/business/repositories/ride_provides_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllRideProviders {
  final RideProviderRepository repository;

  GetAllRideProviders(this.repository);

  Future<Either<Failure, List<RideProviderEntity>>> call() async {
    return await repository.getAllRideProviders();
  }
}
