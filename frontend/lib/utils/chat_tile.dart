import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String messageString;
  const ChatTile({super.key, required this.messageString});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topLeft,
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.lime,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          messageString,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
