import '../../../api/http.service.dart';

sendOtp(String phoneNumber) async {
  try {
    await MyHttp().request(
        url: '$baseUrl/v1/sendOtp',
        method: Method.post,
        params: {'phoneNumber': phoneNumber});
  } catch (e) {
    throw Exception('Failed to send otp.');
  }
}

verifyOtp(String phoneNumber, String otp) async {
  try {
    await MyHttp().request(
        url: '$baseUrl/v1/verifyOtp',
        method: Method.post,
        params: {otp: otp, phoneNumber: phoneNumber});
  } catch (e) {
    throw Exception('Failed to verify otp.');
  }
}

resendOtp(String phoneNumber) async {
  try {
    await MyHttp().request(
        url: '$baseUrl/v1/resendOtp',
        method: Method.post,
        params: {'phoneNumber': phoneNumber});
  } catch (e) {
    throw Exception('Failed to resend otp.');
  }
}
