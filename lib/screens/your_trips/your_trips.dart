import 'package:flutter/material.dart';
import 'package:trip_planning_app/widgets/header_spacer.widget.dart';

import '../../constants/strings.constant.dart';
import '../../widgets/text.widget.dart';
import 'components/your_trips_list.component.dart';

class YourTrips extends StatefulWidget {
  const YourTrips({Key? key}) : super(key: key);

  @override
  State<YourTrips> createState() => _YourTripsState();
}

class _YourTripsState extends State<YourTrips> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        HeaderSpacer(),
        H2Text(StringConstants.headerYourTrips),
        YourTripsList()
      ],
    );
  }
}
