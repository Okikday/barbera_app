import 'package:flutter/material.dart';

import 'package:barbera_app/common/styles/colors.dart';
import 'package:barbera_app/common/styles/constants.dart';
import 'package:barbera_app/utils/device_utils.dart';

class Completed extends StatefulWidget {
  final List list;
  final double screenWidth;
  const Completed({super.key, this.screenWidth = 200, this.list = const []});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  late List newList;

  @override
  void initState() {
    super.initState();
    newList = [];
    loadList();
  }

  void loadList() {
    for (int i = 0; i < widget.list.length; i++) {
      if (widget.list[i][2] == "completed" && !newList.contains(widget.list[i])) {
        newList.add(widget.list[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    loadList();
    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;
        final parentHeight = constraints.maxHeight;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Container(
              width: parentWidth,
              child: Column(
              children: [
                for (int i = 0; i < newList.length; i++)
                 Column(children: [
                  Constants.whiteSpaceVertical(12),
                  CompletedBox(barbershopName: newList[i][0], address: newList[i][1], state: newList[i][2], topic: newList[i][3], date: newList[i][4], price: newList[i][5].toDouble(), assetName: newList[i][6],),
                  Constants.whiteSpaceVertical(12),
                 ],)
              ],
            ),
            ),
          ),
        );
      },
    );
  }
}



class CompletedBox extends StatelessWidget {
  final String? barbershopName;
  final String? address;
  final String? state;
  final String? topic;
  final String? date;
  final double? price;
  final String assetName;
  const CompletedBox({
    super.key,
    required this.barbershopName,
    required this.address,
    required this.state,
    required this.topic,
    required this.date,
    required this.price,
    this.assetName = "barbera_logo.png"
  });

  
  @override
  Widget build(BuildContext context) {
    final double screenWidth = DeviceUtils.getScreenWidth(context);
    return LayoutBuilder(
      builder:(context, constraints) {
        final double parentHeight = constraints.maxHeight;
        final double parentWidth = constraints.maxWidth;
        return Container(
        
      clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: BarberaColor.goldenRod),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: BarberaColor.goldenRod,
              width: parentWidth,
              child: Constants.wrapInPadding(top: 4, bottom: 4, Text("$topic", style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: Constants.medium),)),
            ),
            Constants.whiteSpaceVertical(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Constants.wrapInPadding( left: 8, right: 8,
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.fromBorderSide(BorderSide(color: Theme.of(context).primaryColor)),
                        image: DecorationImage(
                      image: AssetImage("assets/barbera/images/$assetName"),
                    )),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      barbershopName ?? "",
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: Constants.medium),
                    ),
                    Constants.whiteSpaceVertical(12),
                    SizedBox(
                      width: screenWidth * 0.6,
                      child: Text(
                        address ?? "Unknown address",
                        style:
                            TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: Constants.extraSmall),
                      ),
                    ),
                    Constants.whiteSpaceVertical(12),
                    Text(
                      date ?? "Date:",
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: Constants.extraSmall),
                    ),

                    Constants.whiteSpaceVertical(24),
                  ],
                )
              ],
            ),
            Divider(height: 1, color: BarberaColor.goldenRod,),
            Container(
              height: 48,
              child: Constants.wrapInPadding( left: 8, right: 12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: \$${price ?? 0}",
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      "View",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: Constants.smallPlus2,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      },
    );
  }
}