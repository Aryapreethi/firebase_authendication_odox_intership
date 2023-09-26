import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmandphauth/services/mainscreem.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static String verify = "";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var phone = "";
  // TextEditingController phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  //  final Phoneauth _phoneauth=Phoneauth();

  // void codesent() async {
  // FirebaseAuth auth = FirebaseAuth.instance;

  //   try {
  //     await auth.verifyPhoneNumber(
  //       phoneNumber: phone,
  //       codeSent: (String verificationId, int? resendToken) async {
  //         MyHomePage.verify = verificationId;
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: ((context) => const Phonevfy())));
  //       },
  //       verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
  //         await auth.signInWithCredential(phoneAuthCredential);
  //       },
  //       verificationFailed: (FirebaseAuthException error) {
  //         Fluttertoast.showToast(
  //           msg: " ${error.message}",
  //           toastLength: Toast.LENGTH_SHORT,
  //         );
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: "$e",
  //       toastLength: Toast.LENGTH_SHORT,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Phone verification",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Need to be registered before getting started!",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "enter phone number"),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    initialCountryCode: 'IN',
                    onChanged: (value) {
                      phone = value.completeNumber;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // codesent()
                    // ;
                    if (formkey.currentState!.validate()) {
                      AllFirebaseAuthServices ph = AllFirebaseAuthServices();
                      ph.codesent(context, phone);
                    }
                  },
                  child: const Text("send code")),
            ],
          ),
        ),
      ),
    );
  }
}
