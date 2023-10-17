import 'package:cab_economics/core/constants/constants.dart';
import 'package:cab_economics/core/errors/exceptions.dart';
import 'package:cab_economics/core/params/params.dart';
import 'package:cab_economics/features/ride_providers/data/models/ride_provider_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RideProviderRemoteDataSource {
  Future<List<RideProviderModel>> getAllRideProviders();

  Future<RideProviderModel> getRideProvider(
      {required RideProviderParams params});
}

class RideProvidersRemoteDataSourceImpl
    implements RideProviderRemoteDataSource {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<RideProviderModel>> getAllRideProviders() async {
    List<RideProviderModel> remoteData = [];

    await db.collection(rdpCollection).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          remoteData.add(RideProviderModel.fromFirestore(docSnapshot, null));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

    return remoteData;
  }

  @override
  Future<RideProviderModel> getRideProvider(
      {required RideProviderParams params}) async {
    final ref = db.collection(rdpCollection).doc(params.id).withConverter(
          fromFirestore: RideProviderModel.fromFirestore,
          toFirestore: (RideProviderModel model, _) => model.toFirestore(),
        );

    final docSnap = await ref.get();

    final rideProvider = docSnap.data();

    if (rideProvider != null) {
      return rideProvider;
    } else {
      throw ServerException();
    }
  }
}
