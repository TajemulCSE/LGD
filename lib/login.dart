import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  const Login({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: Text("LGD Login"),backgroundColor: Colors.red,
        ),
        body: 
            Column(
              children: [
                Row(
                  children: [
                    Text("Email:")
                    ,
                    SizedBox(
                      width: 10,
                    ),
                  Expanded(child: TextField(
                    decoration: InputDecoration(hintText: "Enter your Email address here "),
                  ))
                  ],
                
                ),
                Row(
                  children: [
                    Text("Password:"),
                    SizedBox(width: 10,),
                    Expanded(child: TextField(
                      decoration: InputDecoration(hintText: "Enter Password"),
                    ))
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed:(){}, child: Text("Login"))
                  ],
                  
                )
                
              ],
            )
          
        
    );
  
}
}