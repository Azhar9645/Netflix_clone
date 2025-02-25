import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model.dart/movie.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

String imageBase = 'https://image.tmdb.org/t/p/w500/';

class MainHomeTitleCard extends StatelessWidget {
  final List<Movie> data;
  final String title;
  const MainHomeTitleCard({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              data.length,
              (index) => MainCardHome(
                image: imageBase + data[index].imagePath,
              ),
            ),
          ),
        )
      ],
    );
  }
}
