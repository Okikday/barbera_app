import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/getting_started/sign_in_2.dart';
import 'package:barbera_app/utils/device_utils.dart';

class SignIn1 extends StatelessWidget {
  const SignIn1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = DeviceUtils.getScreenHeight(context);
    double screenWidth = DeviceUtils.getScreenWidth(context);

    return Scaffold(
        body: Stack(children: [
      Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/barbera/images/barbera_background_1.jpg"),
                fit: BoxFit.cover)),
      ),
      SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: const SignInBottom()),
    ]));
  }
}

class SignInBottom extends StatelessWidget {
  const SignInBottom({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = DeviceUtils.getScreenHeight(context);
    double screenWidth = DeviceUtils.getScreenWidth(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              height: screenHeight * 0.25,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                      image:
                          AssetImage("assets/barbera/images/barbera_logo.png"),
                      fit: BoxFit.contain)),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Welcome to barbera",
              style: TextStyle(color: BarberaColor.goldenRod, fontSize: 32),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "We will help find order and buy barbershop products and services at your location.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: BarberaColor.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: BarberaColor.arsenic,
                  borderRadius: BorderRadius.circular(25)),
              width: screenWidth,
              height: screenHeight * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignIn2())),
                    minWidth: screenWidth * 0.9,
                    height: 48,
                    color: BarberaColor.goldenRod,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: const Text("Sign in with email"),
                  ),
                  Text(
                    "Sign in with social networks",
                    style: TextStyle(color: BarberaColor.white, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocialButton1(
                          screenWidth: screenWidth * 0.4,
                          image: "assets/barbera/images/google_logo.png",
                          buttonText: "Google"),
                      SocialButton1(
                          screenWidth: screenWidth * 0.4,
                          image: "assets/barbera/images/facebook_circle_logo1.png",
                          buttonText: "Facebook")
                    ],
                  ),
                  Text(
                    "By sign in you agree to the Terms and the conditions",
                    style: TextStyle(
                      color: BarberaColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SocialButton1 extends StatelessWidget {
  const SocialButton1({
    super.key,
    required this.screenWidth,
    required this.image,
    required this.buttonText,
  });

  final double? screenWidth;
  final String? image;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(8),
      color: BarberaColor.white,
      minWidth: screenWidth,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: () => Fluttertoast.showToast(msg: "button clicked!"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 24, height: 24, child: Image.asset(image ?? "")),
          const SizedBox(
            width: 12,
          ),
          Text(
            buttonText ?? " ",
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
