import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/const_colors.dart';


class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.hint,
    this.icon,
    this.keyboardType,
    this.controller,
    this.isPass = false,
    this.validator,
     this.enabled,
    this.isEditing = false,
  });

  final String? hint;
  final Widget? icon;
  final bool isPass;
final bool isEditing;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  
  final dynamic enabled;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    final bool isEditing;
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical:2.vmin),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPass && _hidden,
          controller: widget.controller,
          validator: widget.validator,
          cursorColor: Colors.black,
           enabled: widget.enabled ?? true,
          decoration: InputDecoration(
            labelText: widget.hint,
            labelStyle: TextStyle(
              fontSize: 15.spa,
              color: _focusNode.hasFocus ? Colors.black : Colors.black
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.vmin),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.vmin),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.vmin)
            ),
            fillColor: Colors.blue.shade50,
            filled: true,
            prefixIcon: widget.icon,
            suffixIcon: widget.isPass ? IconButton(
                onPressed: (){
                  _hidden = !_hidden;
                  setState(() {});
                },
                icon: Visibility(
                  visible: _hidden,
                  replacement: const Icon(Icons.visibility),
                  child: const Icon(Icons.visibility_off),
                )
            ):null,
          ),
        ),
      ),
    );
  }
}
class AppTextFormField1 extends StatefulWidget {
  const AppTextFormField1({
    super.key,
    required this.hint,
    this.keyboardType,
    required this.controller,
    required this.minlines
  });

  final String hint;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final int minlines;

  @override
  State<AppTextFormField1> createState() => AppTextFormField1State();
}

class AppTextFormField1State extends State<AppTextFormField1> {
  final TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:widget.controller,
      maxLines: null,
      minLines: widget.minlines,
      cursorColor: Colors.transparent,
      keyboardType: TextInputType.multiline,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle( color: Colors.grey.shade700),
        focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade900,
          width: 0.1.w
          ),
            borderRadius: BorderRadius.circular(3.vmin)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.shade500,
                width: 0.1.w
            ),
            borderRadius: BorderRadius.circular(3.vmin)
        ),
        fillColor: Colors.blue.shade50,
        filled: true,),

    );
  }
}

