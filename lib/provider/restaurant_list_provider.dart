import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../data/model/list_restaurant.dart';
import '../enum/result_state_enum.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late RestaurantListResult _restaurantListResult;
  late ResultState _state;

  String _message = '';
  String get message => _message;
  ResultState get state => _state;
  RestaurantListResult get restaurantListResult => _restaurantListResult;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurants = await apiService.allRestaurant();
      if (restaurants.restaurants.isEmpty) {
        _state = ResultState.noData;
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantListResult = restaurants;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
