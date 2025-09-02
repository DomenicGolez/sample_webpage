import 'package:flutter/material.dart';

class ForHover extends StatefulWidget {
  final String text;
  const ForHover({super.key, required this.text});

  @override
  State<ForHover> createState() => _ForHoverState();
}

class _ForHoverState extends State<ForHover> {
  Color? hoverColor;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          // hoverColor = Colors.green;
          textColor = Colors.amber;
        });
      },
      onExit: (event) {
        setState(() {
          // hoverColor = Colors.white;
          textColor = Colors.white;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 20, bottom: 10,
          // vertical: 10,
        ),
        // color: hoverColor,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
