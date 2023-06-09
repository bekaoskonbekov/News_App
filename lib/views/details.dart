import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/provider/news_provider.dart';

class Details extends ConsumerWidget {
  final int getInfex;
  const Details({required this.getInfex, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsPage = ref.watch(newsProvider);
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
      body: detailsPage.when(
          data: (data) => Column(
                children: [
                  Image.network(data[getInfex].urlToImage!),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Text(
                          data[getInfex].title!,
                          maxLines: 2,
                          style: GoogleFonts.spaceGrotesk(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        Gap(12),
                        Text(data[getInfex].description!),
                        Text(data[getInfex].content!)
                      ],
                    ),
                  ),
                ],
              ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(child: CircularProgressIndicator())),
    );
  }
}
