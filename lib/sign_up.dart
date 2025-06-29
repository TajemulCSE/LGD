import 'package:flutter/material.dart';
import 'package:lgd/login.dart';

class  SignUp extends StatelessWidget {
       SignUp({super.key});
String whatsapp="",squad="",email="",password="";
TextEditingController whatsappcontoller=TextEditingController();
TextEditingController squadcontoller=TextEditingController();
TextEditingController emailcontoller=TextEditingController();
TextEditingController passwordcontoller=TextEditingController();
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text("WhatsApp Number:"),
                SizedBox(width: 10,),
                
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter WhatsApp Number"
                  ),
                ))
        
              ],
            ),
            Row(
              children: [
                Text("Squad Name: "),
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your Squad Name"
                  ),
                  controller: squadcontoller,
                ))
              ],
            ),
             Row(
              children: [
                Text("Email: "),
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email"
                  ),
                  controller: emailcontoller,
                ))
              ],
            ),
            Row(
              children: [
                Text("Password: "),
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password"
                  ),
                  controller: passwordcontoller,
                ))
              ],
            ),
            Row(
              children: [
                Text("Confirm Password: "),
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your password again"
                  ),
                ))
              ],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Text("SingUp"))
              ],
            ),
            Row(
              children: [
                Flexible(child: Text("Already a member? ")),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child: Text("Login", style: TextStyle(color: Colors.blue),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  
}