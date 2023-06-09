import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/data/api/api_service.dart';
import 'package:restaurant_app_submission/data/model/list_restaurant.dart';
import 'package:restaurant_app_submission/data/model/restaurant.dart';
import 'package:restaurant_app_submission/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app_submission/provider/restaurant_favorite_provider.dart';
import 'package:restaurant_app_submission/themes/themes.dart';
import 'package:provider/provider.dart';

import '../../enum/result_state_enum.dart';

class RestaurantScreen extends StatefulWidget {
  static const String namedRoute = '/restaurant';
  final String restaurantId;
  const RestaurantScreen({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  State<RestaurantScreen> createState() {
    return _RestaurantScreenState();
  }
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    String resId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: thirdColor,
      body: ChangeNotifierProvider(
        create: (_) => RestaurantDetailProvider(
            apiService: ApiService(),
            restaurantId:
                widget.restaurantId == '' ? resId : widget.restaurantId),
        child: Consumer<RestaurantDetailProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(color: secondaryColor),
              );
            } else if (state.state == ResultState.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Hero(
                                  tag: state
                                      .restaurantResult.restaurant.pictureId,
                                  child: Image.network(
                                    'https://restaurant-api.dicoding.dev/images/medium/${state.restaurantResult.restaurant.pictureId}',
                                    fit: BoxFit.fitWidth,
                                  )),
                            ),
                            SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: primaryColor,
                                      child: IconButton(
                                        icon: const Icon(Icons.arrow_back),
                                        color: Colors.white,
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 15,
                                right: 10,
                                child: FavoriteButton(
                                    restaurant:
                                        state.restaurantResult.restaurant))
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.restaurantResult.restaurant.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star_border_outlined,
                                    size: 20,
                                    color: Colors.amber.shade600,
                                  ),
                                  Text(
                                      state.restaurantResult.restaurant.rating
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(state.restaurantResult.restaurant.address,
                              style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 20,
                                    color: Colors.red.shade400,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(state.restaurantResult.restaurant.city,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ],
                              ),
                              const SizedBox(
                                width: 100.0,
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 40,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: state
                                        .restaurantResult.restaurant.categories
                                        .map(
                                          (cat) => Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            alignment: Alignment.center,
                                            child: TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                backgroundColor:
                                                    Colors.grey.shade200,
                                                side: const BorderSide(
                                                    color: primaryColor,
                                                    width: 1),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                              child: Text(
                                                cat.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                        color: secondaryColor),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Price',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rp. 50,000 - Rp. 100,000',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description : ',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Wrap(
                            children: [
                              Text(
                                state.restaurantResult.restaurant.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: isReadMore ? 10 : 2,
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  child: Text(
                                    isReadMore ? "Read less" : "Read more",
                                    style:
                                        const TextStyle(color: secondaryColor),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      isReadMore = !isReadMore;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 25,
                            thickness: 1,
                            indent: 3,
                            endIndent: 5,
                          ),
                          Text(
                            'Menus : ',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Foods : ',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            height: 130,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: state
                                    .restaurantResult.restaurant.menus.foods
                                    .map((food) {
                                  return Container(
                                      width: 130,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Image.asset(
                                                'assets/images/ramen.png',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            food.name,
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ));
                                }).toList()),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Drinks : ',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            height: 130,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: state
                                  .restaurantResult.restaurant.menus.drinks
                                  .map(
                                (drink) {
                                  return Container(
                                    width: 130,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: const EdgeInsets.all(4.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Image.asset(
                                              'assets/images/drink.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Text(drink.name)
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Divider(
                            color: Colors.grey,
                            height: 25,
                            thickness: 1,
                            indent: 3,
                            endIndent: 5,
                          ),
                          Text(
                            'Review : ',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: state
                                  .restaurantResult.restaurant.customerReviews
                                  .map(
                                (reviewer) {
                                  return Container(
                                    width: 200,
                                    padding: const EdgeInsets.all(10.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          reviewer.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          reviewer.date,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          reviewer.review,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state.state == ResultState.noData) {
              return Center(
                child: Material(
                  color: thirdColor,
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
                ),
              );
            } else if (state.state == ResultState.error) {
              return Center(
                child: Material(
                  color: thirdColor,
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
                ),
              );
            } else {
              return Center(
                child: Material(
                  color: thirdColor,
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
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantFavoriteProvider>(
      builder: ((context, value, child) {
        if (value.favorites.where((res) => res.id == restaurant.id).isEmpty) {
          return GestureDetector(
            onTap: () {
              value.addFavRestaurant(RestaurantTile(
                  id: restaurant.id,
                  name: restaurant.name,
                  description: restaurant.description,
                  pictureId: restaurant.pictureId,
                  city: restaurant.city,
                  rating: restaurant.rating));
            },
            child: const CircleAvatar(
              minRadius: 30,
              backgroundColor: primaryColor,
              child: Icon(
                Icons.favorite_border_rounded,
                color: Colors.red,
                size: 30,
              ),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              value.deleteFavRestaurant(restaurant.id);
            },
            child: const CircleAvatar(
              minRadius: 30,
              backgroundColor: primaryColor,
              child: Icon(
                Icons.favorite_rounded,
                color: Colors.red,
                size: 30,
              ),
            ),
          );
        }
      }),
    );
  }
}
