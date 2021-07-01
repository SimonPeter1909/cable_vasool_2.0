import 'package:cable_vasool/api/api_provider.dart';
import 'package:cable_vasool/app_enums.dart';
import 'package:cable_vasool/models/general_response_model.dart';
import 'package:cable_vasool/utils/app_flash_bar.dart';
import 'package:cable_vasool/utils/flutter_toast.dart';
import 'package:cable_vasool/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  LoginScreenState currentState = LoginScreenState.mobileNumber;

  void setCurrentState(LoginScreenState value) {
    currentState = value;
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
      checkNumber();
    }
  }

  void checkNumber() async {
    setCurrentState(LoginScreenState.checkingMobileNumber);
    GeneralResponseModel? model =
        await ApiProvider.checkPhoneNumber(mobileNumberCntlr.text);
    if (model == null) {
      setCurrentState(LoginScreenState.error);
    } else {
      sendOtp();
    }
  }

  void sendOtp() async {
    setCurrentState(LoginScreenState.sendingSMS);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${mobileNumberCntlr.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        ///Android Only
        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        setCurrentState(LoginScreenState.verified);
      },
      verificationFailed: (FirebaseAuthException e) {
        logger.e("Verification Failed", e);
        setCurrentState(LoginScreenState.verificationFailed);
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
