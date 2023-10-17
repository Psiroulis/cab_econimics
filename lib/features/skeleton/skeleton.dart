import 'package:cab_economics/features/ride_providers/presentation/pages/RideProviderPage.dart';
import 'package:cab_economics/features/skeleton/providers/selected_page_provider.dart';
import 'package:cab_economics/features/skeleton/widgets/custom_bottom_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> pages = const [
  RideProviderPage(),
];

class Skeleton extends StatelessWidget {
  static const String routeName = 'skeleton';
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cab Economics'),
      ),
      body: pages[selectedPage],
      bottomNavigationBar: CustomBottomBarWidget(),
    );
  }
}
