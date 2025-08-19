import 'package:flutter/material.dart';

class TournamentScheduleScreen extends StatelessWidget {
  const TournamentScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title:  Text("LGD Tournament Schedule"),
    ),

    body: ListView(
      children: [
        ListTile(title: Text("LGD 10 PM Tournament"),subtitle: Text("ID Pass 10 PM & Start 10:10PM"),leading: Icon(Icons.sports_esports),onTap: (){},),        
        ListTile(title: Text("LGD LEAUGE TOURNAMENT"),subtitle: Text("ID Pass 11 PM & Start 11:10PM"),leading: Icon(Icons.sports_esports),onTap: (){},),

        ListTile(title: Text("LGD CS TOURNAMENT"),subtitle: Text("Not announced"),leading: Icon(Icons.sports_esports),onTap: (){},),
        
      ],
    ),


   );
  }
}