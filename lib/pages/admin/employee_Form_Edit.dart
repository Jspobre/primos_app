import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primos_app/pages/admin/employee.dart';
import 'package:primos_app/widgets/styledButton.dart';
import 'package:primos_app/widgets/styledDropdown.dart';
import 'package:primos_app/widgets/styledTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class StyledDropdown extends StatelessWidget {
//   final String? value;
//   final ValueChanged<String?>? onChange;
//   final String hintText;
//   final List<String> roleOptions; // Add this parameter

//   StyledDropdown({
//     required this.value,
//     required this.onChange,
//     required this.hintText,
//     required this.roleOptions, // Initialize this parameter
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DropdownButton<String>(
//           value: value,
//           items: roleOptions.map((role) {
//             return DropdownMenuItem<String>(
//               value: role,
//               child: Text(role),
//             );
//           }).toList(),
//           onChanged: onChange,
//           hint: Text(hintText),
//         ),
//       ],
//     );
//   }
// }

class EmployeeFormEdit extends StatefulWidget {
  final String? fullName;

  EmployeeFormEdit({
    super.key,
    this.fullName,
  });

  @override
  State<EmployeeFormEdit> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeFormEdit> {
  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  String? role;

  @override
  void initState() {
    super.initState();
    // Set the initial values for the text fields
    fullNameController.text =
        widget.fullName ?? ''; // If fullName is null, set an empty string
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f7),
      appBar: AppBar(
        leading: IconButton(
          //manual handle back button
          icon: const Icon(Icons.keyboard_arrow_left),
          iconSize: 35,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("EDIT EMPLOYEE"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledTextField(
                  controller: fullNameController,
                  hintText: "Full Name",
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              StyledTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              StyledTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true),
              const SizedBox(
                height: 10,
              ),
              StyledDropdown(
                value: role,
                onChange: (String? newValue) {
                  setState(() {
                    role = newValue;
                  });
                },
                hintText: "Role",
                items: const ['Admin', 'Waiter', 'Cashier', 'Kitchen'],
              ),
              const SizedBox(
                height: 20,
              ),
              StyledButton(
                btnText: "SAVE",
                onClick: () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return EmployeePage();
                      },
                    ),
                  );
                },
                btnWidth: 250,
              )
            ],
          ),
        ),
      ),
    );
  }
}
