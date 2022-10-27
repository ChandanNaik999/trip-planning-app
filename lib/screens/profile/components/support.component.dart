import 'package:flutter/material.dart';

import '../../../constants/strings.constant.dart';
import '../../../widgets/text.widget.dart';

class SupportComponent extends StatelessWidget {
  const SupportComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const H3Text(StringConstants.support),

        // Email
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: StringConstants.emailUsAt,
                  style: Theme.of(context).textTheme.bodyText1),
              TextSpan(
                  text: StringConstants.email,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),

        // Phone
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: StringConstants.callUsOn,
                  style: Theme.of(context).textTheme.bodyText1),
              TextSpan(
                  text: StringConstants.phone,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
