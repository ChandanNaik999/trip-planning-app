import 'dart:convert';

import '../../../api/http.service.dart';
import '../models/create_trip.response.dart';
import '../models/filter.model.dart';

Future<CreateTripResponse> createTrip(FilterModel filters) async {
  try {
    var response = await MyHttp().request(
        url: '$baseUrl/v1/createTrip',
        method: Method.post,
        params: {"filters": filters.toJson()});

    CreateTripResponse jsonResponse =
        CreateTripResponse.fromJson(json.decode(response.data));

    return jsonResponse;
  } catch (e) {
    throw Exception('Failed to create trip.');
  }
}
