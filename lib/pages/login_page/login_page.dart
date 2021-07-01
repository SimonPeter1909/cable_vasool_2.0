import 'package:cable_vasool/app_enums.dart';
import 'package:cable_vasool/pages/login_page/login_provider.dart';
import 'package:cable_vasool/res.dart';
import 'package:cable_vasool/widgets/app_button.dart';
import 'package:cable_vasool/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<LoginProvider, LoginScreenState>(
        selector: (_, state) => state.currentState,
        builder: (BuildContext context, currentState, Widget? child) {
          switch (currentState) {
            case LoginScreenState.mobileNumber:
              return _MobileNumberState();
            case LoginScreenState.checkingMobileNumber:
              return LoaderWidget();
            case LoginScreenState.error:
              return SizedBox();
            case LoginScreenState.notRegistered:
              return SizedBox();
            case LoginScreenState.sendingSMS:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(Res.sending_sms),
                    Text("Sending SMS... Please Wait..."),
                  ],
                ),
              );
            case LoginScreenState.otpScreen:
              return SizedBox();
            case LoginScreenState.verified:
              return SizedBox();
            case LoginScreenState.verificationFailed:
              return SizedBox();
          }
        },
      ),
    );
  }
}

class _MobileNumberState extends StatelessWidget {
  const _MobileNumberState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider _provider =
        Provider.of<LoginProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(50),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    Res.television,
                    height: 200,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Verify your Mobile Number",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _provider.mobileNumberCntlr,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
                    labelText: "Your Mobile Number",
                      hintText: "E.g. 7895421484", border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AppButton(
              title: "Send OTP",
              onTap: (context) {
                _provider.onSendOTPTapped(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
