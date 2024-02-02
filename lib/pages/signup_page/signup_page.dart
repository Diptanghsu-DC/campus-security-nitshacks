import 'package:campus_security_nithacks/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/utils.dart';
import '../pages.dart';

class SIgnUpPage extends StatefulWidget {
  const SIgnUpPage({super.key});

  static const String routeName = '/loginPage';

  @override
  State<SIgnUpPage> createState() => _SIgnUpPageState();
}

class _SIgnUpPageState extends State<SIgnUpPage> {
  bool isUserLogged = false;

  //password showing boolean
  bool isObscure = true;

  //form variables
  final _formKey = GlobalKey<FormState>();

  //controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  //function to validate form
  // void validate(BuildContext context) {
  //   var user;
  //   if (_formKey.currentState!.validate()) {
  //     showLoadingOverlay(
  //       context: context,
  //       asyncTask: () async {
  //         try {
  //           user = await UserController.login(
  //               email: emailController.text.toString(),
  //               password: passController.text.toString());
  //           isUserLogged = true;
  //         } catch (error) {
  //           // Failed login
  //           toastMessage(error.toString(), context);
  //         }
  //       },
  //       onCompleted: () {
  //         if (isUserLogged) {
  //           if (user != null) {
  //             if (UserController.currentUser!.isSeller) {
  //               Navigator.pushNamedAndRemoveUntil(
  //                   context, AdminMainPage.routeName, (route) => false);
  //             } else {
  //               Navigator.pushNamedAndRemoveUntil(
  //                 context,
  //                 MainPage.routeName,
  //                     (route) => false,
  //               );
  //             }
  //           }
  //         }
  //       },
  //     );
  //   } else {
  //     toastMessage("Please enter proper credentials", context);
  //   }
  // }

  //function to show or hide password
  void showPass() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //screen size
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    //constants
    double padding = 16.0;
    double lFontSize = 40.0;
    double gap = 30;
    double sFontSize = 16;
    Color fontColor = const Color.fromRGBO(151, 150, 161, 1);
    Color fontColor2 = const Color.fromRGBO(91, 91, 94, 1);
    Color lineColor = const Color.fromRGBO(179, 179, 179, 0.5);
    double sGap = 10;
    double fieldHeight = height * 0.1;
    double lGap = 70.0;
    double buttonHeight = 60;
    double buttonWidth = 248;
    Color buttonColor = const Color.fromRGBO(254, 114, 76, 1);
    double lineHeight = 2;
    double lineWidth = 100;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await showExitWarning(context);
        if (shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Builder(builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: lGap * 1.4,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: padding),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: lFontSize,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'SofiaPro'),
                              ),
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: padding),
                              child: Text(
                                "E-mail",
                                style: TextStyle(
                                    color: fontColor,
                                    fontSize: sFontSize,
                                    fontFamily: 'SofiaPro'),
                              ),
                            ),
                            SizedBox(
                              height: sGap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding, right: padding),
                              child: SizedBox(
                                  height: fieldHeight,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Your email or phone",
                                    ),
                                    controller: emailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "email or phone number cannot be empty";
                                      }
                                      return null;
                                    },
                                  )),
                            ),
                            SizedBox(
                              height: gap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: padding),
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    color: fontColor,
                                    fontSize: sFontSize,
                                    fontFamily: 'SofiaPro'),
                              ),
                            ),
                            SizedBox(
                              height: sGap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding, right: padding),
                              child: SizedBox(
                                  height: fieldHeight,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () => showPass(),
                                          icon: isObscure
                                              ? const Icon(
                                              Icons.visibility)
                                              : const Icon(
                                              Icons.visibility_off)),
                                      hintText: "Password",
                                    ),
                                    controller: passController,
                                    validator: (value) {
                                      // if (value!.isEmpty) {
                                      //   return "password cannot be empty";
                                      // }
                                      return null;
                                    },
                                    obscureText: isObscure ? true : false,
                                  )),
                            ),
                            SizedBox(
                              height: sGap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: padding),
                              child: Text(
                                "Confirm Password",
                                style: TextStyle(
                                    color: fontColor,
                                    fontSize: sFontSize,
                                    fontFamily: 'SofiaPro'),
                              ),
                            ),
                            SizedBox(
                              height: sGap,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: padding, right: padding),
                              child: SizedBox(
                                  height: fieldHeight,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () => showPass(),
                                          icon: isObscure
                                              ? const Icon(
                                              Icons.visibility)
                                              : const Icon(
                                              Icons.visibility_off)),
                                      hintText: "Confirm Password",
                                    ),
                                    controller: passController,
                                    validator: (value) {
                                      // if (value!.isEmpty) {
                                      //   return "password cannot be empty";
                                      // }
                                      return null;
                                    },
                                    obscureText: isObscure ? true : false,
                                  )),
                            ),
                            SizedBox(
                              height: lGap,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidth,
                          child: ElevatedButton(
                            onPressed: () {}, //validate(context),
                            child: const Text('SIGN UP'),
                          ),
                        ),
                        SizedBox(
                          height: sGap,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  color: fontColor2,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'SofiaPro'),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage(),
                                      ));
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: buttonColor,
                                      fontFamily: 'SofiaPro'),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: sGap,
                        ),
                        // Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     Container(
                        //       color: lineColor,
                        //       height: lineHeight,
                        //       width: lineWidth,
                        //     ),
                        //     Text(
                        //       "Sign in with",
                        //       style: TextStyle(
                        //           color: fontColor2,
                        //           fontWeight: FontWeight.w500,
                        //           fontFamily: 'SofiaPro'),
                        //     ),
                        //     Container(
                        //       color: lineColor,
                        //       height: lineHeight,
                        //       width: lineWidth,
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: sGap,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
