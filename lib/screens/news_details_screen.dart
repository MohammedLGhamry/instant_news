import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final ArticleModel articleModel;
  const NewsDetailsScreen({Key? key, required this.articleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.30,
            backgroundColor: Colors.white,
            flexibleSpace: Stack(
              children: [
                 Positioned.fill(
                  child: FadeInImage(
                    image: NetworkImage(articleModel.urlToImage!),
                    placeholder:  NetworkImage(articleModel.urlToImage!),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                  ),
                  bottom: -5,
                  left: 0,
                  right: 0,
                ),
              ],
            ),

          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articleModel.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16,),
                      Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage('https://st2.depositphotos.com/4549583/8110/i/450/depositphotos_81106984-stock-photo-male-avatar-profile-picture.jpg'),
                            ),
                          ),

                          const SizedBox(width: 10,),

                          Text(
                            articleModel.author!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6D6265),
                            ),
                          ),

                          const SizedBox(width: 15,),

                          Text(
                            '${articleModel.publishedAt.day}-${articleModel.publishedAt.month}-${articleModel.publishedAt.year}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6D6265),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24,),
                      Text(
                        articleModel.content * 10,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF231F20),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
