import 'package:flutter/material.dart';
import 'package:log_application/data/log_message.dart';
import 'package:log_application/data/log_service.dart';
import 'package:log_application/ui/widgets/log_list_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  List<LogMessage> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchLogs(''); // Initial search on app launch
  }

  void _searchLogs(String searchTerm) async {
    final results = await LogService.searchLogs(searchTerm);
    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search logs...',
              ),
              onSubmitted: (text) => _searchLogs(text),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final message = _searchResults[index];
                  return LogListItem(message: message);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
