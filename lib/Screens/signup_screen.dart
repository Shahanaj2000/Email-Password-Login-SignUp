import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailpswlogin/Model/user_model.dart';
import 'package:emailpswlogin/Screens/home_screen.dart';
import 'package:emailpswlogin/Screens/login-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class SignUpScreeen extends StatefulWidget {
  const SignUpScreeen({super.key});

  @override
  State<SignUpScreeen> createState() => _SignUpScreeenState();
}

class _SignUpScreeenState extends State<SignUpScreeen> {
  //! Firebase auth
  final _auth = FirebaseAuth.instance;

  //! Form Key
  final _formkey = GlobalKey<FormState>();

  //! Text Editing Controller
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailConroller = TextEditingController();
  final passwordController = TextEditingController();
  final confromPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //! FirstNameFeild
    final firstNameFeild = TextFormField(
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex =  RegExp(r'^.{3,}$');

        if (value!.isEmpty) {
          return ("Firstname cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid name(Min. 3 character)");
        }
        return null; //If nothing found
      },
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'FirstName',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );

    //! SecondNameFeild
    final secondNameFeild = TextFormField(
      autofocus: false,
      controller: secondNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Secondname cannot be empty");
        }
        return null;
      },
      onSaved: (value) {
        secondNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'SecondName',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );

    //! EmailFeild
    final emailFeild = TextFormField(
      autofocus: false,
      controller: emailConroller,
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
        emailConroller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );

    //! Password Feild
    final passwordFeild = TextFormField(
      autofocus: false,
      controller: passwordController,
      //keyboardType: TextInputType.none,
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
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );

    //!ConfromPasswordFeild
    final confrompwdFeild = TextFormField(
      autofocus: false,
      controller: confromPasswordController,
      obscureText: true,
      //keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (confromPasswordController.text != passwordController.text) {
          return "Password does not match";
        }
        return null;
      },

      onSaved: (value) {
        confromPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Confrom Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );

    //! SignUp Button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailConroller.text, passwordController.text);
        },
        child: const Text(
          "SignIn",
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
                        height: 180,
                        // child: Image.asset(
                        //   "/home/ubantu/emailpswlogin/assets/Foodlogo.png",
                        //   fit: BoxFit.contain,
                        // ),
                        child: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_snmohqxj/lottie_step2/data.json"),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      firstNameFeild,

                      const SizedBox(
                        height: 20,
                      ),
                      secondNameFeild,

                      const SizedBox(
                        height: 20,
                      ),
                      emailFeild,

                      const SizedBox(
                        height: 20,
                      ),
                      passwordFeild,

                      const SizedBox(
                        height: 20,
                      ),
                      confrompwdFeild,

                      const SizedBox(
                        height: 35,
                      ),
                      signUpButton,
                      const SizedBox(
                        height: 15,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Already have an account ? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text(
                              "LogIn",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  //! SignIn Function
  //  void signUp(String email, String password) async {
  //   if (_formkey.currentState!.validate()) {
  //     await _auth.createUserWithEmailAndPassword(email: email, password: password)
  //     .then((value) => {
  //        postDetailsToFirestore(); 
  //     }).catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  //  }
      void signUp(String email, String password) async {
        if (_formkey.currentState!.validate()) {
          await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFirestore()
          }).catchError((e) {
            Fluttertoast.showToast(msg: e!.message);
          });
        }
      }

      postDetailsToFirestore() async {
        //Calling our FireStore
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        User? user = _auth.currentUser;

        //Calling our usermodel
        UserModel userModel = UserModel(uid: user?.uid, email: user!.email, firstName: firstNameController.text, secondName: secondNameController.text);
        await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
        Fluttertoast.showToast(msg: "Account created successfully :)");
        Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
        // UserModel(uid: user!.uid, email: user.email, firstName: firstNameController.text, secondName: secondNameController.text);

        //Writing all vlaues
        // userModel.email = user!.email;
        // userModel.uid = user.uid;
        // userModel.firstName = firstNameController.text;
        // userModel.secondName = secondNameController.text;
      }

}
