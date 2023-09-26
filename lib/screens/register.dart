import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gmandphauth/screens/home.dart';
import 'package:gmandphauth/screens/phhome.dart';
import 'package:gmandphauth/services/mainscreem.dart';

class Registeremail extends StatefulWidget {
  const Registeremail({super.key});
  @override
  State<Registeremail> createState() => _RegisteremailState();
}

class _RegisteremailState extends State<Registeremail> {
  final formkey=GlobalKey<FormState>();
  final AllFirebaseAuthServices auths = AllFirebaseAuthServices();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();

  bool issignin=true;


  void toogle(){
    setState(() {
      issignin=!issignin;
    });
  }


//signup function
  signup(BuildContext context) async {
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
    String email = controlleremail.text;
    String password = controllerpassword.text;
    User? user = await auths.sigupemailandpassword(email, password);
    Navigator.of(context).pop();
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
     
    } else {
      Fluttertoast.showToast(msg: "This email already exits",toastLength: Toast.LENGTH_SHORT);
    }
  }


//sigin in function

  signIn() async {
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
    String email = controlleremail.text;
    String password = controllerpassword.text;
    User? user = await auths.sigInemailandpassword(email, password);
    Navigator.of(context).pop();
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      print("error");
      Fluttertoast.showToast(
          msg: "Invalid username or password", toastLength: Toast.LENGTH_SHORT);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/images.png'),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value){
                    if(value==null|| value.isEmpty){
                      return "email is required";
                    }
                    final email=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
                    if(!email.hasMatch(value)){
                      return "enter a vaild email";
                    }
                    return null;
                  },
                  controller: controlleremail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "enter email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value==null||value.isEmpty) {
                      return "this feild is required";
                    }else if(value.length<6){
                      return "password must be atleast 6 character long";
                    }
                    return null;
                  },
                  controller: controllerpassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "enter password",
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
               

               //terinary condition
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      // signup(context);

                      issignin?signIn():signup(context);
                    }
                  },
                  child: Container(
                    height: 50,
                    // width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child:  Center(
                        child: Text(
                      issignin?  "Log in": "Sign up",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Text(issignin?"don't have account?":"have account"),
                    TextButton(onPressed: () {
                      toogle();
                    }, child:  Text(issignin?"signup":"login")),
                  ],
                ),

                InkWell(
                  onTap: () {
                    // Authgoole auth = Authgoole();
                    // auth.getsignin(context);
                    AllFirebaseAuthServices auth=AllFirebaseAuthServices();
                    auth.getsignin(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Center(
                                child:
                                    Image.asset('lib/assets/download (2).png')),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Center(
                            child: Text(
                          "sigin in with google",
                          style: TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Center(
                                child: Image.asset('lib/assets/phone1.png')),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Center(
                            child: Text("sigin using mobile",
                                style: TextStyle(fontSize: 15))),
                      ],
                    ),
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
