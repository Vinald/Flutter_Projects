import 'package:flutter/material.dart';
import 'package:my_blog/presentation/widgets/post_card.dart';
import 'package:my_blog/presentation/widgets/post_widget.dart';
import 'package:my_blog/presentation/widgets/text_input_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> posts = [];

  void newPost(String message) {
    setState(() {
      posts.add(
        Post(title: message, content: 'Content of $message', author: 'Vinald'),
      );
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
            Expanded(child: TextInputWeight(callback: newPost)),
          ],
        ),
      ),
    );
  }
}
