import 'dart:async';
import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration startDelay;
  final Duration charDelay;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.startDelay = const Duration(milliseconds: 900),
    this.charDelay = const Duration(milliseconds: 38),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String _displayed = '';
  int _index = 0;
  Timer? _typeTimer;
  Timer? _cursorTimer;
  bool _showCursor = true;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _cursorTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) {
        if (mounted) setState(() => _showCursor = !_showCursor);
      },
    );
    Future.delayed(widget.startDelay, _startTyping);
  }

  void _startTyping() {
    _typeTimer = Timer.periodic(widget.charDelay, (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      if (_index < widget.text.length) {
        setState(() {
          _displayed = widget.text.substring(0, ++_index);
        });
      } else {
        t.cancel();
        _cursorTimer?.cancel();
        setState(() {
          _showCursor = false;
          _done = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _typeTimer?.cancel();
    _cursorTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _done ? _displayed : '$_displayed${_showCursor ? '|' : ' '}',
      style: widget.style,
    );
  }
}
