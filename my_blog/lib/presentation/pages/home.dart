import 'package:flutter/material.dart';
import 'package:my_blog/presentation/widgets/text_input_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextInputWeight(),
      ),
    );
  }
}
