import 'package:flutter/material.dart';
import '../../constants/strings.constant.dart';
import '../../routes/route.constant.dart';
import '../../models/bottom_nav_items.model.dart';
import '../../widgets/body.widget.dart';
import '../profile/profile.dart';
import '../../widgets/bottom_navigation_bar.widget.dart';

import '../your_trips/your_trips.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget _page;

  _assignPage(String itemName) {
    switch (itemName) {
      case BottomNavItems.home:
        _page = const YourTrips();
        break;
      case BottomNavItems.profile:
        _page = const Profile();
        break;
    }
    setState(() {});
  }

  _onSelectedItem(String itemName) {
    _assignPage(itemName);
  }

  @override
  void initState() {
    _assignPage(BottomNavItems.home);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Body(
        child: _page,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, Routes.filters);
        },
        label: const Text(StringConstants.addNewTrip),
        icon: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: BottomNavBar(_onSelectedItem),
    );
  }
}
