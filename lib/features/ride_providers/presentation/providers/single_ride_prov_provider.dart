import 'package:cab_economics/core/params/params.dart';
import 'package:cab_economics/features/ride_providers/business/entities/ride_provider_entity.dart';
import 'package:cab_economics/features/ride_providers/business/usercases/get_ride_provider.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../data/datasources/ride_provider_remote_data_source.dart';
import '../../data/repositories/ride_provider_repository_impl.dart';

class SingleRideProviderProvider extends ChangeNotifier {
  RideProviderEntity? rideProvider;
  Failure? failure;

  SingleRideProviderProvider(
    this.rideProvider,
    this.failure,
  );

  void eitherFailureOrRideProvider({required String rideProviderId}) async {
    RideProviderRepositoryImpl repository = RideProviderRepositoryImpl(
      remoteDataSource: RideProvidersRemoteDataSourceImpl(),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrProvider = await GetRideProvider(repository).call(
      params: RideProviderParams(id: rideProviderId),
    );

    failureOrProvider.fold(
      (newFailure) {
        rideProvider = null;
        failure = newFailure;
        notifyListeners();
      },
      (newProvider) {
        rideProvider = newProvider;
        failure = null;
        notifyListeners();
      },
    );
  }
}
