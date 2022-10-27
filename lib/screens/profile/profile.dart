import 'package:flutter/material.dart';
import 'package:trip_planning_app/widgets/header_spacer.widget.dart';

import '../../constants/strings.constant.dart';
import '../../widgets/secondary_button.widget.dart';
import '../../widgets/text.widget.dart';
import 'components/support.component.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const HeaderSpacer(),
        Row(
          children: <Widget>[
            // const CircleAvatar(
            //   child: Image(
            //     image: AssetImage("assets/images/google_logo.png"),
            //     height: 32.0,
            //     width: 32.0,
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: const H2Text('${StringConstants.hi} User'),
            ),
          ],
        ),
        // const SizedBox(height: 32),
        // const SizedBox(
        //     width: double.infinity,
        //     child: PrimaryButton(text: StringConstants.donateText)),
        const WidgetSpacer(type: WidgetSpacerType.large),
        const SizedBox(
          width: double.infinity,
          child: SecondaryButton(text: StringConstants.logout),
        ),
        const WidgetSpacer(type: WidgetSpacerType.large),
        const SupportComponent(),
      ],
    );
  }
}
