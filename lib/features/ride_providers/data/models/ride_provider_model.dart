import 'package:cab_economics/features/ride_providers/business/entities/ride_provider_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RideProviderModel extends RideProviderEntity {
  const RideProviderModel({
    required String id,
    required String name,
    required int commission,
  }) : super(
          id: id,
          name: name,
          commission: commission,
        );

  factory RideProviderModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return RideProviderModel(
      id: snapshot.id,
      name: data?['name'],
      commission: data?['commission'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name" : name,
      "commission" : commission
    };
  }
}
