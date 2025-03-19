import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lgd/developer_info_screen.dart';
import 'package:lgd/profile_login.dart';

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
      appBar: AppBar( backgroundColor: const Color.fromARGB(255, 248, 70, 70),
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
        color: const Color.fromARGB(255, 255, 115, 90),
        child: ListView(
          children: [
            Text("Welcome to LGD")
          ],
        ),
      ):
      ProfileLogin(),



      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
      ])
    
    );
  }


  
}