import 'package:flutter/material.dart';
import '../../../utils/date.util.dart';
import '../../../widgets/text.widget.dart';
import '../models/trip.model.dart';

class TripCardHome extends StatelessWidget {
  final Trip trip;

  const TripCardHome({required this.trip, Key? key}) : super(key: key);

  _getPlaceStyle(BuildContext context, Place place) {
    if (!place.visited) {
      return Theme.of(context).textTheme.bodyText2;
    }
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(fontWeight: FontWeight.bold);
  }

  _getIndividualPlace(BuildContext context, Place place) {
    return '${place.name} --> ';
  }

  String _getTripDuration(String startDateString, String endDateString) {
    DateTime startDate = convertStringToDate(startDateString);
    DateTime endDate = convertStringToDate(endDateString);

    if (startDate.year != endDate.year) {
      return '${startDate.day}-${startDate.month}, ${startDate.year} - ${endDate.day}-${startDate.month}, ${startDate.year}';
    }

    if (startDate.month != endDate.month) {
      return '${startDate.day}, ${months[startDate.month]} - ${endDate.day}, ${months[endDate.month]}';
    }

    return '${startDate.day}-${endDate.day}, ${months[startDate.month]}';
  }

  @override
  Widget build(BuildContext context) {
    final String tripDuration = _getTripDuration(trip.startDate, trip.endDate);

    return Container(
      height: 100.0,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
            child: Image.network(
              trip.image,
              fit: BoxFit.cover,
              height: 52.0,
              width: 52.0,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    B1Text(trip.tripName),
                    const Spacer(),
                    B2Text(tripDuration)
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText2,
                    children: trip.route
                        .map((place) => TextSpan(
                              text: _getIndividualPlace(context, place),
                              style: _getPlaceStyle(context, place),
                            ))
                        .toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(trip.status)],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
