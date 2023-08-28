import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/article.dart';

class ArticlePhoto extends StatelessWidget {
  const ArticlePhoto({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        SizedBox(
          width: 160.w,
          height: 160.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: AssetImage(article.photoUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 15,
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Text(
              "${article.estimatedReadTime} read",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 11.5,
                  wordSpacing: 2.5),
            ),
          ),
        ),
      ],
    );
  }
}