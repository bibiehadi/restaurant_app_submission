import 'package:flutter/material.dart';

import '../../../data/api/api_service.dart';
import '../../../data/modal/restaurant.dart';
import '../../../themes/themes.dart';
import '../../restaurant_detail/restaurant_screen.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  // late Future<RestaurantResult> _restaurant;

  // @override
  // void initState() {
  //   super.initState();
  //   _restaurant = ApiService().allRestaurant();
  // }

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
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/local_restaurant.json'),
                builder: (context, snapshot) {
                  final List<Restaurant> restaurants =
                      parseRestaurant(snapshot.data);
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: ListView.builder(
                      itemCount: restaurants.length,
                      itemBuilder: ((context, index) {
                        return _buildRestaurantItem(
                            context, restaurants[index]);
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

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RestaurantScreen.namedRoute,
            arguments: restaurant);
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
                    restaurant.pictureId,
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
                  // const SizedBox(
                  //   height: 4,
                  // ),
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
