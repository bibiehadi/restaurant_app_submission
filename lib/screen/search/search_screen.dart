import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_submission/data/api/api_service.dart';
import 'package:restaurant_app_submission/provider/restaurant_search_provider.dart';

import '../../themes/themes.dart';
import '../home/component/card_restaurant.dart';

class SearchScreen extends StatefulWidget {
  static const String namedRoute = '/search';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  void init() {
    searchController.text = '';
  }

  @override
  dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (_) => RestaurantSearchProvider(apiService: ApiService()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Search'),
        ),
        body: Column(
          children: [
            Consumer<RestaurantSearchProvider>(
              builder: (context, state, _) {
                return TextField(
                  controller: searchController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                  onSubmitted: (value) {
                    state.fetchSearchRestaurant(value);
                  },
                );
              },
            ),
            Expanded(
              child: Consumer<RestaurantSearchProvider>(
                builder: (context, state, _) {
                  if (searchController.text == '') {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/restaurant.png',
                            fit: BoxFit.fill,
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Find restaurant',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  } else if (state.state == ResultListState.loading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/search.png',
                            fit: BoxFit.fill,
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Finding restaurant for you.'),
                        const Text('Please wait..'),
                      ],
                    );
                  } else if (state.state == ResultListState.hasData) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.restaurantListResult.founded,
                        itemBuilder: ((context, index) {
                          var restaurant =
                              state.restaurantListResult.restaurants[index];
                          return CardRestaurant(restaurant: restaurant);
                        }),
                      ),
                    );
                  } else if (state.state == ResultListState.noData) {
                    return Center(
                      child: Material(
                        child: Text(state.message),
                      ),
                    );
                  } else if (state.state == ResultListState.error) {
                    return Material(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/no-wifi.png',
                              fit: BoxFit.fill,
                              width: 150,
                              height: 150,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'No internet connection',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(
                      child: Material(
                        child: Text(''),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
