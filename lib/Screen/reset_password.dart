import 'package:flutter/material.dart';
import 'package:grocery/Service/authclass_helper.dart';
import 'package:grocery/Utilities/custom_text_field.dart';
import 'package:grocery/Utilities/customtext.dart';
import 'package:grocery/Utilities/message.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController resetPassWordController = TextEditingController();
  final AuthclassHelper _authHelper = AuthclassHelper();
  void _sendResetLink() async {
    String phoneNumber = resetPassWordController.text.trim();

    if (phoneNumber.isEmpty) {
      Message.show(msg: 'Please enter your phone number');
      return;
    }

    String response = await _authHelper.sendPasswordResetLink(phoneNumber: phoneNumber);
    Message.show(msg: response);

    if (response == "Password reset email sent successfully!") {
      Navigator.pushNamed(context, '/new_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Customtext(
                  text: 'Reset your password',
                  clr: Colors.black87,
                  fm: 'Roboto',
                  fs: 25,
                  fw: FontWeight.w800,
                  ls: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Customtext(
                  text: 'Please enter your number. We will send a code nto your phone to reset your password',
                  clr: Colors.black87,
                  fm: 'Roboto',
                  fs: 15,
                  fw: FontWeight.normal,
                  ls: 1,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Customtext(
                            text: 'Phone Number',
                            clr: Colors.black54,
                            fs: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextfield(
                            controller: resetPassWordController,
                            hintText: 'Email',
                            labelText: 'Enter Your Phone',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                              child: TextButton(
                                  onPressed: () {
                                    _sendResetLink();
                                    Navigator.pushNamed(context, '/new_password');
                                    Message.show(msg: 'please wait....');
                                  },
                                  child: Customtext(
                                    text: 'Send me link',
                                    clr: Colors.white,
                                    fm: 'Roboto',
                                    fs: 16,
                                    fw: FontWeight.bold,
                                    ls: 1,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
