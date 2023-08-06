import 'package:flutter/material.dart';
import 'package:primos_app/pages/admin/employee_Form.dart';
import 'package:primos_app/widgets/employeeDisplay.dart';
import 'package:primos_app/widgets/pageObject.dart';
import 'package:primos_app/widgets/sideMenu.dart';
import 'package:primos_app/widgets/styledButton.dart';
import 'package:primos_app/widgets/bottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f7),
      drawer: SideMenu(pages: adminPages),
      appBar: AppBar(
        title: const Text("EMPLOYEE"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return Text('No employees found.');
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var employeeData = snapshot.data!.docs[index].data()
                              as Map<String, dynamic>;
                          var employeeName = employeeData['fullName'] ?? 'N/A';
                          var employeeRole = employeeData['role'] ?? 'N/A';

                          return EmployeeDisplay(
                            employeeName: employeeName,
                            employeeRole: employeeRole,
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 45,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: StyledButton(
                    noShadow: true,
                    btnText: "NEW EMPLOYEE",
                    onClick: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return EmployeeForm();
                      }));
                    },
                    btnColor: const Color(0xFFf8f8f7),
                    btnHeight: 45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
