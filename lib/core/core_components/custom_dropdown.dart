
import 'package:flutter/material.dart';

class CustomDropdown<S> extends StatefulWidget {
  final List<String> items; 
  final String hint1;
  final String? hint2;
  final ValueChanged<String>? onChanged; 
  final Map<String, List<String>>? data;
  final bool showSecondDropdown;

  const CustomDropdown({
    Key? key,
    required this.items,
     this.onChanged,
     this.data, 
    required this.hint1,
      this.hint2,
     this.showSecondDropdown= true,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
 
  String? selectedSpecialety;
  String? selectedDoctor; 
  List<String> doctors = [];

  @override
  void initState() {
    super.initState();
 
    selectedSpecialety = null;
    
      doctors =[];
      selectedDoctor = null;

  }


  void updateDoctors(String? doctor1) {
    setState(() {
      selectedSpecialety = doctor1;
      if (widget.data!=null && widget.data!.containsKey(doctor1)) {
        doctors = widget.data![doctor1]!; 
        selectedDoctor =  null;
      } else {
        doctors = [];
        selectedDoctor = null;
      }
      if (doctor1 != null){
        widget.onChanged?.call(doctor1);
      }
    });
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
  
      labelStyle: TextStyle(color: Colors.grey.shade700),
      filled: true,
      fillColor: Colors.blue.shade50,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade900, width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade500, width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: _inputDecoration(widget.hint1),
          hint: Text(widget.hint1) ,
          value: selectedSpecialety != null && widget.items.contains(selectedSpecialety)
              ? selectedSpecialety
              : null,
          isExpanded: true,
          items: widget.items.map((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList(),
          onChanged: updateDoctors, 
        ),
       
        if(widget.showSecondDropdown && doctors.isNotEmpty)
        DropdownButton<String>(
          hint: widget.hint2 != null ? Text(widget.hint2!) : null,
          value: selectedDoctor != null && doctors.contains(selectedDoctor)
              ? selectedDoctor
              : null,
          isExpanded: true,
          items: doctors.map((String doc) {
            return DropdownMenuItem<String>(
              value: doc,
              child: Text(doc),
            );
          }).toList(),
          onChanged: (String? doc) {
            setState(() {
              selectedDoctor = doc;
            });
          },
        ),
      ],
    );
  }
}
