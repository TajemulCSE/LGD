import 'package:flutter/material.dart';

class DeveloperInfoScreen extends StatelessWidget {
  const DeveloperInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer Info"),
      ),
      body: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            Image.network("https://tajemulcse.github.io/images/about-me.png"),
            
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                SizedBox(width: 10,),
                Text("Md Tajemul Islam")
              ],
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email),
                SizedBox(width: 10,),
                Text("Email: tajemulislamgames@gmail.com")
              ], 
              
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10,),
                Text("Phone: 01737571215")
              ], 
              
            )            
          ],
        ) ,
      ),
    );
  }
  
}