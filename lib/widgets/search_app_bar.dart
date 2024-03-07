import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
          ),
        ));
  }
}
