import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawerScreen extends StatefulWidget {
  const drawerScreen({super.key});

  @override
  State<drawerScreen> createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("College Management"),),
      // bottomNavigationBar: BottomNavigationBarItem(
      //   icon: Icons.add,
      //   label: "dfdf",
      //   activeIcon: Icons.account_balance
      // ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.cyanAccent
                ),
                child: Column(
              children: [
                ClipRRect(
                  child: Image.network("https://a.storyblok.com/f/191576/1200x800/faa88c639f/round_profil_picture_before_.webp",
                  height: 70,width: 70,
                  ),
                  borderRadius: BorderRadius.circular(50)
                ),
                const Text('\n Abhijit')
              ],
            )),
            const Text('\n Abhijit')
          ],
        ),
      ),
    );
  }
}
