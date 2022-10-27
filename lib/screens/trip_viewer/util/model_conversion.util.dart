import '../../filters/models/create_trip.response.dart';
import '../../filters/models/dnd.model.dart';
import '../models/save_trip.request.dart';

class DndModelConverter {
  static SaveTripRequest convert(
      DndTrip dndTrip, Map<String, PlaceDetails> places) {
    List<PlaceEditable> newRoute = [];

    var oldRoute = dndTrip.route;
    for (var dayIdx = 0; dayIdx < oldRoute.length; dayIdx++) {
      var dayTrip = oldRoute[dayIdx];

      for (var placeIdx = 0; placeIdx < dayTrip.items.length; placeIdx++) {
        newRoute.add(dayTrip.items[placeIdx]);
      }
    }
    return SaveTripRequest(
      places: places,
      trip: Trip(
          tripId: dndTrip.tripId,
          tripName: dndTrip.tripName,
          image: dndTrip.image,
          startDate: dndTrip.startDate,
          endDate: dndTrip.endDate,
          route: newRoute),
    );
  }
}
