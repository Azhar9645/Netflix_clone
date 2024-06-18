import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model.dart/movie.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

String imageBase = 'https://image.tmdb.org/t/p/w500/';


class NumberTitleCard extends StatelessWidget {
  final List<Movie> data;
  const NumberTitleCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: 'Top 10 TV Shows In India Today',
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              data.length,
              (index) => NumberCard(
                  index: index, image: imageBase + data[index].imagePath),
            ),
          ),
        )
      ],
    );
  }
}
