import 'package:cab_economics/features/ride_providers/presentation/pages/ride_providers_page.dart';
import 'package:cab_economics/features/shifts/presentation/pages/shifts_page.dart';
import 'package:cab_economics/features/skeleton/providers/selected_page_provider.dart';
import 'package:cab_economics/features/skeleton/widgets/custom_bottom_bar_widget.dart';
import 'package:cab_economics/screrens/calendar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> pages = const [
  CalendarScreen(),
  ShiftsOverviewPage(),
  RideProviderPage(),
];

List<String> appBarTitles = const [
  'Home',
  'Shifts',
  'Expences',
  'Settings',
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
        title: Text(appBarTitles[selectedPage]),
      ),
      body: pages[selectedPage],
      bottomNavigationBar: const CustomBottomBarWidget(),
    );
  }
}
