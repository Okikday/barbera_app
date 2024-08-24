import 'package:flutter/material.dart';
import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/common/widgets/cancelled.dart';
import 'package:barbera_app/common/widgets/completed.dart';
import 'package:barbera_app/common/widgets/upcoming.dart';
import 'package:barbera_app/storage/data.dart';
import 'package:barbera_app/utils/device_utils.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    tabController.index = 0;
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = DeviceUtils.getScreenHeight(context);
    final double screenWidth = DeviceUtils.getScreenWidth(context);
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: screenWidth,
        height: screenHeight,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.1,
              child: Constants.wrapInPadding(
                top: 48,
                Text(
                  "Appointments",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: Constants.medium),
                ),
              ),
            ),
            Constants.whiteSpaceVertical(12),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.fromBorderSide(BorderSide(
                  width: 1,
                  color: BarberaColor.goldenRod,
                  
                )),
              ),
              width: screenWidth,
              height: screenHeight * 0.05,
              child: PreferredSize(
                preferredSize: Size(screenWidth, screenHeight * 0.05),
                child: TabBar(
                  dividerColor: BarberaColor.goldenRod,
                  labelColor: Theme.of(context).colorScheme.secondary,
                  unselectedLabelColor: Theme.of(context).colorScheme.primary,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: BarberaColor.goldenRod,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.fromBorderSide(BorderSide(
                      width: 1,
                      color: BarberaColor.goldenRod,
                    )),
                  ),
                  tabs: const [
                    Tab(
                      text: "Upcoming",
                    ),
                    Tab(
                      text: "Completed",
                    ),
                    Tab(
                      text: "Cancelled",
                    ),
                  ],
                  controller: tabController,
                  onTap: (value) {
                    tabController.index = value;
                  },
                ),
              ),
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: screenWidth,
              height: screenHeight -
                  DeviceUtils.getBottomNavigatorBarHeight() -
                  (screenHeight * 0.16) -
                  48,
              child: TabBarView(
                controller: tabController,
                children: [
                  Upcoming(
                    list: Data.appointment,
                  ),
                  Completed(
                    list: Data.appointment,
                  ),
                  Cancelled(
                    list: Data.appointment,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
