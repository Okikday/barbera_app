import 'package:flutter/material.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/common/widgets/barber_specialists.dart';
import 'package:barbera_app/storage/data.dart';
import 'package:barbera_app/utils/device_utils.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth(context);
    double screenHeight = DeviceUtils.getScreenHeight(context);
    return SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          //Top
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.1,
                  width: screenWidth,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Constants.wrapInPadding(
                    top: 24,
                    Text(
                      "Inbox",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: Constants.medium),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )),

            //Below Inbox
            Positioned(
              top: screenHeight * 0.1,
              left: 0,
              right: 0,
              child: SizedBox(
                height: screenHeight -
                    DeviceUtils.getBottomNavigatorBarHeight() -
                    (screenHeight * 0.1),
                width: screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BarberSpecialists(
                        list: Data.barberSpecialists,
                        showAllOption: false,
                        topic: "Online Barbers",
                        color: const Color.fromARGB(255, 21, 101, 27),
                      ),
                      RecentChats(
                        list: Data.barberSpecialists,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class RecentChats extends StatelessWidget {
  final List list;
  const RecentChats({
    super.key,
    this.list = const [],
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = DeviceUtils.getScreenWidth(context);
    return Constants.wrapInPadding(
      all: 16,
      Column(
        children: [
          SizedBox(
              width: screenWidth,
              child: Text(
                "Recent Chats",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: Constants.medium),
              )),
              for(int i = 0; i < list.length; i++) PeopleChats(personName: list[i][0], assetName: list[i][1],)
        ],
      ),
    );
  }
}

class PeopleChats extends StatelessWidget {
  final String assetName;
  final String personName;
  const PeopleChats(
      {super.key, this.assetName = "barbera_logo.jpg", this.personName = ""});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
            image: DecorationImage(
                image: AssetImage("assets/barbera/images/$assetName"))),
      ),
      title: Text(personName, style: TextStyle(color: Theme.of(context).colorScheme.primary),),
      subtitle: Text("What we talked about yesterday", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
      trailing: Text("4:28PM", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
      onTap: (){},
      contentPadding: const EdgeInsets.all(4),
    );
  }
}
