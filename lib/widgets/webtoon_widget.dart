import 'package:flutter/material.dart';
import 'package:webtoon_app/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                // fullscreenDialog: true,
                builder: (context) =>
                    DetailScreen(title: title, thumb: thumb, id: id),
              ),
            );
            // Logger().d('take me home');
          },
          child: Hero(
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(4, 4),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              width: 250,
              child: Image.network(
                thumb,
                headers: const {
                  "Referer": "https://comic.naver.com",
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
