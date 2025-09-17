import 'package:chatapp/utils/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatWinPage extends StatefulWidget {
  const ChatWinPage({super.key});

  @override
  State<ChatWinPage> createState() => _ChatWinPageState();
}

class _ChatWinPageState extends State<ChatWinPage> {
  final TextEditingController _message = TextEditingController();
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Chat read container
              Container(
                padding: EdgeInsets.all(10),
                height: 700,
                width: 700,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: ChatTile(messageString: message),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(6),
                width: 700,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _message,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  decoration: InputDecoration(
                    hintText: "Message",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          message = _message.text;
                          _message.clear();
                        });
                      },
                      icon: Icon(Icons.send),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
