import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../data/model/list_restaurant.dart';

enum ResultListState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late RestaurantListResult _restaurantListResult;
  late ResultListState _state;

  String _message = '';

  String get message => _message;
  ResultListState get state => _state;
  RestaurantListResult get restaurantListResult => _restaurantListResult;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultListState.loading;
      notifyListeners();
      final restaurants = await apiService.allRestaurant();
      if (restaurants.restaurants.isEmpty) {
        _state = ResultListState.noData;
      } else {
        _state = ResultListState.hasData;
        notifyListeners();
        return _restaurantListResult = restaurants;
      }
    } catch (e) {
      _state = ResultListState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
