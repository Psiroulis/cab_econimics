import 'package:cab_economics/core/connection/network_info.dart';
import 'package:cab_economics/core/errors/failure.dart';
import 'package:cab_economics/core/params/params.dart';
import 'package:cab_economics/features/ride_providers/business/entities/ride_provider_entity.dart';
import 'package:cab_economics/features/ride_providers/business/usercases/get_all_ride_providers.dart';
import 'package:cab_economics/features/ride_providers/business/usercases/get_ride_provider.dart';
import 'package:cab_economics/features/ride_providers/data/datasources/ride_provider_remote_data_source.dart';
import 'package:cab_economics/features/ride_providers/data/repositories/ride_provider_repository_impl.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/widgets.dart';

class RideProviderProvider extends ChangeNotifier {
  List<RideProviderEntity>? rideProvidersList;
  Failure? failure;

  RideProviderProvider({
    this.rideProvidersList,
    this.failure,
  });

  void eitherFailureOrRideProvider() async {
    RideProviderRepositoryImpl repository = RideProviderRepositoryImpl(
      remoteDataSource: RideProvidersRemoteDataSourceImpl(),
      networkInfo: NetworkInfoImpl(DataConnectionChecker()),
    );

    final failureOrProvider = await GetAllRideProviders(repository).call();

    failureOrProvider.fold(
      (newFailure) {
        rideProvidersList = null;
        failure = newFailure;
        notifyListeners();
      },
      (newProviderList) {
        rideProvidersList = newProviderList;
        failure = null;
        notifyListeners();
      },
    );
  }
}
