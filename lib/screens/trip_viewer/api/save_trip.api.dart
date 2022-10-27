import '../../../api/http.service.dart';
import '../models/save_trip.request.dart';

saveTrip(SaveTripRequest trip) async {
  try {
    await MyHttp().request(
        url: '$baseUrl/v1/saveTrip',
        method: Method.post,
        params: {'trip': trip});
  } catch (e) {
    throw Exception('Failed to save trip.');
  }
}
