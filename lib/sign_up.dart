import 'package:flutter/material.dart';

class  SignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
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
              ))
            ],
          ),
          Row(
            children: [
              Text("Password: "),
              SizedBox(width: 10,),
              Expanded(child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your Squad Name"
                ),
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
          )
        ],
      ),
    );
  }
  
}