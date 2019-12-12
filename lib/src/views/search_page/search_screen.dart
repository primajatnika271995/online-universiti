import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:online_university/src/utils/app_theme.dart';
import 'package:online_university/src/utils/hex_converter.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar(
            onSearch: search,
            hintStyle: AppTheme.subtitle,
            hintText: "Search Course ...",
            textStyle: AppTheme.subtitle,
            searchBarStyle: SearchBarStyle(
              backgroundColor: AppTheme.nearlyWhite,
              borderRadius: BorderRadius.circular(5),
            ),
            cancellationText: Text("cancel", style: AppTheme.subtitle),
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.title, style: AppTheme.title),
                subtitle: Text(post.description, style: AppTheme.subtitle),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}
