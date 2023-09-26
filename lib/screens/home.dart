
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gmandphauth/screens/register.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final auth =FirebaseAuth.instance.currentUser!;

 signout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const Registeremail()),
      (route) => false,
    );
  }
Future<bool> willpop() async{
  showDialog<bool>(context: context, builder: (context){
    return  AlertDialog(
      title: const Text("are you sure?"),
      content: const Text("Do you want to exit?"),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop(false);

        }, child: const Text("cancel")),
        TextButton(onPressed: (){
          exit(0);
        }, child: const Text("okay"))

      ],
      

    );
  });
return false;
}


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willpop,
      child: Scaffold(
        appBar: AppBar(
          title:  const Text("welcome home!!!"),
          leading:const Icon(Icons.home),
          actions: [
            IconButton(onPressed: (){
              signout(context);
            }, icon:const Icon(Icons.logout))
          ],
        ),
        body: const Column(children: [
          // Text(auth.email!.toString()),
          // Text(auth.phoneNumber!.toString()),
          Text("dashboard"),
        ]),
      ),
    );
  }
}