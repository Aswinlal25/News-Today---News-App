// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_diary/controls/services/api_calls.dart';
// import 'package:my_diary/models/news_model/news_model/news_model.dart';
// import 'package:my_diary/models/news_model/news_model/source.dart';
import 'package:my_diary/models/top_news_models/article.dart';
import 'package:my_diary/presentation/profile_screen/profile.dart';
import 'package:my_diary/presentation/utiles/constants.dart';
import 'package:url_launcher/link.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSports = false;
  String selectedCategory = 'General';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kdark,
      body: FutureBuilder<List<Article>>(
        future: NewsApi().getNewsByCategory(selectedCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    value: null,
                    color: Colors.blue,
                    strokeWidth: 4,
                  )),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final newsList = snapshot.data!;
            final firstImageUrl =
                newsList.isNotEmpty ? newsList[0].urlToImage : '';
            final firsttitile = newsList.isNotEmpty ? newsList[0].title : '';
            final author = newsList.isNotEmpty ? newsList[0].author : '';
            final content = newsList.isNotEmpty ? newsList[0].content : '';
            final date = newsList.isNotEmpty ? newsList[0].publishedAt : '';
            ;
            final name = newsList.isNotEmpty ? newsList[0].source?.name : '';
            final description =
                newsList.isNotEmpty ? newsList[0].description : '';
            final browseUrl = newsList.isNotEmpty ? newsList[0].url : '';
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      floating: true,
                      pinned: true,
                      expandedHeight: screenSize.height * 0.7,
                      flexibleSpace: LayoutBuilder(
                        builder: (context, constraints) {
                          final furl = Uri.parse(browseUrl ?? '');
                          // final bool appBarVisible =
                          //     constraints.maxHeight > kToolbarHeight;
                          return FlexibleSpaceBar(
                            title: null,
                            background: Stack(
                              children: [
                                Container(
                                  decoration: firstImageUrl!.isNotEmpty
                                      ? BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(firstImageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/placeholderimage.jpg'))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Colors.black.withOpacity(0.6),
                                          Colors.black.withOpacity(0.4),
                                          Colors.black.withOpacity(0.2),
                                          Colors.black.withOpacity(0.7),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 150,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color.fromARGB(
                                                    255, 242, 59, 46),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Breaking News',
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: kwhite,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetialPage(
                                                        imageUrl: firstImageUrl,
                                                        title: firsttitile,
                                                        name: name,
                                                        description:
                                                            description,
                                                        content: content,
                                                        date: date,
                                                        browserUrl:
                                                            furl.toString(),
                                                        auther: author,
                                                      ),
                                                    ));
                                              },
                                              child: Text(
                                                firsttitile ?? '',
                                                style: const TextStyle(
                                                  fontSize: 25,
                                                  color: kwhite,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Reported by : ${author}",
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white54,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  top: 20,
                                  child: Stack(
                                    children: [
                                      Text(
                                        'N        ',
                                        style: TextStyle(
                                            color: kwhite,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            wordSpacing: 1,
                                            fontSize: 53),
                                      ),
                                      Positioned(
                                        top: 16,
                                        left: 40,
                                        child: Text(
                                          'EWS',
                                          style: TextStyle(
                                              color: kwhite,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              wordSpacing: 1,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Positioned(
                                        top: 35,
                                        left: 40,
                                        child: Text(
                                          'TODAY',
                                          style: TextStyle(
                                              color: kwhite,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              wordSpacing: 1,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ];
              },
              body: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final news = newsList[index + 1];
                        final url = Uri.parse(news.url ?? '');
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "   Go to this link for more information ",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(height: 40),
                              Text(
                                news.source?.name ?? 'Name not available',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetialPage(
                                          imageUrl: news.urlToImage,
                                          title: news.title,
                                          name: news.source?.name,
                                          description: news.description,
                                          content: news.content,
                                          date: news.publishedAt,
                                          browserUrl: url.toString(),
                                          auther: news.author,
                                        ),
                                      ));
                                },
                                child: Text(
                                  news.title ?? 'Title not available',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: kwhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                news.description ?? 'Description not available',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 179, 179, 179),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 15),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetialPage(
                                        imageUrl: news.urlToImage,
                                        title: news.title,
                                        name: news.source?.name,
                                        description: news.description,
                                        content: news.content,
                                        date: news.publishedAt,
                                        browserUrl: url.toString(),
                                        auther: news.author,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                        color: Colors.blue.withOpacity(0.3),
                                        width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag: 'newsimage',
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15),
                                                topRight: Radius.circular(15),
                                              ),
                                              image: DecorationImage(
                                                image: news.urlToImage != null
                                                    ? NetworkImage(
                                                        news.urlToImage!)
                                                    : AssetImage(
                                                            'assets/images/placeholderimage.jpg')
                                                        as ImageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            width: double.infinity,
                                            height: 250,
                                          ),
                                          // child: Container(
                                          //     decoration: BoxDecoration(
                                          //         borderRadius:
                                          //             BorderRadius.only(
                                          //                 topLeft:
                                          //                     Radius.circular(
                                          //                         10),
                                          //                 topRight:
                                          //                     Radius.circular(
                                          //                         10),

                                          //                         )),

                                          //     width: double.infinity,
                                          //     child: news.urlToImage != null
                                          //         ? Image.network(
                                          //             news.urlToImage ??
                                          //                 'https://marsala-sa.com/wp-content/uploads/2013/10/placeholder_image2.png',
                                          //             height: 250,
                                          //             fit: BoxFit.cover,
                                          //           )
                                          //         : const Image(
                                          //             image: AssetImage(
                                          //                 'assets/images/placeholderimage.jpg'))),
                                        ),
                                        Link(
                                          uri: url,
                                          target: LinkTarget.defaultTarget,
                                          builder: (context, followLink) =>
                                              TextButton(
                                            onPressed: followLink,
                                            child: Text(
                                              url.toString(),
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Link(
                              //   uri: url,
                              //   target: LinkTarget.defaultTarget,
                              //   builder: (context, followLink) => TextButton(
                              //     onPressed: followLink,
                              //     child: Text(
                              //       url.toString(),
                              //       style: const TextStyle(
                              //         color: Colors.blue,
                              //         fontSize: 15,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        );
                      },
                      childCount: newsList.length,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show category selection dialog
          _showCategoryDialog(context);
        },
        backgroundColor: kblue,
        elevation: 20, // Remove elevation
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: kblue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.filter_list,
            color: kdark,
            size: 32, // Adjust icon size
          ),
        ),
      ),
    );
  }

  void _showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.blue.withOpacity(0.3), width: 3),
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.black,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: Text(
                    "Select Category",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        letterSpacing: 1),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      _buildCategoryItem('General'),
                      // Divider(
                      //     height: 0,
                      //     color: Colors.white.withOpacity(0.3),
                      //     thickness: 0.3),
                      _buildCategoryItem('Business'),
                      // Divider(
                      //     height: 0,
                      //     color: Colors.white.withOpacity(0.3),
                      //     thickness: 0.5),
                      _buildCategoryItem('Entertainment'),
                      // Divider(
                      //   color: Colors.white.withOpacity(0.3),
                      //   thickness: 0.5,
                      //   height: 0,
                      // ),
                      _buildCategoryItem('Health'),
                      // Divider(
                      //     height: 0,
                      //     color: Colors.white.withOpacity(0.3),
                      //     thickness: 0.5),
                      _buildCategoryItem('Science'),
                      // Divider(
                      //     height: 0,
                      //     color: Colors.white.withOpacity(0.3),
                      //     thickness: 0.5),
                      _buildCategoryItem('Sports'),
                      // Divider(
                      //     height: 0,
                      //     color: Colors.white.withOpacity(0.3),
                      //     thickness: 0.5),
                      _buildCategoryItem('Technology'),

                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryItem(String category) {
    final isSelected = selectedCategory == category;
    return ListTile(
      title: Text(
        category,
        style: TextStyle(
            fontSize: isSelected ? 17 : 15,
            color: isSelected ? kblue : Colors.white70,
            letterSpacing: 1,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w400),
      ),
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
        Navigator.of(context).pop();
      },
      contentPadding: EdgeInsets.all(-36),
    );
  }
}
