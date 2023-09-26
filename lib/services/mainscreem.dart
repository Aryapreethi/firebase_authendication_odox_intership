import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gmandphauth/screens/home.dart';
import 'package:gmandphauth/screens/otpvfy.dart';
import 'package:gmandphauth/screens/phhome.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AllFirebaseAuthServices {

 FirebaseAuth auth= FirebaseAuth.instance;
 Future<User?> sigupemailandpassword(String email,String password)async{
  try {
    UserCredential credential= await  
    auth.createUserWithEmailAndPassword(
    email: email, password: password);
    return credential.user;
    
  } catch (e) {
    
    print('$e');
  }
  return null;
  }

  Future<User?> sigInemailandpassword(String email,String password)async{
  try {
    UserCredential credential= await  auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
    
  } catch (e) {
    
    print('$e');
  }
  return null;


  }

  //google signin
  Future<User?> getsignin(BuildContext context) async {
     showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation(Colors.grey),
            strokeWidth: 5,
          ),
        );
      },
    );
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    try {
      final UserCredential authuser =
          await FirebaseAuth.instance.signInWithCredential(credential);
          Navigator.of(context).pop();
      if (authuser.user != null) {
         Navigator.push(
            context, MaterialPageRoute(builder: ((context) => const Home())));
      }
      return authuser.user;
    } catch (e) {
      Fluttertoast.showToast(msg: '$e', toastLength: Toast.LENGTH_SHORT);
    }
    return null;
  }

  //send otp when phone is verifed
  Future<User?> codesent(BuildContext context, String phone) async {
     showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation(Colors.grey),
            strokeWidth: 5,
          ),
        );
      },
    );
    FirebaseAuth auth = FirebaseAuth.instance;
    if(phone.isEmpty){
      Fluttertoast.showToast(msg: "Please enter phone number",
      toastLength: Toast.LENGTH_SHORT);
    }
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (String verificationId, int? resendToken) async {
          MyHomePage.verify = verificationId;
           Navigator.of(context).pop(); 
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Phonevfy())));
             
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
           Navigator.of(context).pop();
        },
        verificationFailed: (FirebaseAuthException error) {
          Fluttertoast.showToast(
            msg: " ${error.message}",
            toastLength: Toast.LENGTH_SHORT,
          );
          Navigator.of(context).pop();
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.of(context).pop();
    }
    return null;
  }

//get otp
   Future<User?> getotp(BuildContext context, String code) async {
     showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation(Colors.grey),
            strokeWidth: 5,
          ),
        );
      },
    );
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: MyHomePage.verify, smsCode: code);
      final UserCredential cal =
       await auth.signInWithCredential(credential);
    
      if (cal.user != null) {
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: ((context) => const Home())));
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "enter correct otp",
        toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.of(context).pop();
    }
    return null;
  }
}
