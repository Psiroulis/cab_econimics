import 'package:cab_economics/core/errors/exceptions.dart';
import 'package:cab_economics/core/errors/failure.dart';
import 'package:cab_economics/core/params/params.dart';
import 'package:cab_economics/features/ride_providers/business/entities/ride_provider_entity.dart';
import 'package:cab_economics/features/ride_providers/business/repositories/ride_provides_repository.dart';
import 'package:cab_economics/features/ride_providers/data/datasources/ride_provider_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/connection/network_info.dart';

class RideProviderRepositoryImpl implements RideProviderRepository {
  final RideProviderRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  RideProviderRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<RideProviderEntity>>>
      getAllRideProviders() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteProviders = await remoteDataSource.getAllRideProviders();
        return Right(remoteProviders);
      } on ServerException {
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    } else {
      return Left(CacheFailure(errorMessage: 'Cache is not impl yet!!!'));
    }
  }

  @override
  Future<Either<Failure, RideProviderEntity>> getRideProvider({required RideProviderParams params}) {
    // TODO: implement getRideProvider
    throw UnimplementedError();
  }
}
