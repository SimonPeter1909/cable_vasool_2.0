import 'package:after_layout/after_layout.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cable_vasool/res.dart';
import 'package:cable_vasool/routes/app_routes.gr.dart';
import 'package:cable_vasool/widgets/app_widgets.dart';
import 'package:cable_vasool/widgets/gradient_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Res.splash_image),
            SizedBox(
              height: 60,
              child: DefaultTextStyle(
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.grey,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    // FlickerAnimatedText('Welcome...'),
                    FlickerAnimatedText('Loading...',
                        speed: Duration(seconds: 3)),
                    // FlickerAnimatedText('Please Wait...'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    checkUser(context);
  }

  void checkUser(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      AutoRouter.of(context).popAndPush(LoginPageRoute());
    } else {
      AutoRouter.of(context).popAndPush(DashboardPageRoute());
    }
  }
}
