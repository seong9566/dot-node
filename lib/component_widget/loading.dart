import 'package:flutter/material.dart';

class Loading {
  static BuildContext? _context;

  static open({required BuildContext context, int finishSec = 5}) async {
    if (_context != null) return;
    _context = context;
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Material(
          color: Colors.grey.withOpacity(0.2),
          elevation: 0,
          child: widget(),
        );
      },
    ).timeout(Duration(seconds: finishSec), onTimeout: () async => close());
  }

  static widget() {
    return const Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      ),
    );
  }

  static close() {
    if (_context == null) return;
    if (!_context!.mounted) {
      _context = null;
      return;
    }
    Navigator.of(_context!).pop();
    _context = null;
  }
}
