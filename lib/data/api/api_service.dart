import 'dart:convert';
import '../model/list_restaurant.dart';
import '../model/restaurant.dart';
import 'package:http/http.dart' show Client;

class ApiService {
  Client http = Client();
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantResult> restaurantDetail(String id) async {
    final response = await http.get(Uri.parse('${_baseUrl}detail/$id'));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail restaurant');
    }
  }

  Future<RestaurantListResult> allRestaurant() async {
    final response = await http.get(Uri.parse('${_baseUrl}list'));
    if (response.statusCode == 200) {
      return RestaurantListResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant');
    }
  }

  Future<RestaurantSearchResult> searchRestaurant(String keyword) async {
    try {
      final response =
          await http.get(Uri.parse('${_baseUrl}search?q=$keyword'));
      if (response.statusCode == 200) {
        return RestaurantSearchResult.fromJson(json.decode(response.body));
      } else {
        print('${response.statusCode}');
        throw Exception('Failed to load restaurant ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Failed to load restaurant $e');
    }
  }
}
