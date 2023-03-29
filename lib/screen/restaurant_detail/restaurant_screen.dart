import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/themes/themes.dart';
import 'package:restaurant_app_submission/data/modal/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  static const String namedRoute = '/restaurant';

  final Restaurant restaurant;
  const RestaurantScreen({required this.restaurant, super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  late Restaurant restaurant;
  bool isReadMore = false;

  @override
  void initState() {
    super.initState();
    restaurant = widget.restaurant;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: thirdColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: restaurant.pictureId,
                    child: Image.network(restaurant.pictureId),
                  ),
                  SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: secondaryColor,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                      )
                    ]),
                  ))
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
                          restaurant.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                        ),
                        Row(children: <Widget>[
                          Icon(
                            Icons.star_border_outlined,
                            size: 20,
                            color: Colors.amber.shade600,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(restaurant.rating.toString(),
                              style: Theme.of(context).textTheme.titleMedium)
                        ]),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
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
                        Text(restaurant.city,
                            style: Theme.of(context).textTheme.bodyLarge),
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
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
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
                          restaurant.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: isReadMore ? 10 : 2,
                        ),
                        Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: Text(
                                isReadMore ? "Read less" : "Read more",
                                style: const TextStyle(color: secondaryColor),
                              ),
                              onTap: () {
                                setState(() {
                                  isReadMore = !isReadMore;
                                });
                              },
                            ))
                      ],
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
                        children: restaurant.menus.foods.map((food) {
                          return Container(
                              width: 130,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: SizedBox.square(
                                      child: Icon(
                                        Icons.restaurant_menu,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                  Text(food)
                                ],
                              ));
                        }).toList(),
                      ),
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
                        children: restaurant.menus.drinks.map(
                          (food) {
                            return Container(
                              width: 130,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: primaryColor),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: SizedBox.square(
                                      child: Icon(
                                        Icons.local_drink,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                  Text(food)
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}