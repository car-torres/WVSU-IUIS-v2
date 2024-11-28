import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

void main() {
  runApp(const Inbox());
}

class Inbox extends StatelessWidget {
  const Inbox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inbox',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: GlobalColor.brand,
          secondary: GlobalColor.accentOne,
          surface: GlobalColor.shadeLight,
          surfaceVariant: GlobalColor.gray,
          onSurface: GlobalColor.shadeDark,
        ),
        useMaterial3: true,
      ),
      home: const InboxScreen(),
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
        titleTextStyle: GlobalFontSize.heading.copyWith(color: Colors.white),
        backgroundColor: GlobalColor.accentOne,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: GlobalColor.brand,
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Add settings page navigation logic here
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
              height: 45,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: GlobalColor.gray,
                borderRadius: BorderRadius.zero,
              ),
              child: Center(
                child: Text(
                  'Check your messages!',
                  style: GlobalFontSize.subheading,
                ),
              ),
            ),
            const SizedBox(height: 10),

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
                            titleTextStyle: GlobalFontSize.subheading2,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        child: ListTile(
          title: Text(sender),
          titleTextStyle: GlobalFontSize.subheading2
              .copyWith(color: const Color(0xFF132033)),
          subtitle: Text(subject),
          trailing: Text(time),
        ),
      ),
    );
  }
}
