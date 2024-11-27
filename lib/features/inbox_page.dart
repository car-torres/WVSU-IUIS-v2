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
      drawer: Drawer(
        // Adding the Drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Inbox'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add your settings page navigation logic here
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Section
            Container(
              height: 50,
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
              margin: const EdgeInsets.only(left: 250, right: 250),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 118, 167, 207),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Check your messages!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Message List
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Number of messages
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Message from Sender ${index + 1}'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Subject: Message Subject ${index + 1}'),
                                const SizedBox(height: 10),
                                const Text(
                                    'This is the detailed content of the message.'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: MessageTile(
                      sender: 'Sender ${index + 1}',
                      subject: 'Message Subject ${index + 1}',
                      time: '${index + 1} min ago',
                    ),
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
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10, left: 100, right: 100),
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
