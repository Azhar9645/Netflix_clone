import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/controller/api_controller.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model.dart/movie.dart';
import 'package:netflix_clone/presentation/search/search_funtion.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final controller = TextEditingController();
  List<Movie> popoular = [];

  List<Movie> SearchResults = [];
  bool istapped = true;
  Future getPopular() async {
    if (mounted) {
      popoular = await MovieServices.getpopular();
      setState(() {});
    }
  }

  _onSearchChanges() async {
    if (controller.text.isEmpty) {
      setState(() {
        istapped = true;
        SearchResults.clear();
      });
    } else {
      await _featchdataFromServer(controller.text);
    }
  }

  Future _featchdataFromServer(String query) async {
    List<Movie> result = await searchfunction(query);
    setState(() {
      istapped = false;
      SearchResults = result;
    });
  }

  @override
  void initState() {
    if (mounted) {
      getPopular();
      controller.text = '';
      super.initState();
      controller.addListener(_onSearchChanges);
      getPopular();
    }
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchChanges);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                onChanged: (value) {
                  setState(() {
                    value.isEmpty ? istapped = true : istapped = false;
                    _featchdataFromServer(value);
                  });
                },
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              // const Expanded(child: const SearchIdleWidget()),
              _isEmpty(controller.text),
            ],
          ),
        ),
      ),
    );
  }

  Widget _isEmpty(String value) {
    return istapped
        ? Expanded(
            child: SearchIdleWidget(
            data: popoular.isNotEmpty ? popoular : [],
          ))
        : Expanded(
            child: SearchResultWidget(
            data: SearchResults,
          ));
  }
}
