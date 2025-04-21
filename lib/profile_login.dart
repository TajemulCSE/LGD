import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ProfileLogin extends StatelessWidget {
  const ProfileLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LGD Player Profile"),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ) ,
        child: ListView(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("Login"))
            ,
            CachedNetworkImage(imageUrl:"https://tajemulcse.github.io/images/about-me.png",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            scale: 5, 
             ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified_rounded),Text("Name: Md. Tajemul Islam")
                
              ],
            

            ),
            SizedBox(height: 10,),
            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified_rounded),Text("Game ID: LGD_S_TAJ")
                
              ],

            ),
                        SizedBox(height: 10,),
            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified_rounded),Text("Squad Name: LGD SYSTEM")
                
              ],

            )
          ],
        ),
        
        
      ),
    );
  }
  
}