// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gmandphauth/screens/home.dart';
// import 'package:gmandphauth/screens/phhome.dart';
// import 'package:gmandphauth/screens/register.dart';
// import 'package:gmandphauth/services/mainscreem.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final AllFirebaseAuthServices auths = AllFirebaseAuthServices();
//   TextEditingController controlleremail = TextEditingController();
//   TextEditingController controllerpassword = TextEditingController();

//   signIn() async {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const Center(
//           child: CircularProgressIndicator(
//             backgroundColor: Colors.blue,
//             valueColor: AlwaysStoppedAnimation(Colors.grey),
//             strokeWidth: 5,
//           ),
//         );
//       },
//     );
//     String email = controlleremail.text;
//     String password = controllerpassword.text;
//     User? user = await auths.sigInemailandpassword(email, password);
//     Navigator.of(context).pop();
//     if (user != null) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const Home()));
//     } else {
//       print("error");
//       Fluttertoast.showToast(
//           msg: "Invalid username or password", toastLength: Toast.LENGTH_SHORT);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('lib/assets/images.png'),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: controlleremail,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     labelText: "enter email",
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: controllerpassword,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     labelText: "enter password",
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () {
//                           signIn();
//                         },
//                         child: const Text("sign in")),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const Registeremail()));
//                         },
//                         child: const Text("signup")),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     AllFirebaseAuthServices auth = AllFirebaseAuthServices();
//                     auth.getsignin(context);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                           child: SizedBox(
//                             height: 50,
//                             width: 50,
//                             child: Center(
//                                 child:
//                                     Image.asset('lib/assets/download (2).png')),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         const Center(
//                             child: Text(
//                           "sigin in with google",
//                           style: TextStyle(fontSize: 15),
//                         )),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const MyHomePage()));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Center(
//                           child: SizedBox(
//                             height: 50,
//                             width: 50,
//                             child: Center(
//                                 child: Image.asset('lib/assets/phone1.png')),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         const Center(
//                             child: Text("sigin using mobile",
//                                 style: TextStyle(fontSize: 15))),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
