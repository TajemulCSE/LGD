import 'package:flutter/material.dart';
import 'package:lgd/providers/user_provider.dart';
import 'package:lgd/screens/dev_info/developer_info_screen.dart';
import 'package:lgd/user_profile_screen.dart';
import 'package:lgd/screens/tour_schedule/tournament_schedule_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 73, 35),
        title: Row(
          children: [
            Text("LGD"),

            Center(
              child: Image.asset(
                "assets/photos/LGD_NEW_LOGO_BG_Removed.png",
                height: 70,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("LGD")),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Developer Info"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeveloperInfoScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body:
          _selectedIndex == 0
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ListView(
                    children: [
                      SizedBox(height: 10),

                      Text(
                        "🔥 Welcome to LGD  \n🎯 Mission: To build a friendly and fair gaming platform where everyone can play, learn and grow together. \n🌟 Vision:To become a trusted name in the Bangladeshi gaming community and support new players through tournaments.\nCollab📩WhatsApp:+8801581515401",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "🎮 Live Streaming & Gameplay of Free Fire, Call of Duty Mobile!",
                      ),
                      SizedBox(height: 15),
                      Text("Get updates:"),
                      Text("📺 YouTube: youtube.com/@LGDTAJ"),
                      Text("📘 Facebook: facebook.com/LGDTAJ"),
                      Text("📺 📱 WhatsApp: +8801581515401"),
                    ],
                  ),
                ),
              )
              : _selectedIndex == 1
              ? TournamentScheduleScreen()
              : Consumer<UserProvider>( builder: (context, users, child) {
                users.fetchUserData();
                return UserProfileScreen();
                }),
              
              

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Tour Schedule",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
