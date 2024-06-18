import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model.dart/movie.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageUrl =
    'https://image.tmdb.org/t/p/w1280/aBkqu7EddWK7qmY4grL4I6edx2h.jpg';

// ignore: must_be_immutable
class SearchResultWidget extends StatelessWidget {
  List<Movie> data;
  SearchResultWidget({super.key, required this.data});

  String imageBase = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Movies & Tv'),
        kHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(
              data.length,
              (index) {
                return MainCard(
                  imageurl: imageBase + data[index].imagePath,
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageurl;
  const MainCard({super.key, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:  DecorationImage(
            image: NetworkImage(imageurl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
