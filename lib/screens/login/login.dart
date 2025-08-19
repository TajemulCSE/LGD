import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lgd/providers/auth_provider.dart'; 
import 'package:lgd/screens/sign_up/sign_up.dart';
import 'package:lgd/screens/dashboard/user_dashboard.dart';
import 'package:lgd/screens/dashboard/admin_dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LGD User Login"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 252, 144, 3),
              const Color.fromARGB(255, 255, 199, 95),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Consumer<AuthProvider>(
            builder: (context, auth, child) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/photos/LGD_NEW_LOGO_BG_Removed.png",
                    height: 200,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Enter your Email address",
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        
                        auth.isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  String? result = await auth.login(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );

                                  if (result == "user") {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => UserDashboard()),
                                    );
                                  } else if (result == "admin") {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AdminDashboard()),
                                    );
                                  } else if (result != null) {
                                    showSnackBar(result); // show error
                                  }
                                },
                                child: Text("Login"),
                              ),

                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Not a member? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignUp()),
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
