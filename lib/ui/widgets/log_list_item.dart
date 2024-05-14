import 'package:flutter/material.dart';
import 'package:log_application/data/log_message.dart';

class LogListItem extends StatelessWidget {
  final LogMessage message;

  const LogListItem({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: _getColorByLevel(message.level),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Text(
            message.level.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.logString,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 4.0),
                Text(
                  '${message.timestamp} - ${message.source}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorByLevel(String level) {
    switch (level) {
      case 'error':
        return Colors.red;
      case 'warn':
        return Colors.orange;
      case 'info':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
