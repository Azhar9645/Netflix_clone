import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model.dart/movie.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

class EveryonesWatching_Widget extends StatelessWidget {
  final Movie data;
  const EveryonesWatching_Widget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          data.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
          data.overview,
          style: const TextStyle(color: Colors.grey, height: 1.5),
        ),
        kHeight50,
        VideoWidget(image: data.imagePath),
        kHeight20,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Icon(
                  Icons.share,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'Share',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            kHeight,
            Column(
              children: [
                Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'My List',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            kHeight,
            Column(
              children: [
                Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.white,
                ),
                kHeight,
                Text(
                  'Play',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            kHeight,
          ],
        )
      ],
    );
  }
}
