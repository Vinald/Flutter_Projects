import 'package:flutter/material.dart';
import 'package:my_blog/presentation/widgets/post.dart';
import 'package:my_blog/presentation/widgets/post_list.dart';
import 'package:my_blog/presentation/widgets/text_input_widget.dart';

class Home extends StatefulWidget {
  final String username;
  const Home({super.key, required this.username});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> posts = [];

  void newPost(String message) {
    setState(() {
      posts.add(Post(title: message, author: widget.username));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: PostList(postItems: posts)),
            SizedBox(height: 20),
            TextInputWeight(callback: newPost),
          ],
        ),
      ),
    );
  }
}
