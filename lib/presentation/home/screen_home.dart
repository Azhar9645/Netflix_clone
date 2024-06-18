import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/controller/api_controller.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model.dart/movie.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_home_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Movie> nowPlaying = [];
  List<Movie> popular = [];
  List<Movie> topRated = [];
  List<Movie> upcoming = [];
  bool isLoading = true;
  int backgroundIndex = 0;

  Future<void> getAllMovies() async {
    nowPlaying = await MovieServices.getNowplaying();
    popular = await MovieServices.getpopular();
    topRated = await MovieServices.gettoprated();
    upcoming = await MovieServices.getupcoming();
    setState(() {
      isLoading = false;
      backgroundIndex = _getRandomIndex(popular.length);
    });
  }

  int _getRandomIndex(int length) {
    final Random random = Random();
    return random.nextInt(length);
  }

  @override
  void initState() {
    super.initState();
    scrollNotifier=ValueNotifier(true);
    getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, index) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }

              return true;
            },
            child: Stack(
              children: [
                RefreshIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.white,
                  onRefresh: getAllMovies,
                  child: ListView(
                    children: [
                      isLoading
                          ? Container(
                              height: 600,
                              alignment: Alignment.center,
                              child: const CupertinoActivityIndicator(
                                radius: 15,
                                color: Colors.white,
                              ),
                            )
                          : BackGroundCard(data: popular[backgroundIndex]),
                      MainHomeTitleCard(
                        title: 'Released in the past year',
                        data: popular,
                      ),
                      kHeight,
                      MainHomeTitleCard(
                        title: 'Trending Now',
                        data: nowPlaying,
                      ),
                      kHeight,
                      NumberTitleCard(
                        data: topRated,
                      ),
                      kHeight,
                      MainHomeTitleCard(title: 'Tense Dramas', data: upcoming),
                      kHeight,
                      MainHomeTitleCard(
                          title: 'South Indian Cinemas', data: popular),
                      kHeight,
                    ],
                  ),
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        
                        width: double.infinity,
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: const DecorationImage(
                                        image: NetworkImage(
                                          "https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'TV Shows',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Movies',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Categories',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        size: 19,
                                        color: Colors.white,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
