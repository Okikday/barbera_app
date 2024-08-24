import 'package:flutter/material.dart';
import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/common/widgets/flat_button1.dart';
import 'package:barbera_app/getting_started/sign_in_1.dart';
import 'package:barbera_app/main.dart';
import 'package:barbera_app/utils/device_utils.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        runApp(const MyApp());
        debugPrint("Back to MainApp");
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
      
          SizedBox(
            child: TabBarView(controller: tabController, children: [
              TabBarViewElement(
                  screenWidth: screenWidth,
                  screenHeight: screenWidth + 100,
                  assetImage: "assets/barbera/images/barbera_on_boarding_1.jpg",
                  description:
                      "Find and Book barber, Beauty, salon & Spa services anywhere, anytime.",
                  header: "Find and book service"),
              TabBarViewElement(
                  screenWidth: screenWidth,
                  screenHeight: screenWidth + 100,
                  assetImage: "assets/barbera/images/barbera_on_boarding_2.jpg",
                  description:
                      "Choose our Makeup special offer price Package that fit your Lifestyle",
                  header: "Style that fit your Lifestyle"),
              TabBarViewElement(
                  screenWidth: screenWidth,
                  screenHeight: screenWidth + 100,
                  assetImage: "assets/barbera/images/barbera_on_boarding_3.jpg",
                  description:
                      "We will serve you well so that you remain handsome and stylish",
                  header: "We provide Best Services Ever"),
            ]),
          ),
      
          Positioned(
              top: 24,
              right: 24,
              child: FlatButton1(
                text: "Skip",
                color: Colors.white,
                onpressed: () => tabController.index = 2,
              )),
      
          //bottom
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton1(
                  text: "Skip",
                  color: Theme.of(context).colorScheme.onPrimary,
                  onpressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignIn1())),
                ),
                TabPageSelector(
                  controller: tabController,
                  color: Colors.grey,
                  selectedColor: BarberaColor.goldenRod,
                  borderStyle: BorderStyle.none,
                ),
                MaterialButton(
                  onPressed: () {
                    if (tabController.index != 2) {
                      tabController.index++;
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn1()));
                    }
                  },
                  color: BarberaColor.goldenRod,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(12),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class TabBarViewElement extends StatelessWidget {
  final String assetImage;
  final String header;
  final String description;
  const TabBarViewElement({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.assetImage,
    required this.description,
    required this.header,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth,
          height: screenWidth + 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(assetImage))),
        ),
        Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  header,
                  style: TextStyle(fontSize: Constants.extraMedium, color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
