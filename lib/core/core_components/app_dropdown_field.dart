import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppDropdownField extends StatefulWidget {
  const AppDropdownField({
    super.key,
    required this.hint,
    required this.controller,
    required this.items,
  });

  final String hint;
  final TextEditingController controller;
  final List<DropdownMenuItem<String>> items;

  @override
  State<AppDropdownField> createState() => _AppDropdownFieldState();
}

class _AppDropdownFieldState extends State<AppDropdownField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.controller.text.isNotEmpty ? widget.controller.text : null,
      items: widget.items,
      onChanged: (val) {
        if (val != null) {
          widget.controller.text = val;
          setState(() {});
        }
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey.shade700),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade900, width: 0.1.w),
          borderRadius: BorderRadius.circular(3.vmin),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500, width: 0.1.w),
          borderRadius: BorderRadius.circular(3.vmin),
        ),
        fillColor: Colors.blue.shade50,
        filled: true,
      ),
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
    );
  }
}
