import 'package:cab_economics/core/errors/failure.dart';
import 'package:cab_economics/features/ride_providers/business/entities/ride_provider_entity.dart';
import 'package:cab_economics/features/ride_providers/presentation/providers/ride_provider_provider.dart';
import 'package:cab_economics/global/globals.dart';
import 'package:cab_economics/helpers/db_helper.dart';
import 'package:cab_economics/models/ride_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RideProvidersScreen extends StatefulWidget {
  static const String routeName = 'rideProviders_screen';

  const RideProvidersScreen({super.key});

  @override
  State<RideProvidersScreen> createState() => _RideProvidersScreenState();
}

class _RideProvidersScreenState extends State<RideProvidersScreen> {
  final TextEditingController _edtNameController = TextEditingController();
  final TextEditingController _edtCommisionController = TextEditingController();

  void showAddNewDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _edtNameController,
                    decoration: const InputDecoration(helperText: "Name"),
                  ),
                  TextField(
                    controller: _edtCommisionController,
                    decoration: const InputDecoration(helperText: "Commission"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      RideProvider rideProvider = RideProvider(
                        name: _edtNameController.text,
                        commission: int.tryParse(_edtCommisionController.text),
                      );
                      DatabaseHelper.createRideProvider(
                              rideProvider, Globals.repository)
                          .then((value) {
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text('Create Provider'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    Provider.of<RideProviderProvider>(context, listen: false)
        .eitherFailureOrRideProvider();
    super.initState();
  }

  void check(){
    Provider.of<RideProviderProvider>(context, listen: false)
        .eitherFailureOrRideProvider();
  }

  @override
  Widget build(BuildContext context) {
    List<RideProviderEntity>? providersList =
        Provider.of<RideProviderProvider>(context).rideProvidersList;

    Failure? failure = Provider.of<RideProviderProvider>(context).failure;

    print('from screen : ${providersList?.length}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Providers'),
      ),
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
          check();
          //showAddNewDialog();
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

Widget listTile(RideProviderEntity rideProvider) {
  return Text(rideProvider.name);
}
