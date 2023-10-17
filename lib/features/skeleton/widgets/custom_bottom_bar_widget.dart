import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/selected_page_provider.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;

    return SafeArea(
      child: BottomAppBar(
        elevation: 5,
        child:Row(
          children: [
            Text("1"),
            Text("2"),
            Text("3"),
          ],
        ),

      ),
    );
  }
}
