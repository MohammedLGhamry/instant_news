import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/screens/news_details_screen.dart';
import 'package:news/repository/news_repo.dart';
import 'package:news/widgets/news_card_widget.dart';
import 'package:news/widgets/shimmer_news_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<ArticleModel>> newsData;

  @override
  void initState() {
    super.initState();
    newsData = NewsRepo().fetchNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 70),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            title: const Text('News'),
            titleSpacing: 30,
            titleTextStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: 2,
              fontFamily: 'poppins',
            ),
            elevation: 0,
            backgroundColor: Color(0xFFE9EEFA),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: FutureBuilder<List<ArticleModel>>(
              future: newsData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return ShimmerNewsCardWidget();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 25,
                      );
                    },
                  );
                }


                if(snapshot.hasError){
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index){
                      return ShimmerNewsCardWidget();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 25,
                      );
                    },
                  );

                  /*return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );*/
                }

                if (snapshot.hasData) {
                  final articles = snapshot.data!;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsScreen(articleModel: articles[index]),
                            ),
                          );
                        },
                        child: NewsCardWidget(
                          articleModel: articles[index],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 25,
                      );
                    },
                  );
                }

                return const SizedBox();
              }),
        ),
      ),
    );
  }
}
