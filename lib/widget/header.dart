import 'package:flutter/material.dart';
import 'package:restaurant_app_submission/themes/themes.dart';

import '../screen/restaurant_search/restaurant_search_screen.dart';

class HomeHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isSearched;

  const HomeHeader(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.isSearched})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                  Text(subTitle,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              if (isSearched)
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
                  onTap: () {
                    Navigator.pushNamed(context, SearchScreen.namedRoute);
                  },
                )
            ],
          ),
        ],
      ),
    );
  }
}
