import 'package:flutter/material.dart';
import 'package:primos_app/widgets/styledButton.dart';
import 'package:primos_app/widgets/styledTextField.dart';

import 'package:primos_app/pages/admin/salesReport.dart';

class LoginSreen extends StatelessWidget {
  LoginSreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final String btnText = "SIGN IN";

  @override
  Widget build(BuildContext context) {
    void handleSignin() {
      Navigator.of(context).pushReplacement(
        //pushReplacement prevents user to go back to login screen

        MaterialPageRoute(
          builder: (BuildContext context) {
            return SalesReportPage();
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F7),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.6],
            colors: [
              const Color(0xFFE2B563).withOpacity(0.3),
              const Color(0xFFF8F8F7)
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGO
                // const SizedBox(
                //   height: 65,
                // ),
                Image.asset(
                  'lib/images/PrimosLogo.png',
                ),
                // TITLE
                const SizedBox(
                  height: 35,
                ),

                Text(
                  "WELCOME TO",
                  style: Theme.of(context).textTheme.titleLarge?.merge(
                        const TextStyle(fontWeight: FontWeight.w600),
                      ),
                  // TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "PRIMO'S BISTRO POS",
                  style: Theme.of(context).textTheme.titleLarge?.merge(
                        const TextStyle(fontWeight: FontWeight.w600),
                      ),
                  // TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                )
                // Username textfield
                ,
                const SizedBox(
                  height: 35,
                ),
                StyledTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                // Password textfield
                const SizedBox(
                  height: 10,
                ),
                StyledTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),

                // Sign in button
                StyledButton(
                  btnText: btnText,
                  onClick: handleSignin,
                  btnIcon: const Icon(Icons.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
