import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terence_app/controller/auth_controller.dart';
import 'package:terence_app/service/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List images = ["g.png", "t.png", "f.png"];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: w,
              height: 240,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/signup.png"),
                      fit: BoxFit.cover)),
              child: Column(children: const [
                SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/lalisa.jpg"),
                )
              ]),
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email,
                                color: Colors.deepOrangeAccent),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2))
                          ]),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password_outlined,
                                color: Colors.deepOrangeAccent),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(height: 20),
                  ]),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                AuthController.instance.register(emailController.text.trim(),
                    passwordController.text.trim());
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("assets/images/loginbtn.png"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account?",
                    style: TextStyle(fontSize: 20, color: Colors.grey[500]))),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "Sign up using on the following methods",
                style: TextStyle(color: Colors.grey[500], fontSize: 16),
              ),
            ),
            SizedBox(
              height: 50,
              child: Wrap(
                children: List<Widget>.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        print(12);
                        AuthService().signInWithGoogle();
                      } else if (index == 1) {
                        print(332);
                        // Handle tap event for second item
                      } else if (index == 2) {
                        print(12444);
                        // Handle tap event for third item
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[500],
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage("assets/images/" + images[index]),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ));
  }
}
