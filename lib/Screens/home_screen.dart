import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                      height: 150,
                      child: Image.asset(
                        "/home/ubantu/emailpswlogin/assets/Foodlogo.png",
                        fit: BoxFit.contain,
                      ),
                    ),

                    SizedBox(height: 10,),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    SizedBox(height: 10,),
                    Text(
                      "Name",
                      style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w500),
                    ),

                    SizedBox(height: 15,),
                    ActionChip(label: Text("Logout"), onPressed: () {},)
            ],
          ),
        ),
      ),
    );
  }
}