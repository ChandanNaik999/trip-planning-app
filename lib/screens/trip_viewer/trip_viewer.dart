import 'package:flutter/material.dart';
import '../../constants/error_messages.constant.dart';
import '../filters/models/create_trip.response.dart';

import '../../api/api.util.dart';
import '../../widgets/snackbar.widget.dart';
import '../filters/util/model_conversion.util.dart';
import 'api/save_trip.api.dart';
import 'components/trip_bottom_sheet.component.dart';

class TripViewer extends StatefulWidget {
  const TripViewer({Key? key}) : super(key: key);

  @override
  State<TripViewer> createState() => _TripViewerState();
}

class _TripViewerState extends State<TripViewer> {
  CreateTripResponse? _tripsInput;

  @override
  Widget build(BuildContext context) {
    _tripsInput =
        ModalRoute.of(context)!.settings.arguments as CreateTripResponse;

    return Scaffold(
        appBar: null,
        body: TripBottomSheet(
          dndModel: CreateTripResponseConverter.convert(_tripsInput!),
          onSaveList: (val) => asyncFunctionWithLoading(
            context: context,
            asyncFunction: () => saveTrip(val),
            errorMessage: ErrorMessages.couldNotSaveTrip,
            onSuccess: () => SuccessfulSnackbar(context: context),
          ),
        ));
  }
}
