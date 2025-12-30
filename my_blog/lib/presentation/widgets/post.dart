class Post {
  final String title;
  final String content;
  final String author;
  int likes = 0;
  bool userLiked = false;

  Post({required this.title, required this.content, required this.author});

  void likePost() {
    userLiked = !userLiked;
    likes = userLiked ? likes + 1 : likes - 1;
  }
}
