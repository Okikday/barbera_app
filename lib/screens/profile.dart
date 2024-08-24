import 'package:flutter/material.dart';
import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/utils/device_utils.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

//Icon, title
  final List profileOptions = [
    [Icons.add, "Booking order and appointments"],
    [Icons.heart_broken, "Favorite barbers salon"],
    [Icons.payment_rounded, "Payment method"],
    [Icons.key, "Change Password"],
    [Icons.help_outline_rounded, "Support"],
    [Icons.star_border, "Rate the app"],
    [Icons.map, "Language"],
    [Icons.info_outline_rounded, "About us"],
    [Icons.logout, "Log out"],
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);
    double screenHeight = DeviceUtils.getScreenHeight(context);

    return SizedBox(
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.1,
                width: screenWidth,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Constants.wrapInPadding(
                  top: 24,
                  Row(
                    children: [
                      Expanded(
                        child: Constants.wrapInPadding(
                            Text(
                              "Profile",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Constants.medium),
                              textAlign: TextAlign.center,
                            ),
                            left: 36),
                      ),
                      Constants.wrapInPadding(
                          Icon(
                            Icons.settings_outlined,
                            color: Theme.of(context).colorScheme.primary,
                            size: 28,
                          ),
                          right: 12)
                    ],
                  ),
                ),
              )),
          Positioned(
            top: screenHeight * 0.1,
            left: 0,
            right: 0,
            child: Column(
              children: [
                //The edit profile area
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Constants.wrapInPadding(
                        left: 8,
                        right: 12,
                        Container(
                          width: 81,
                          height: 81,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(64),
                              image: const DecorationImage(
                                image: AssetImage(
                                    "assets/barbera/images/alex.jpg"),
                              )),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alex Veranda",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: Constants.extraMedium),
                          ),
                          Constants.whiteSpaceVertical(8),
                          Text(
                            "verandalex@gmail.com",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: Constants.small),
                          ),
                          Constants.whiteSpaceVertical(8),
                          MaterialButton(
                            minWidth: 220,
                            onPressed: () {},
                            color: BarberaColor.goldenRod,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Text("Edit Profile"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                //The followers area
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Flex(
                    clipBehavior: Clip.hardEdge,
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              "128",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Constants.medium),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Constants.small),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              "640",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Constants.medium),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Constants.small),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              "240",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Constants.medium),
                            ),
                            Text(
                              "Likes",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Constants.small),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Constants.whiteSpaceVertical(12),

                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      for(int i = 0; i < profileOptions.length; i++)
                      ListTile(
                        leading: Icon(
                          profileOptions[i][0],
                          color: Theme.of(context).colorScheme.primary,
                          size: 28,
                        ),
                        title: Text(
                          profileOptions[i][1],
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: Constants.small),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Theme.of(context).colorScheme.primary,
                          size: 28,
                        ),
                        onTap: (){},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



