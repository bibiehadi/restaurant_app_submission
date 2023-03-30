import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/screen/home/component/card_restaurant.dart';

import '../../../data/api/api_service.dart';
import '../../../data/modal/list_restaurant.dart';
import '../../../themes/themes.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  late Future<RestaurantListResult> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().allRestaurant();
  }

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
              child: FutureBuilder(
                future: _restaurant,
                builder:
                    (context, AsyncSnapshot<RestaurantListResult> snapshot) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.restaurants.length,
                      itemBuilder: ((context, index) {
                        var restaurant = snapshot.data?.restaurants[index];
                        if (restaurant != null) {
                          return CardRestaurant(restaurant: restaurant);
                        }
                        return null;
                      }),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
