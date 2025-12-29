import 'package:flutter/material.dart';

class TextInputWeight extends StatefulWidget {
  const TextInputWeight({super.key});

  @override
  State<TextInputWeight> createState() => _TextInputWeightState();
}

class _TextInputWeightState extends State<TextInputWeight> {
  final controller = TextEditingController();
  String text = "";

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void changeText(String value) {
    setState(() {
      text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Enter a message",
            border: OutlineInputBorder(),
          ),
          onChanged: (text) {
            changeText(text);
          },
        ),
        Text(
          'You typed: $text',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ],
    );
  }
}
