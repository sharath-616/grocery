import 'package:flutter/material.dart';
import 'package:grocery/Utilities/custom_text_field.dart';
import 'package:grocery/Utilities/customtext.dart';
import 'package:grocery/Utilities/message.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController addNewPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool _isPasswordVisible = false;

  void _updatePassword() async {
    String newPassword = addNewPassController.text.trim();
    String confirmPassword = confirmPassController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      Message.show(msg: 'Please fill in all fields');
      return;
    }

    if (newPassword != confirmPassword) {
      Message.show(msg: 'Passwords do not match');
      return;
    }

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        Message.show(msg: 'Password updated successfully!');
        Navigator.pushNamed(context, '/');
      } else {
        Message.show(msg: 'User not signed in. Please sign in first.');
      }
    } catch (e) {
      Message.show(msg: 'Error updating password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        title: Customtext(
          text: 'New Password',
          clr: Colors.black,
          fm: 'Roboto',
          fs: 20,
          fw: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              elevation: 4,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Customtext(
                      text: 'New Password',
                      clr: Colors.black54,
                      fs: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextfield(
                      controller: addNewPassController,
                      hintText: 'New Password',
                      labelText: 'Enter Your New Password',
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Customtext(
                      text: 'Retype Password',
                      clr: Colors.black54,
                      fs: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextfield(
                      controller: confirmPassController,
                      hintText: 'Retype Password',
                      labelText: 'Confirm Your New Password',
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: TextButton(
                        onPressed: _updatePassword,
                        child: Customtext(
                          text: 'Done',
                          clr: Colors.white,
                          fm: 'Roboto',
                          fs: 16,
                          fw: FontWeight.bold,
                          ls: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
