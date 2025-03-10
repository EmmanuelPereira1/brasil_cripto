import 'package:flutter/material.dart';

void showDeleteConfirmationDialog(BuildContext context, String coinName, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Remove from favorites?'),
        content: Text('Are you sure you want to remove $coinName from favorites?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
            child: const Text('Remove'),
          ),
        ],
      );
    },
  );
}
