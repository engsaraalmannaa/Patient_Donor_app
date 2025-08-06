
import 'package:flutter/material.dart';

class CustomDropdown<S> extends StatefulWidget {
  final List<String> items; // قائمة العناصر للقائمة المنسدلة الأولى (البلدان)
  final String hint1;
  final String? hint2;
  final ValueChanged<String>? onChanged; // دالة يتم استدعاؤها عند تغيير الخيار في القائمة الأولى
  final Map<String, List<String>>? data;
  final bool showSecondDropdown;// هيكل البيانات الذي يربط بين القائمتين

  const CustomDropdown({
    Key? key,
    required this.items,
     this.onChanged,
     this.data, // إضافة البيانات كمعامل
    required this.hint1,
      this.hint2,
     this.showSecondDropdown= true,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  // متغيرات الحالة
  String? selectedSpecialety; // العنصر المحدد في القائمة الأولى
  String? selectedDoctor; // العنصر المحدد في القائمة الثانية
  List<String> doctors = []; // قائمة المدن التي سيتم عرضها في القائمة الثانية

  @override
  void initState() {
    super.initState();
    // تهيئة القائمة الثانية بأول بلد
    selectedSpecialety = null;
     // نستخدم widget.items بدلاً من item.keys
      doctors =[];
      selectedDoctor = null;

  }

  // دالة لتحديث عناصر القائمة الثانية
  void updateDoctors(String? doctor1) {
    setState(() {
      selectedSpecialety = doctor1;
      if (widget.data!=null && widget.data!.containsKey(doctor1)) {
        doctors = widget.data![doctor1]!; // نستخدم widget.data بدلاً من item
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // القائمة المنسدلة الأولى (البلدان)
        DropdownButton<String>(
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
          onChanged: updateDoctors, // استدعاء دالة _updateCities عند تغيير الخيار
        ),
        // القائمة المنسدلة الثانية (المدن)
        if(widget.showSecondDropdown && doctors.isNotEmpty)
        DropdownButton<String>(
          hint: widget.hint2 != null ? Text(widget.hint2!) : null,
          value: selectedDoctor != null && doctors.contains(selectedDoctor)
              ? selectedDoctor
              : null,
          // value: selectedDoctor,
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
