import '../../../api/http.service.dart';
import '../models/profile.model.dart';

submitProfile(Profile profile) async {
  try {
    await MyHttp().request(
        url: '$baseUrl/v1/submitProfile',
        method: Method.post,
        params: profile.toJson());
  } catch (e) {
    throw Exception('Failed to verify otp.');
  }
}
