import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model.dart/movie.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imagUel =
    'https://media.themoviedb.org/t/p/w1066_and_h600_bestv2/thLAoL6VeZGmCyDpCOeoxLvA8yS.jpg';

class SearchIdleWidget extends StatelessWidget {
  List<Movie> data;
  SearchIdleWidget({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches',),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) =>  TopSearchItemTile(
              data: data[index],
            ),
            separatorBuilder: (ctx, index) => kHeight20,
            itemCount: data.length,
          ),
        )
      ],
    );
  }
}


class TopSearchItemTile extends StatelessWidget {
  final Movie data;
   TopSearchItemTile({super.key,required this.data});

  String imageBase = 'https://image.tmdb.org/t/p/w500/';


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageBase+data.imagePath),
            ),
          ),
        ),
         Expanded(
          child: Text(
            data.title,
            style: TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Center(
              child: Icon(
                CupertinoIcons.play_fill,
                color: kWhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
