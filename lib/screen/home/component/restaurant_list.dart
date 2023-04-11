import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/provider/restaurant_list_provider.dart';
import 'package:restaurant_app_submission/screen/home/component/card_restaurant.dart';

import '../../../enum/result_state_enum.dart';
import '../../../themes/themes.dart';

import 'package:provider/provider.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding),
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.grey.shade200,
                        side: const BorderSide(color: primaryColor, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'All',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: secondaryColor),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.grey.shade200,
                        side: const BorderSide(color: primaryColor, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Near Me',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: secondaryColor),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.grey.shade200,
                        side: const BorderSide(color: primaryColor, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Rated 4.5+',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: secondaryColor),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.grey.shade200,
                        side: const BorderSide(color: primaryColor, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Price',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: secondaryColor),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Colors.grey.shade200,
                        side: const BorderSide(color: primaryColor, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Open Now',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: secondaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<RestaurantProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(color: secondaryColor),
                    );
                  } else if (state.state == ResultState.hasData) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.restaurantListResult.count,
                        itemBuilder: ((context, index) {
                          var restaurant =
                              state.restaurantListResult.restaurants[index];
                          return CardRestaurant(restaurant: restaurant);
                        }),
                      ),
                    );
                  } else if (state.state == ResultState.noData) {
                    return Center(
                      child: Material(
                        child: Text(state.message),
                      ),
                    );
                  } else if (state.state == ResultState.error) {
                    return Material(
                      color: primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/no-wifi.png',
                              fit: BoxFit.fill,
                              width: 200,
                              height: 200,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
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
                    return Center(
                      child: Material(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/no-wifi.png',
                                fit: BoxFit.fill,
                                width: 200,
                                height: 200,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
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
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
