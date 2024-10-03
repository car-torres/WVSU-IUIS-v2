import 'package:flutter/material.dart';

void main() {
  runApp(Inbox());
}

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inbox',
      home: InboxScreen(),
    );
  }
}

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 118, 167, 207),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Check your messages!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Message List
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Number of messages
                itemBuilder: (context, index) {
                  return MessageTile(
                    sender: 'Sender ${index + 1}',
                    subject: 'Message Subject ${index + 1}',
                    time: '${index + 1} min ago',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String sender;
  final String subject;
  final String time;

  const MessageTile({
    Key? key,
    required this.sender,
    required this.subject,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 164, 186, 212),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sender,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(subject),
              ],
            ),
          ),
          SizedBox(width: 8),
          Text(
            time,
            style: TextStyle(color: const Color.fromARGB(255, 129, 174, 241)),
          ),
        ],
      ),
    );
  }
}
