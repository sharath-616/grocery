import 'package:firebase_auth/firebase_auth.dart';

class AuthclassHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpWithPhoneAndPassword({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      String fakeEmail = "$phoneNumber@phoneuser.com";

      await _auth.createUserWithEmailAndPassword(
        email: fakeEmail,
        password: password,
      );
      print("User signed up successfully with phone number: $phoneNumber");
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<String> signInWithPhoneAndPassword({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      String fakeEmail = "$phoneNumber@phoneuser.com";

      await _auth.signInWithEmailAndPassword(
        email: fakeEmail,
        password: password,
      );
      print("User signed in successfully.");
      return "Login Success..!";
    } catch (e) {
      print("Error signing in: $e");
      return "Error";
    }
  }

  Future<String> sendPasswordResetLink({required String phoneNumber}) async {
    try {
      String fakeEmail = "$phoneNumber@phoneuser.com";

      await _auth.sendPasswordResetEmail(email: fakeEmail);
      return "Password reset number sent successfully!";
    } catch (e) {
      print("Error sending password reset email: $e");
      return "Error sending reset number. Please try again.";
    }
  }
}
