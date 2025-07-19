import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String title;

  const ExpandableText({super.key, required this.title});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool shouldTrim = widget.title.length > 20;
    final String displayedText = isExpanded || !shouldTrim
        ? widget.title
        : '${widget.title.substring(0, 20)}...';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            displayedText,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        if (shouldTrim)
          IconButton(
            icon: Icon(
              isExpanded ? Icons.visibility_off : Icons.visibility,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
      ],
    );
  }
}
