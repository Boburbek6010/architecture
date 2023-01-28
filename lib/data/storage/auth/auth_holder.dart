abstract class AuthHolder {
  late String authToken;
  late String refreshToken;
  late String username;
  late String userId;
  late int authTokenExpiredDate;
  late int refreshTokenExpiredDate;
  late String firstName;
  late String lastName;
  late String  email;
  late String phone;
  late String fcmToken;

  Future<void> clearAuth();
}