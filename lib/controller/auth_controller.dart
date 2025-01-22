import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'dart:developer';
import 'package:flutter/material.dart';

class AuthController extends GetxController{

  String userUid = '';
  var verId = '';
  int? resendTokenId;
  bool phoneAuthCheck = false;
  dynamic credentials;


  phoneAuth(String phone) async {
    try {
      credentials = null;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          log('Completed');
          credentials = credential;
          await FirebaseAuth.instance
              .signInWithCredential(credential);
        },
        forceResendingToken: resendTokenId,
        verificationFailed: (FirebaseAuthException e) {
          log('Failed');
          if (e.code == 'invalid-phone-number') {
            debugPrint('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          log('Code sent');
          verId = verificationId;
          resendTokenId = resendToken;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch(e) {
      log("Error occurred $e");
    }
  }

  verifyOtp(String otpNumber)async{
    log("called");
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(
          verificationId: verId,
          smsCode: otpNumber);

    log("LoggedIn");

    await FirebaseAuth.instance
        .signInWithCredential(credential);
  }


}