import 'package:cab_economics/global/globals.dart';
import 'package:cab_economics/helpers/db_helper.dart';
import 'package:cab_economics/models/ride_provider.dart';
import 'package:cab_economics/repositories/firebase.dart';
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
    DatabaseHelper.getAllRideProviders(Globals.repository);
  }

  @override
  Widget build(BuildContext context) {
    var firebaseProvider =
        Provider.of<FirebaseRepository>(context, listen: true);

    print("Wigdet build ${firebaseProvider.rideProviders.length}");

    return Scaffold(
      appBar: AppBar(
        title: Text('Ride Providers'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < firebaseProvider.rideProviders.length; i++)
              listTile(firebaseProvider.rideProviders[i])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddNewDialog();
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

Widget listTile(RideProvider rideProvider) {
  return Text(rideProvider.name!);
}
