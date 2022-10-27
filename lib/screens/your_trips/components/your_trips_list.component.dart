import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../constants/strings.constant.dart';
import '../../../routes/route.constant.dart';
import '../../../widgets/alert_dialog.widget.dart';
import '../api/trip_card.api.dart';
import '../models/trip.model.dart';
import 'trip_card_home.component.dart';

class YourTripsList extends StatefulWidget {
  const YourTripsList({Key? key}) : super(key: key);

  @override
  State<YourTripsList> createState() => _YourTripsListState();
}

class _YourTripsListState extends State<YourTripsList> {
  List<Trip>? trips;
  Future? _getMyTripsData;

  @override
  void initState() {
    _getMyTripsData = _refreshTrips();
    super.initState();
  }

  Future _refreshTrips() async {
    final refreshTrips = await getMyTrips();
    setState(() {
      trips = refreshTrips;
    });
  }

  _onClickTrip(Trip item) {
    Navigator.pushNamed(context, Routes.tripViewer);
  }

  _getItemBuilder(Trip trip, int index) {
    return GestureDetector(
      onTap: () => _onClickTrip(trip),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 32.0, 0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete_outline_rounded,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) {
          deleteTrip() {
            if (!trips!.contains(trip)) {
              return;
            }

            setState(() {
              trips!.removeWhere((x) => x.tripId == trip.tripId);
            });

            Navigator.of(context).pop();
          }

          cancelDeletion() {
            Navigator.of(context).pop();
            setState(() {});
          }

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Alert(
                    content: StringConstants.areYouSureYouWantToDelete,
                    successMessage: StringConstants.yes,
                    onSuccess: deleteTrip,
                    failMessage: StringConstants.cancel,
                    onFail: cancelDeletion);
              });
        },
        child: TripCardHome(trip: trip),
      ),
    );
  }

  _getListWithChild({List<Trip>? items, bool isSkeleton = false}) {
    if (isSkeleton) {
      return Expanded(
        child: ListView.separated(
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (BuildContext context, int index) => Shimmer(
            color: Colors.white70,
            colorOpacity: 0.2,
            duration: const Duration(seconds: 1),
            interval: const Duration(milliseconds: 500),
            child: Container(
              height: 100.0,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      );
    }

    if (items == null) {
      return const SizedBox();
    }

    return Expanded(
      child: RefreshIndicator(
        displacement: 100,
        backgroundColor: Colors.white,
        color: Colors.amber,
        strokeWidth: 3,
        onRefresh: _refreshTrips,
        child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (BuildContext context, int index) =>
                _getItemBuilder(items[index], index)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMyTripsData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return _getListWithChild(isSkeleton: true);
        }

        if (snapshot.hasError) {
          return const SizedBox();
        }

        return _getListWithChild(items: trips, isSkeleton: false);
      },
    );
  }
}
