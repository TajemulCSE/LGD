import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lgd/developer_info_screen.dart';
import 'package:lgd/profile_login.dart';
import 'package:lgd/tournament_schedule_screen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
  return _HomeScreen();
  }
  

}


class _HomeScreen extends State<HomeScreen>{

  int _selectedIndex=0;

  void _onTapped(int index){
    setState(() {
      _selectedIndex=index;
    });

  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: const Color.fromARGB(255, 228, 73, 35),
        title: Row(
          children: [
            Text("LGD"),
            SizedBox(width: 50,),
            Image.asset("assets/photos/LGD_NEW_LOGO_BG_Removed.png", height: 80, fit: BoxFit.contain,)
          ],
        ),
      ),
      
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("LGD")),
            ListTile(leading: Icon(Icons.info), title: Text("Developer Info"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DeveloperInfoScreen()));
              
            },
            )

          ],
        ),
        
      ),
      body:
      _selectedIndex==0?
       Container(
        
        child: ListView(
          children: [
            SizedBox(height: 10,),

            Text("🔥 Welcome to LGD – Your Ultimate Gaming Destination! 🔥",style: TextStyle(fontSize: 20)),
            Text("🎮 Live Streaming & Gameplay of Free Fire, Call of Duty Mobile!"),
            SizedBox(height: 15),
            Text("Get updates:"),
            Text("📺 YouTube: youtube.com/@LGDTAJ"),
            Text("📘 Facebook: facebook.com/LGDTAJ"),
            Text("📺 📱 WhatsApp: +8801581515401"),

            

          ],
        ),
      )
      :_selectedIndex==1?
      TournamentScheduleScreen()
      
      :ProfileLogin(),



      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.schedule), label: "Tour Schedule"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
      ])
    
    );
  }


  
}