import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String namedRoute = '/search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {},
        ),
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  Icons.sort,
                  color: Colors.grey,
                )),
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
