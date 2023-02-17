import 'dart:developer';

import 'package:ecampus_library/data/controllers/auth_controller.dart';
import 'package:ecampus_library/widgets/Custom_TextField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  final Function() onClickedSignUp;

  const LoginScreen({Key? key, required this.onClickedSignUp})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  AuthController authController = Get.find<AuthController>();

  login() async {
    authController.isLoading(true);

    try {
      if (emailController.text == "" || passwordController.text == "") {
        Get.snackbar(
          "Warning",
          "All fields are required",
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.indigo,
          colorText: Colors.white,
        );
      }
      await authController.login(
          emailController.text.trim(), passwordController.text.trim());
    } catch (err) {
      log('Caught an error $err');
      Get.snackbar(
        "Ooops",
        err.toString(),
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.indigo,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width;

    return isMobile > 600
        ? Scaffold(
            body: authController.isLoading.value
                ? Container(
                    height: Get.height,
                    width: Get.width,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Row(
                    children: [
                      Container(
                        height: Get.height,
                        width: Get.width * 0.4,
                        color: Colors.white,
                        child: LayoutBuilder(
                          builder: (context, constraint) {
                            return Form(
                              child: SingleChildScrollView(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minHeight: constraint.maxHeight),
                                  child: IntrinsicHeight(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 40),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Spacer(),
                                          const Text(
                                            "Welcome Back",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Spacing
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            "Log in to continue",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          // Spacing
                                          const SizedBox(
                                            height: 25,
                                          ),

                                          // Form
                                          Container(
                                            child: Column(
                                              children: [
                                                CustomTextField(
                                                  controller: emailController,
                                                  icon: Icons.mail,
                                                  HintText: "Email@gmail.com",
                                                  color: Colors.indigo,
                                                  obscure: false,
                                                  type: TextInputType
                                                      .emailAddress,
                                                ),

                                                // Spacing
                                                const SizedBox(
                                                  height: 25,
                                                ),

                                                // Password
                                                CustomTextField(
                                                  controller:
                                                      passwordController,
                                                  icon: Icons.lock,
                                                  HintText: "Enter Password",
                                                  color: Colors.indigo,
                                                  obscure: true,
                                                  type: TextInputType
                                                      .visiblePassword,
                                                ),

                                                // Spacing
                                                const SizedBox(
                                                  height: 20,
                                                ),

                                                // Forgot password
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: GestureDetector(
                                                      onTap: () {},
                                                      child: const Text(
                                                        "Forgot Password?",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )),
                                                ),

                                                // Spacing
                                                const SizedBox(
                                                  height: 20,
                                                ),

                                                Obx(
                                                  () => authController
                                                          .isLoading.value
                                                      ? const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        )
                                                      : ElevatedButton(
                                                          style: ButtonStyle(
                                                            shape:
                                                                MaterialStatePropertyAll(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                            fixedSize:
                                                                const MaterialStatePropertyAll(
                                                              Size(400, 50),
                                                            ),
                                                            backgroundColor:
                                                                const MaterialStatePropertyAll(
                                                              Colors.indigo,
                                                            ),
                                                            textStyle:
                                                                const MaterialStatePropertyAll(
                                                              TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 24),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            login();
                                                          },
                                                          child: const Text(
                                                            "Login",
                                                          ),
                                                        ),
                                                ),

                                                // Spacing
                                                const SizedBox(
                                                  height: 30,
                                                ),

                                                // don't have an account
                                                Text.rich(
                                                  TextSpan(
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                    text:
                                                        "Don't have an account ",
                                                    children: [
                                                      TextSpan(
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = widget
                                                                  .onClickedSignUp,
                                                        text: " Sign Up",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: Get.height,
                        width: Get.width * 0.6,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/Dark_background.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
          )
        : Scaffold(
            body: Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/Dark_background.png"),
                fit: BoxFit.cover,
              )),
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return Form(
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 300,
                                width: double.infinity,
                                child: Column(
                                  children: const [
                                    Text("Welcome Back"),
                                    Text("Sign up to continue")
                                  ],
                                ),
                              ),

                              const Spacer(),

                              // Form
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 40),
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        controller: emailController,
                                        icon: Icons.mail,
                                        HintText: "Email@gmail.com",
                                        color: Colors.indigo,
                                        obscure: false,
                                        type: TextInputType.emailAddress,
                                      ),

                                      // Spacing
                                      const SizedBox(
                                        height: 25,
                                      ),

                                      // Password
                                      CustomTextField(
                                        controller: passwordController,
                                        icon: Icons.lock,
                                        HintText: "Enter Password",
                                        color: Colors.indigo,
                                        obscure: true,
                                        type: TextInputType.visiblePassword,
                                      ),

                                      // Spacing
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      // Forgot password
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: GestureDetector(
                                            onTap: () {},
                                            child: const Text(
                                              "Forgot Password?",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            )),
                                      ),

                                      // Spacing
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      Obx(
                                        () => authController.isLoading.value
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ElevatedButton(
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  fixedSize:
                                                      const MaterialStatePropertyAll(
                                                    Size(400, 50),
                                                  ),
                                                  backgroundColor:
                                                      const MaterialStatePropertyAll(
                                                    Colors.indigo,
                                                  ),
                                                  textStyle:
                                                      const MaterialStatePropertyAll(
                                                    TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  login();
                                                },
                                                child: const Text(
                                                  "Sign In",
                                                ),
                                              ),
                                      ),

                                      // Spacing
                                      const SizedBox(
                                        height: 30,
                                      ),

                                      // don't have an account
                                      Text.rich(
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          text: "Don't have an account ",
                                          children: [
                                            TextSpan(
                                              recognizer: TapGestureRecognizer()
                                                ..onTap =
                                                    widget.onClickedSignUp,
                                              text: " Sign Up",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
