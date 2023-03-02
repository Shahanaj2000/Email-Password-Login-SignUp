import 'package:emailpswlogin/Screens/home_screen.dart';
import 'package:emailpswlogin/Screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //! Form key
  final _formkey = GlobalKey<FormState>();

  //! TextEditing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //: Firebase
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    //! Email Feild
    final emialFeild = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        //Reg expression for email validator
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return ("Please Enter a valid email");
        }
        return null;

      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        )
      ),
      
    );

    //! Pwd Feild
    final passwordFeild = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');

        if (value!.isEmpty) {
          return ("Password is required for login");
        }
         if(!regex.hasMatch(value)) {
          return ("Please enter valid password(Min. 6 character)");
         }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );

    //! LoginButton
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
         logIn(emailController.text, passwordController.text);
        },
        child: const Text(
          "LogIn",
           textAlign: TextAlign.center,
           style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
           ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    //Logo
                    SizedBox(
                      height: 200,
                      // child: Image.asset(
                      //   "/home/ubantu/emailpswlogin/assets/Foodlogo.png",
                      //   fit: BoxFit.contain,
                      // ),
                      child: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_snmohqxj/lottie_step2/data.json"),

                    ),
                    const SizedBox(height: 45,),
                    emialFeild,
                    const SizedBox(height: 25,),
                    passwordFeild,
                    const SizedBox(height: 35,),
                    loginButton,
                    const SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreeen()));
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,

                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
  //! LogIn Function
  void logIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) => {
        Fluttertoast.showToast(msg: "Login Successfully"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen())),
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}