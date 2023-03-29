
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'menu.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menu menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) {
    List<dynamic> drinks = restaurant['menus']['drinks'];
    List<dynamic> foods = restaurant['menus']['foods'];

    return Restaurant(
      id: restaurant['id'],
      name: restaurant['name'],
      description: restaurant['description'],
      pictureId: restaurant['pictureId'],
      city: restaurant['city'],
      rating: restaurant['rating'].toDouble(),
      menus: Menu(
        drinks: drinks.map((e) => '${e['name']}').toList(),
        foods: foods.map((e) => '${e['name']}').toList(),
      ),
    );
  }
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  // print(parsed);
  return parsed.map((res) => Restaurant.fromJson(res)).toList();
}
