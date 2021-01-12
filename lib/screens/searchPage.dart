import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class SearchPage extends StatelessWidget {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  static const String id = 'search_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SearchBar<Post>(
            onSearch: search,
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(
                  post.title,
                  style: TextStyle(color: Color(0xFFE47070)),
                ),
                subtitle: Text(
                  post.description,
                  style: TextStyle(color: Color(0xFFE47070)),
                ),
              );
            },
            hintText: "Search hint text",
            hintStyle: TextStyle(
              color: Colors.grey[700],
            ),
            textStyle: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            searchBarStyle: SearchBarStyle(
              backgroundColor: Colors.grey[900],
              borderRadius: BorderRadius.circular(10.0),
              padding: EdgeInsets.all(2.0),
            ),
            icon: Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
            cancellationWidget: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
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
