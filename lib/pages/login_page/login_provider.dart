import 'package:cable_vasool/app_enums.dart';
import 'package:cable_vasool/utils/app_flash_bar.dart';
import 'package:cable_vasool/utils/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  LoginScreenState _currentState = LoginScreenState.mobileNumber;

  LoginScreenState get currentState => _currentState;

  set currentState(LoginScreenState value) {
    _currentState = value;
    notifyListeners();
  }

  final TextEditingController mobileNumberCntlr = TextEditingController();

  onDispose() {
    mobileNumberCntlr.dispose();
  }

  onSendOTPTapped(BuildContext context) async {
    if (mobileNumberCntlr.text.isEmpty) {
      ToastUtils.showToast("Please Enter Mobile Number");
    } else if (mobileNumberCntlr.text.length != 10) {
      ToastUtils.showToast("Please Enter a Proper Mobile Number");
    } else {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+44 7123 123 456',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
  }
}
