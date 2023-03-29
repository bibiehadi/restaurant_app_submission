// import 'dart:convert';
// import '../modal/restaurant_result.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';

//   Future<RestaurantResult> restaurantDetail(id) async {
//     final response = await http.get(Uri.parse('${_baseUrl}detail/$id'));
//     if (response.statusCode == 200) {
//       return RestaurantResult.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load detail restaurant');
//     }
//   }

//   Future<RestaurantResult> allRestaurant() async {
//     final response = await http.get(Uri.parse('${_baseUrl}list/'));
//     if (response.statusCode == 200) {
//       return RestaurantResult.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load detail restaurant');
//     }
//   }
// }
