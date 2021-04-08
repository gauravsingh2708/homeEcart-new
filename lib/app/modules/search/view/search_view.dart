import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/styles.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: TextFormField(
          style: Styles.black18,
          decoration:  InputDecoration(
            hintText: 'Search for services and Packages',
            hintStyle: Styles.black18,
            border: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}
