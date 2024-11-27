import 'package:flutter/material.dart';

void main() {
  runApp(const Inbox());
}

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Inbox',
      home: InboxScreen(),
    );
  }
}

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 118, 167, 207),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Check your messages!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),

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
    super.key,
    required this.sender,
    required this.subject,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(subject),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: const TextStyle(color: Color.fromARGB(255, 129, 174, 241)),
          ),
        ],
      ),
    );
  }
}
