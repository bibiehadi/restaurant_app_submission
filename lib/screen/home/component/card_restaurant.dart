import 'package:flutter/material.dart';

import '../../../data/model/list_restaurant.dart';
import '../../../themes/themes.dart';
import '../../restaurant_detail/restaurant_screen.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  const CardRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RestaurantScreen.namedRoute,
            arguments: restaurant.id);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: thirdColor),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: thirdColor),
        margin: const EdgeInsets.symmetric(
            horizontal: listMargin, vertical: listMargin / 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: thirdColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: thirdColor),
              child: Hero(
                tag: restaurant.pictureId,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
                    width: 150,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('\$\$\$\$',
                          style: Theme.of(context).textTheme.labelSmall),
                      const Text(' • '),
                      Text('Cafe, Fast food',
                          style: Theme.of(context).textTheme.labelSmall),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(restaurant.rating.toString(),
                          style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 12,
                        color: Colors.red.shade400,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        restaurant.city,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
