import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lgd/providers/user_provider.dart';
import 'package:lgd/screens/login/login.dart';
import 'package:lgd/screens/sign_up/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:lgd/providers/auth_provider.dart';


class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LGD Player Profile")),
      body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Consumer2<UserProvider,AuthenticationProvider>(
          builder: (BuildContext context, UserProvider user, auth, Widget? child) {
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    Text("Name: "),
                    Text(user.squadLeaderName),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.perm_identity),
                    Text("Email: "),
                    Text(user.email),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.games_rounded),
                    Text("Squad Name: "),
                    Text(user.squad),
                  ],
                ),
                auth.isLoggedIn? ElevatedButton(
                      onPressed: () async {
                        await user.clearUser();
                        await auth.logout();
                      },
                      child: Text("logout"),
                    )
                :ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text("Signup"),
                ),
                

                
                    !auth.isLoggedIn? ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text("Login"),
                )
                : Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Center(child: Text("You can now register for tournaments")),
                )
                    
              ],
            );
          },
        ),
      ),
    );
  }
}
