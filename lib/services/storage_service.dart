import 'dart:convert';

import 'package:estate_iq/data/models/auth_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> saveAuthResponse(AuthResponse authResponse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_response', jsonEncode(authResponse.toJson()));
  }

  Future<AuthResponse?> getAuthResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authResponseJson = prefs.getString('auth_response');
    if (authResponseJson != null) {
      return AuthResponse.fromJson(jsonDecode(authResponseJson));
    }
    return null;
  }

  Future<void> deleteAuthResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_response');
  }

  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<void> saveTwilioAccessToken(String twilioAccessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('twilio_access_token', twilioAccessToken);
  }

  Future<String?> getTwilioAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('twilio_access_token');
  }

  Future<void> saveFCMToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcm_token', token);
  }

  Future<String?> getFCMToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcm_token');
  }

  Future<void> clear() async {
    await deleteAuthResponse();
    await clearToken();
  }
}
