import 'package:flutter/material.dart';
import 'package:barbera_app/screens/main_screen.dart';
import 'package:barbera_app/common/widgets/custom_textfield.dart';
import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/utils/device_utils.dart';
import 'package:lottie/lottie.dart';

class SignIn2 extends StatefulWidget {
  final bool loadingVisible;
  const SignIn2({super.key, this.loadingVisible = false});

  @override
  State<SignIn2> createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  late bool isLoadingVisible;
  @override
  void initState() {
    super.initState();
    isLoadingVisible = widget.loadingVisible;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);
    double screenHeight = DeviceUtils.getScreenHeight(context);
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset("assets/barbera/images/barbera_sign_in.jpg")),
          Positioned(
            top: screenHeight * 0.225,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight,
              decoration: BoxDecoration(
                  color: BarberaColor.white,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Welcome back",
                    style: TextStyle(
                        color: BarberaColor.goldenRod,
                        fontSize: Constants.extraMedium),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Style that fit your lifestyle",
                    style: TextStyle(
                        color: Colors.grey, fontSize: Constants.small),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextfield(
                    hint: "Email Address",
                    
                    pixelHeight: 48,
                    width: screenWidth > 500 ? null : 90,
                    pixelWidth: 300,
                    ontap: () => debugPrint("This"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextfield(
                    hint: "Password",
                    width: screenWidth > 500 ? null : 90,
                    pixelWidth: 300,
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: BarberaColor.goldenRod,
                    ),
                    addSuffixIcon: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  MaterialButton(
                    onPressed: () {
                      debugPrint("Clicked!");
                      setState(() {
                        isLoadingVisible = true;
                      });
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      });
                    },
                    minWidth: screenWidth > 500 ? 350 : screenWidth * 0.9,
                    height: 48,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: BarberaColor.goldenRod,
                    child: SizedBox(
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: widget.loadingVisible,
                            child: Transform.scale(
                                scale: 2.5,
                                child: LottieBuilder.asset(
                                  "assets/barbera/icons/barbera_loading_lottie.json",
                                  width: 48,
                                  height: 32,
                                )),
                          ),
                          Text(
                            "Sign in",
                            style: TextStyle(
                                color: BarberaColor.white,
                                fontSize: Constants.medium),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: Colors.grey, fontSize: Constants.small),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                        color: Colors.grey, fontSize: Constants.small),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
