import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model.dart/movie.dart';

String imageBase = 'https://image.tmdb.org/t/p/w500/';

class BackGroundCard extends StatelessWidget {
  final Movie data;
  const BackGroundCard({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                imageBase+data.imagePath
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _myListButton(),
                _playButton(),
                _infoButton(),
              ],
            ),
          ),
        ),
       
      ],
    );
  }

  Column _infoButton() {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.info_outline,
            size: 35,
            color: Colors.white,
          ),
        ),
        const Text(
          "Info",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Column _myListButton() {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
        const Text(
          "My List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
        size: 30,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
