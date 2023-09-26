import 'package:flutter/material.dart';
import 'package:gmandphauth/services/mainscreem.dart';
import 'package:pinput/pinput.dart';

class Phonevfy extends StatefulWidget {
  const Phonevfy({super.key});

  @override
  State<Phonevfy> createState() => _PhonevfyState();
}

class _PhonevfyState extends State<Phonevfy> {
  var code = "";
  // getotp() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   try{
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: MyHomePage.verify, smsCode: code);
  //   await auth.signInWithCredential(credential);
  //   Navigator.push(context,MaterialPageRoute(builder: ((context) => const Home())));
  //   }catch(e){
  //     Fluttertoast.showToast(
  //     msg: "$e",
  //     toastLength: Toast.LENGTH_SHORT,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Verification your phone number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Enter the code ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Pinput(
                  length: 6,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    code = value;
                  }),
              Container(
                alignment: Alignment.bottomRight,
                child: const Text(
                  'Didn\'t receive SMS?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          AllFirebaseAuthServices ph=AllFirebaseAuthServices();
    
                        ph.getotp(context,code);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => const Home())));
                        },
                        child: const Text("verify"))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
