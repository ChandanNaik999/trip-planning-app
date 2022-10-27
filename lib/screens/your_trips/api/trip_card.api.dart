import 'dart:convert';

import '../../../api/http.service.dart';
import '../models/trip.model.dart';

Future<List<Trip>> getMyTrips() async {
  try {
    var response =
        await MyHttp().request(url: '$baseUrl/v1/myTrips', method: Method.get);
    List<Trip> trips = (json.decode(response.data)['data']['trips'] as List)
        .map((i) => Trip.fromJson(i))
        .toList();
    return trips;
  } catch (e) {
    throw Exception('Failed to fetch trips');
  }
}

deleteTrip(String tripId) async {
  try {
    await MyHttp()
        .request(url: '$baseUrl/v1/trips/$tripId', method: Method.delete);
  } catch (e) {
    throw Exception('Failed to delete trip');
  }
}
