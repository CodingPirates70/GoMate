import 'package:flutter/material.dart';

// ----------------- MessageScreen Widget -----------------
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  final List<Map<String, String>> chats = const [
    {
      "name": "Jessie Cooper",
      "message": "See you next week!",
      "time": "09:32 AM",
    },
    {
      "name": "Shawn Jones",
      "message": "That’s Great, Thank you!",
      "time": "06:20 AM",
    },
    {"name": "King + Duke Trip", "message": "📷 Image", "time": "09:32 PM"},
    {
      "name": "Alexandria Lexi",
      "message": "🎤 Voice Message 3:02",
      "time": "08:45 AM",
    },
    {"name": "Mary James", "message": "Waiting for you", "time": "09:32 AM"},
    {"name": "Tom Parker", "message": "It’s at 3:30 sharp", "time": "09:32 AM"},
    {"name": "Ali Ahmed", "message": "Gif", "time": "09:32 AM"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Text(chat["name"]![0]),
            ),
            title: Text(chat["name"]!),
            subtitle: Text(chat["message"]!),
            trailing: Text(
              chat["time"]!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}

// ----------------- Page that uses MessageScreen -----------------
class MessageScreenPage extends StatelessWidget {
  const MessageScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Room")),
      body: const MessageScreen(),
    );
  }
}
