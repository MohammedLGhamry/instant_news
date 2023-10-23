import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';

class NewsCardWidget extends StatelessWidget {
  final ArticleModel articleModel;
  const NewsCardWidget({Key? key, required this.articleModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                articleModel.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                articleModel.source.name,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFC5C3C3),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 110,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(articleModel.urlToImage!),
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }
}
