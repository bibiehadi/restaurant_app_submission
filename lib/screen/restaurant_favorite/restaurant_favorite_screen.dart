import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_submission/data/model/list_restaurant.dart';

import '../../provider/restaurant_favorite_provider.dart';
import '../../themes/themes.dart';
import '../../widget/card_restaurant.dart';

class RestaurantFavorite extends StatelessWidget {
  const RestaurantFavorite({super.key});

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
        child: Consumer<RestaurantFavoriteProvider>(
          builder: (context, state, _) {
            if (state.favorites.isNotEmpty) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.favorites.length,
                  itemBuilder: ((context, index) {
                    var favRestaurant = state.favorites[index];
                    if (state.favorites.isNotEmpty) {
                      return CardRestaurant(
                          restaurant: RestaurantTile(
                              id: favRestaurant.id,
                              name: favRestaurant.name,
                              description: favRestaurant.description,
                              pictureId: favRestaurant.pictureId,
                              city: favRestaurant.city,
                              rating: favRestaurant.rating));
                    }
                    return null;
                  }),
                ),
              );
            } else {
              return Center(
                child: Material(
                  color: primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'assets/images/restaurant.png',
                          fit: BoxFit.fill,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        'No restaurant has been added',
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
    );
  }
}
