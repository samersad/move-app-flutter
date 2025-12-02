import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token")??'';
  }
  static Future<bool> removeToken({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return  await prefs.remove(key);
  }

  static String getUserIdFromToken(String token) {
    final parts = token.split('.');
    print(parts);
    final payload = utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
    final decoded = jsonDecode(payload);
    print(decoded['id']);
    return decoded['id'] ?? '';
  }

  static Future<void> saveMovie(Map<String, dynamic> movie) async {
    final prefs = await SharedPreferences.getInstance();
    final token = await getToken();
    if (token.isEmpty) return;

    final userId = getUserIdFromToken(token);
    if (userId.isEmpty) return;

    List<String> saved = prefs.getStringList("saved_movies_$userId") ?? [];
    String movieJson = jsonEncode(movie);

    saved.removeWhere((movie) => movie == movieJson);
    saved.insert(0, movieJson);

    await prefs.setStringList("saved_movies_$userId", saved);
  }
  static Future<List<Map<String, dynamic>>> getSavedMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final token = await getToken();
    if (token.isEmpty) return [];
    final userId = getUserIdFromToken(token);
    List<String> saved = prefs.getStringList("saved_movies_$userId") ?? [];

    return saved
        .map((m) => jsonDecode(m) as Map<String, dynamic>)
        .toList();
  }



}
