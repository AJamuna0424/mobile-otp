import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'otpVeify_screen.dart';

class MobilenumberScreen extends StatefulWidget {
  const MobilenumberScreen({super.key});

  @override
  State<MobilenumberScreen> createState() => _MobilenumberScreenState();
}

class _MobilenumberScreenState extends State<MobilenumberScreen> {
  TextEditingController mobilenumberText = TextEditingController();
  String selectedCountryCode = '+91';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/Cancel.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Please select your mobile number',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Text(
                      'You ll receive a 6 digit code \n to verify next.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: IntlPhoneField(
                        controller: mobilenumberText,
                        //flagsButtonPadding: const EdgeInsets.all(8),
                        dropdownIconPosition: IconPosition.trailing,
                        decoration: const InputDecoration(
                          labelText: 'Mobile Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {},
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (mobilenumberText.text.length == 10) {
                          print(selectedCountryCode + mobilenumberText.text);
                          await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber:
                                selectedCountryCode + mobilenumberText.text,
                            verificationCompleted:
                                (PhoneAuthCredential credential) {
                              print('verification completed');
                            },
                            verificationFailed: (FirebaseAuthException e) {
                              print('verification failed $e');
                            },
                            codeSent:
                                (String verificationId, int? resendToken) {
                              print('code sent');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpverifyScreen(
                                          mobileNumber:
                                              '$selectedCountryCode${mobilenumberText.text}',
                                          verficationId: verificationId,
                                        )),
                              );
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {
                              print('auto retieval timeouted');
                            },
                          );
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.85,
                        color: const Color(0xFF2E3B62),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CONTINUE',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
