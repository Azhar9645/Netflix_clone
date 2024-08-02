import 'package:flutter/material.dart';
import 'package:netflix_clone/controller/api_controller.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/model.dart/movie.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/comingsoon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyone_searching.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

List<Movie> nowPlaying = [];
List<Movie> upcoming = [];

Future<void> getAllMovies() async {
  nowPlaying = await MovieServices.getNowplaying();
  upcoming = await MovieServices.getupcoming();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  @override
  void initState() {
    super.initState();
    getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            actions: [
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
              const SizedBox(
                width: 10,
              )
            ],
            bottom: const TabBar(
              isScrollable: false,
              dividerColor: Colors.transparent,
              unselectedLabelColor: kWhiteColor,
              unselectedLabelStyle:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(32),
                ),
              ),
              labelPadding: const EdgeInsets.only(left: 10, right: 10),
              tabs: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Tab(
                    text: "🍿 Coming Soon",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          _buildComingsoon(),
          _buildEveryonesWatching(),
        ]),
      ),
    );
  }

  Widget _buildComingsoon() {
    return ListView.builder(
      itemCount: upcoming.length,
      itemBuilder: (context, index) => ComingSoon_Widget(
        data: upcoming[index],
      ),
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: nowPlaying.length,
      itemBuilder: (context, index) => EveryonesWatching_Widget(
        data: nowPlaying[index],
      ),
    );
  }
}
