import 'package:flutter/material.dart';
import 'package:barbera_app/screens/appointment.dart';
import 'package:barbera_app/screens/chat.dart';
import 'package:barbera_app/screens/home.dart';
import 'package:barbera_app/screens/nearby.dart';
import 'package:barbera_app/screens/profile.dart';
import 'package:barbera_app/common/styles/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{
  late int currentIndex;
  final List<Widget> widgets = [const Home(), const Nearby(), const Chat(), const Appointment(), Profile()];
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    tabController = TabController(length: widgets.length, vsync: this);
    tabController.index = currentIndex;
    tabController.addListener(tabListener);
  }

  void tabListener()=> setState(() => currentIndex = tabController.index);

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body: GestureDetector(
        child: TabBarView(controller: tabController, physics: const NeverScrollableScrollPhysics(),children: widgets,)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: BarberaColor.goldenRod,
        selectedFontSize: 12,
        currentIndex: currentIndex,
        onTap: (value) => setState((){currentIndex = value; tabController.index = value;}),
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: BarberaColor.arsenic,), label: "Home", activeIcon: Icon(Icons.home, color: BarberaColor.goldenRod,),),
        BottomNavigationBarItem(icon: Icon(Icons.nearby_error,  color: BarberaColor.arsenic,), label: "Nearby", activeIcon: Icon(Icons.nearby_error,  color: BarberaColor.goldenRod,),),
        BottomNavigationBarItem(icon: Icon(Icons.chat_rounded,  color: BarberaColor.arsenic,), label: "Chat", activeIcon: Icon(Icons.chat_rounded,  color: BarberaColor.goldenRod,),),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month,  color: BarberaColor.arsenic,), label: "Appointment", activeIcon: Icon(Icons.calendar_month,  color: BarberaColor.goldenRod,),),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline,  color: BarberaColor.arsenic,), label: "Profile", activeIcon: Icon(Icons.person_outline,  color: BarberaColor.goldenRod,),)
      ]),
      
    );
  }
}