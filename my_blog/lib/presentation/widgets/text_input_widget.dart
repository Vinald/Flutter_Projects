import 'package:flutter/material.dart';

class TextInputWeight extends StatefulWidget {
  final Function(String) callback;

  const TextInputWeight({super.key, required this.callback});

  @override
  State<TextInputWeight> createState() => _TextInputWeightState();
}

class _TextInputWeightState extends State<TextInputWeight> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.message),
        labelText: "Enter a message",
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          splashColor: Colors.blue,
          tooltip: "Send message",
          onPressed: () {
            click();
          },
        ),
      ),
    );
  }
}
