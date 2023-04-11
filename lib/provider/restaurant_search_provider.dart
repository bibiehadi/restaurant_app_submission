import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../data/model/list_restaurant.dart';
import '../enum/result_state_enum.dart';

class RestaurantSearchProvider with ChangeNotifier {
  final ApiService apiService;

  RestaurantSearchProvider({
    required this.apiService,
  });

  late RestaurantSearchResult _restaurantListResult;
  late ResultState _state;

  String _message = '';
  String get message => _message;
  ResultState get state => _state;
  RestaurantSearchResult get restaurantListResult => _restaurantListResult;

  Future<dynamic> fetchSearchRestaurant(String keyword) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurants = await apiService.searchRestaurant(keyword);
      if (restaurants.restaurants.isEmpty) {
        _state = ResultState.noData;
        _message = 'Data Tidak Tersedia';
        notifyListeners();
        return;
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
