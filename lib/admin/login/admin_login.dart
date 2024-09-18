

import 'package:flutter/material.dart';

import '../view/admin.view.dart';




class AdminLoginPage extends StatefulWidget {
  @override
  State<AdminLoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<AdminLoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  bool a = true;
  var c = Icons.visibility_off;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  // const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //         Positioned(
        //           top: 0,
        //           left: 0,
        //           right: 0,
        //           child: Image.asset(
        //             "assets/images/plant.jpg", // Background
        //             fit: BoxFit.cover,
        //           ),
        //
        // ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // First widget (fixed background image)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/plant.jpg", // Background
                  fit: BoxFit.cover,
                ),
              ),
              // Second widget (fixed background image)
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                bottom: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    "assets/images/sub.png", // Background
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Rest of the content within the Stack
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 100)),
                    Container(
                      child: Column(
                        children: [
                          const Text(
                            "\n Login To\n Admin Account",
                            style: TextStyle(
                              color: Color(0xFF3E6652),
                              fontSize: 48,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 4),
                      child: const Text(
                        "Login to Admin account",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: 343,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xffc9e3d5),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: usernamecontroller,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3F6652),
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 28,
                                right: 16), // Adjust content padding as needed
                            prefixIconConstraints: BoxConstraints(
                              minWidth:
                              0, // Set the minimum width to 0 to align with the start of the TextFormField
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  right:
                                  10), // Adjust right padding for space between icon and text
                              child: Icon(
                                Icons.email, // Replace with the shield icon you have available
                                color: Color(0xff3F6652),
                              ),
                            ),

                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: 343,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xffc8e3d4),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: passwordcontroller,
                          obscureText: a, // To hide the password
                          decoration:  InputDecoration(
                            prefixIcon: Icon(Icons.lock,color: Color(0xff3F6652),),
                            suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    a = !a;
                                    c = a == false ? Icons.visibility : Icons.visibility_off;
                                  });
                                },
                                // onDoubleTap: () {
                                //   setState(() {
                                //     a = !a;
                                //     c = Icons.visibility_off;
                                //   });
                                // },
                                child: Icon(c)),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3F6652),
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 28,
                                right: 16), // Adjust content padding as needed
                            prefixIconConstraints: BoxConstraints(
                              minWidth:
                              0, // Set the minimum width to 0 to align with the start of the TextFormField
                            ),
                            // prefixIcon: Padding(
                            //   padding: EdgeInsets.only(
                            //       right:
                            //       10), // Adjust right padding for space between icon and text
                            //   child: Icon(
                            //     Icons.lock, // Replace with the shield icon you have available
                            //     color: Color(0xff3F6652),
                            //   ),
                            // ),

                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 6),
                      alignment: const Alignment(0.2, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.check_circle, // Replace with your desired check icon
                            size: 13,
                            color: Color(0xff3f6652),
                          ),
                          SizedBox(width: 6), // Adjust the space between icon and text
                          Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff93A99E),
                            ),
                          ),
                          SizedBox(width:140,),
                          Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3F6652),
                            ),
                          ),
                        ],
                      ),
                    ),


                    Container(
                      margin: const EdgeInsets.only(top: 75),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(310, 48),
                            backgroundColor: const Color(0xff3f6652),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                          onPressed: () async{
                            setState(() {
                              print(usernamecontroller.text);
                              print(passwordcontroller.text);
                              if (usernamecontroller.text == 'Devid' &&
                                  passwordcontroller.text == '123456' ||usernamecontroller.text == 'ak47' && passwordcontroller.text == '1234') {

                                Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) =>
                                        AdminView()
                                ),
                                );
                                // usernamecontroller.clear();
                                // passwordcontroller.clear();
                              }
                              else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Invalid User Credentials')),
                                );
                              }
                            });

                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),

                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}




