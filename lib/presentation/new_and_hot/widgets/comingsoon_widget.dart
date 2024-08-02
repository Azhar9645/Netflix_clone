import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/model.dart/movie.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

class ComingSoon_Widget extends StatelessWidget {
  Movie data;
  ComingSoon_Widget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            children: [
              Text(
                "FEB",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                image: data.imagePath,
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      data.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            Text(
                              'Remind me',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        kHeight20,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: Colors.white,
                            ),
                            Text(
                              'Info',
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              kHeight,
              const Text("Coming on Friday"),
              kHeight,
              Flexible(
                child: Text(
                  data.title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.fade),
                ),
              ),
              kHeight,
              SingleChildScrollView(
                child: Text(
                  "Landing the lead in school musicalis a\ndream come true for jodi, Until the pressure sends her confidence-and her relationship-\ninto a tailspin",
                  style: const TextStyle(color: Colors.grey, height: 1.5),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
