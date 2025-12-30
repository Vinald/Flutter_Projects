import 'package:flutter/material.dart';
import 'package:my_blog/presentation/widgets/post_card.dart';

class PostList extends StatefulWidget {
  final List<Post> postItems;

  const PostList({super.key, required this.postItems});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.postItems.map((post) {
        return PostCard(post: post);
      }).toList(),
    );
  }
}
