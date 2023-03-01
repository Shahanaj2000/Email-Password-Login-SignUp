import 'package:emailpswlogin/Screens/login-screen.dart';
import 'package:flutter/material.dart';

class SignUpScreeen extends StatefulWidget {
  const SignUpScreeen({super.key});

  @override
  State<SignUpScreeen> createState() => _SignUpScreeenState();
}

class _SignUpScreeenState extends State<SignUpScreeen> {
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
      //validator: () {},
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
      //validator: () {},
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
      //validator: () {},
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
      //validator: () {},
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
      //validator: () {},
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
        onPressed: () {},
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
                      child: Image.asset(
                        "/home/ubantu/emailpswlogin/assets/Foodlogo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 45,),
                    firstNameFeild,

                    const SizedBox(height: 20,),
                    secondNameFeild,

                    const SizedBox(height: 20,),
                    emailFeild,

                    const SizedBox(height: 20,),
                    passwordFeild,

                    const SizedBox(height: 20,),
                    confrompwdFeild,

                    const SizedBox(height: 35,),
                    signUpButton,
                    const SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Already have an account ? "),
                        GestureDetector(
                          onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            "LogIn",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
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
}
