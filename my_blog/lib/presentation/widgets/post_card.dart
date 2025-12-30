import 'package:flutter/material.dart';
import 'package:my_blog/presentation/widgets/post.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(widget.post.content),
            SizedBox(height: 8),
            Text(
              'Author: ${widget.post.author}',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Likes: ${widget.post.likes}'),
                IconButton(
                  icon: Icon(
                    widget.post.userLiked
                        ? Icons.thumb_up
                        : Icons.thumb_up_off_alt,
                    color: widget.post.userLiked ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.post.likePost();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
