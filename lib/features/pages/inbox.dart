import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.drafts), text: 'Draft'),
            Tab(icon: Icon(Icons.send), text: 'Sent'),
            Tab(icon: Icon(Icons.delete), text: 'Trash'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DraftPage(),
          SentPage(),
          TrashPage(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class DraftPage extends StatelessWidget {
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 5, // Replace with your dynamic draft count
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.drafts),
            title: Text('Draft Message ${index + 1}'),
            subtitle: const Text('This is a draft message.'),
            onTap: () {
              // Handle navigation to the draft message details
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening Draft Message ${index + 1}')),
              );
            },
          );
        },
      ),
    );
  }
}

class SentPage extends StatelessWidget {
  const SentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 3, // Replace with your dynamic sent count
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.send),
            title: Text('Sent Message ${index + 1}'),
            subtitle: const Text('This message has been sent.'),
            onTap: () {
              // Handle navigation to the sent message details
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening Sent Message ${index + 1}')),
              );
            },
          );
        },
      ),
    );
  }
}

class TrashPage extends StatelessWidget {
  const TrashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 2, // Replace with your dynamic trash count
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.delete),
            title: Text('Deleted Message ${index + 1}'),
            subtitle: const Text('This message is in the trash.'),
            onTap: () {
              // Handle navigation to the deleted message details
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening Deleted Message ${index + 1}')),
              );
            },
          );
        },
      ),
    );
  }
}
