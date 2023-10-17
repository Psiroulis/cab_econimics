import 'package:cab_economics/core/errors/failure.dart';
import 'package:cab_economics/core/params/params.dart';
import 'package:cab_economics/features/ride_providers/business/entities/ride_provider_entity.dart';
import 'package:cab_economics/features/ride_providers/business/repositories/ride_provides_repository.dart';
import 'package:dartz/dartz.dart';

class GetRideProvider{
  final RideProviderRepository repository;

  GetRideProvider(this.repository);

  Future<Either<Failure,RideProviderEntity>> call({required RideProviderParams params}) async {
    return repository.getRideProvider(params: params);
  }
}