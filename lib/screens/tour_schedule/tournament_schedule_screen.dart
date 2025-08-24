import 'package:flutter/material.dart';
import 'package:lgd/providers/auth_provider.dart';
import 'package:lgd/providers/tournament_provider.dart';
import 'package:provider/provider.dart';

class TournamentScheduleScreen extends StatelessWidget {
  const TournamentScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LGD Tournament Schedule")),

      body: ListView(
        children: [
          Consumer2<TournamentProvider, AuthenticationProvider>(
            builder: (context, tour, auth, child) {
              return ExpansionTile(
                title: Text("LGD 10 PM Tournament"),
                leading: Icon(Icons.sports_esports),
                onExpansionChanged: (Expanded) async {
                   await tour.fetch10pmTour();
                   await tour.showRoomID(context);
                },

                children: [
                  Text("Registered Team number: ${tour.registeredNumber}"),
                  Text("Tour name: ${tour.name}"),
                  ElevatedButton(
                    onPressed: () async {
                      if (!auth.isLoggedIn) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login to register a tour")),
                        );
                      }
                      if (auth.isLoggedIn) {
                        if (tour.registeredNumber > 11) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Max Team reached")),
                          );
                          return;
                        } else {
                          await tour.registerUser(context);
                          await tour.fetch10pmTour();
                           await tour.showRoomID(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Register succes")),
                          );
                        }
                      }
                    },
                    child: Text("Register"),
                  ),
                  tour.isRegistered?
                  ElevatedButton(onPressed: (){

                  }, child: Text("Room ID Pass"))
                  :
                  Text("You are not registered")
                ],
              );
            },
          ),

          ListTile(
            title: Text("LGD LEAUGE TOURNAMENT"),
            subtitle: Text("ID Pass 11 PM & Start 11:10PM"),
            leading: Icon(Icons.sports_esports),
            onTap: () {},
          ),

          ListTile(
            title: Text("LGD CS TOURNAMENT"),
            subtitle: Text("Not announced"),
            leading: Icon(Icons.sports_esports),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
