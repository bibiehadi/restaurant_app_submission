import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/data/model/list_restaurant.dart';

import '../data/database/database_helper.dart';

class RestaurantFavoriteProvider extends ChangeNotifier {
  late DatabaseHelper _databaseHelper;
  List<RestaurantTile> _favorites = [];

  RestaurantFavoriteProvider() {
    _databaseHelper = DatabaseHelper();
    _getAllFavRestaurant();
  }

  List<RestaurantTile> get favorites => _favorites;

  // void addFavorite(Restaurant restaurant) {
  //   _favorites.add(restaurant);
  //   notifyListeners();
  // }

  // void removeFavorite(Restaurant restaurant) {
  //   _favorites.removeWhere((fav) => fav.id == restaurant.id);
  //   notifyListeners();

  void _getAllFavRestaurant() async {
    _favorites = await _databaseHelper.getFavRestauran();
    notifyListeners();
  }

  Future<RestaurantTile> getFavRestaurantById(String id) async {
    return await _databaseHelper.getFavById(id);
  }

  Future<void> addFavRestaurant(RestaurantTile restaurant) async {
    await _databaseHelper.insertFavRestaurant(restaurant);
    _getAllFavRestaurant();
  }

  void deleteFavRestaurant(String id) async {
    await _databaseHelper.delFav(id);
    _getAllFavRestaurant();
  }
}
