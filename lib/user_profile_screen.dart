import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        child: Consumer<UserProvider>(
          builder: (BuildContext context, UserProvider user, Widget? child) {
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text("Login"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Text("Signup"),
                ),

                Consumer<AuthenticationProvider>(
                  builder: (context, auth, child) {
                    return ElevatedButton(
                      onPressed: () async {
                        user.clearUser();
                        await auth.logout();
                      },
                      child: Text("logout"),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
