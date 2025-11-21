import 'package:flutter/material.dart';

class DataField extends StatelessWidget {
  final String fieldName;
  final TextEditingController fieldController;
  final IconData icon;
  const DataField({
    super.key,
    required this.fieldName,
    required this.fieldController,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        controller: fieldController,
        validator: (value) {
          if ((value == null || value.isEmpty)) {
            return "This field cannot be empty";
          }

          return null;
        },
        obscureText: fieldName == "Password" || fieldName == "Confirm Password"
            ? true
            : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          hintText: "Enter your ${fieldName.toLowerCase()} here",
          label: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(fieldName, style: TextStyle(color: Colors.black)),
          ),
          suffixIcon: Icon(icon),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
