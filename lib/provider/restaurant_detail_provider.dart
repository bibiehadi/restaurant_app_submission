import 'dart:async';

import 'package:flutter/material.dart';

import '../data/api/api_service.dart';
import '../data/modal/restaurant.dart';

enum ResultState { loading, noData, hasData, error, noInternet }

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  RestaurantDetailProvider({required this.apiService, required this.id}) {
    _fetchRestaurantDetail(id);
  }

  late RestaurantResult _restaurantResult;
  late ResultState _state;

  String _message = '';

  String get message => _message;
  ResultState get state => _state;
  RestaurantResult get restaurantResult => _restaurantResult;

  Future<dynamic> _fetchRestaurantDetail(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.restaurantDetail(id);
      if (restaurant.restaurant.id.isEmpty) {
        _state = ResultState.noData;
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } on TimeoutException catch (_) {
      _state = ResultState.noInternet;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
