import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/themes/themes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: headerHeight,
      color: thirdColor,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Restaurant',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                  Text('Recomandation Restaurant For You!',
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.search,
                    color: thirdColor,
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
