import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCardHome extends StatelessWidget {
  final String image;
  const MainCardHome({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            image,
          ),
        ),
      ),
    );
  }
}
