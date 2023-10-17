import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/errors/failure.dart';
import '../../business/entities/ride_provider_entity.dart';
import '../providers/ride_provider_provider.dart';

class RideProviderPage extends StatefulWidget {
  const RideProviderPage({super.key});

  @override
  State<RideProviderPage> createState() => _RideProviderPageState();
}

class _RideProviderPageState extends State<RideProviderPage> {
  @override
  void initState() {
    Provider.of<RideProviderProvider>(context, listen: false)
        .eitherFailureOrRideProvider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<RideProviderEntity>? providersList =
        Provider.of<RideProviderProvider>(context).rideProvidersList;

    Failure? failure = Provider.of<RideProviderProvider>(context).failure;

    late Widget widget;

    if (providersList != null) {
      widget = Scaffold(
        body: providersList != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < providersList.length; i++)
                      listTile(providersList[i]),
                  ],
                ),
              )
            : const Center(
                child: Text("Problem"),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //showAddNewDialog();
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      );
    } else if (failure != null) {
      widget = Expanded(
        child: Center(
          child: Text(
            failure.errorMessage,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );
    } else {
      widget = const Expanded(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.orangeAccent,
          ),
        ),
      );
    }

    return widget;
  }
}

Widget listTile(RideProviderEntity rideProvider) {
  return Text(rideProvider.name);
}
