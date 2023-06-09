import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/views/details.dart';

import '../api/news_api.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getNews = ref.watch(newsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Fetch News'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FluentIcons.alert_12_regular),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(FluentIcons.search_12_regular),
          ),
        ],
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breaking News',
                    style: GoogleFonts.spaceGrotesk(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Show more'),
                ],
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green.withOpacity(0.9),
                      Colors.black.withOpacity(1),
                      Colors.red.withOpacity(0.9),
                      Colors.black.withOpacity(0.9),
                      Colors.green.withOpacity(0.9),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'TechCrunch',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      Text(
                        'Yep `Learning Man` is becomming a thing',
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Author: Kyle Wigger',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended for you',
                    style: GoogleFonts.spaceGrotesk(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('Show more'),
                ],
              ),
              Gap(14),
              getNews.when(
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(
                                        getInfex: index,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(children: [
                            Expanded(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  data[index].urlToImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        data[index].title!,
                                        maxLines: 2,
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        data[index].description!,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11),
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                ))
                          ]),
                        ),
                      );
                    },
                  );
                },
                error: (error, stackTrace) => Text('error'),
                loading: () => Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.home_12_regular), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.communication_16_regular),
                label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.bookmark_16_regular), label: 'Saved'),
            BottomNavigationBarItem(
                icon: Icon(FluentIcons.person_12_regular), label: 'Profile'),
          ]),
    );
  }
}
