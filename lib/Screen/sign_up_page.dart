import 'package:flutter/material.dart';
import 'package:grocery/Service/authclass_helper.dart';
import 'package:grocery/Utilities/custom_text_field.dart';
import 'package:grocery/Utilities/customtext.dart';
import 'package:grocery/Utilities/message.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController signUpnumberController = TextEditingController();
  TextEditingController signUppasswordController = TextEditingController();
  bool _isPasswordVisible = false;
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
                  text: 'Welcome Back to \nour grocery shop',
                  clr: Colors.black87,
                  fm: 'Roboto',
                  fs: 25,
                  fw: FontWeight.w800,
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
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Customtext(
                            text: 'Phone Number',
                            clr: Colors.black54,
                            fs: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextfield(
                            controller: signUpnumberController,
                            hintText: 'Number',
                            labelText: 'Enter Your Number',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Customtext(
                            text: 'Password',
                            clr: Colors.black54,
                            fs: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomTextfield(
                            controller: signUppasswordController,
                            hintText: 'Password',
                            labelText: 'Enter Your Password',
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Customtext(
                              text: 'Forgot Password?',
                              clr: Colors.black,
                              fs: 15,
                              fm: 'Roboto',
                              fw: FontWeight.w700,
                              ls: 1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Customtext(
                                text: 'Sign Up',
                                clr: Colors.black,
                                fs: 25,
                                fm: 'Roboto',
                                fw: FontWeight.w800,
                              ),
                              Container(
                                width: 80,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 76, 141, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(255, 255, 255, 0.349),
                                      blurRadius: 15,
                                      spreadRadius: 0,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    await AuthclassHelper().signUpWithPhoneAndPassword(
                                      phoneNumber: '+91' + signUpnumberController.text.trim(),
                                      password: signUppasswordController.text.trim(),
                                      
                                    );
                                     Navigator.pushNamed(context, "/");
                                    signUpnumberController.clear();
                                    signUppasswordController.clear();
                                   
                                    Message.show(msg: 'Sign up Succesfull');
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
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
