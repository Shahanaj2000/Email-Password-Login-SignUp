import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailpswlogin/Model/user_model.dart';
import 'package:emailpswlogin/Screens/login-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //To display the currentUser
  /*User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    
    super.initState();
    FirebaseFirestore.instance
    .collection("users")
    .doc(user!.uid)
    .get()
    .then((value) {
      this.loggedInUser  = UserModel.fromMap(value.data());
      setState(() {
        
      });
    });
  }*/
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
                      // child: Image.asset(
                      //   "/home/ubantu/emailpswlogin/assets/Foodlogo.png",
                      //   fit: BoxFit.contain,
                      // ),
                      child: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_snmohqxj/lottie_step2/data.json"),
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
                    ActionChip(label: Text("Logout"), onPressed: () {
                      logOut(context);
                    },)
            ],
          ),
        ),
      ),
    );
  }
  //! LogOut Button
  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

}