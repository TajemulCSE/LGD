import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DeveloperInfoScreen extends StatelessWidget {
  const DeveloperInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer Info"),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber,
        ),
        
        child: ListView(
          children: [
            // Image.network("https://tajemulcse.github.io/images/about-me.png"),
            
            CachedNetworkImage(imageUrl:"https://tajemulcse.github.io/images/about-me.png",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error), 
             ),
            
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