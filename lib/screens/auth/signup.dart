import 'package:ecampus_library/constants/constants.dart';
import 'package:ecampus_library/data/controllers/auth_controller.dart';
import 'package:ecampus_library/widgets/Custom_TextField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  final Function() onClickedSignUp;

  const SignUpScreen({Key? key, required this.onClickedSignUp})
      : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '';
  String email = '';
  String password = '';
  String? passwordError;
  bool enabled = false;

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  AuthController authController = Get.find<AuthController>();

  signup() async {
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
      await authController.createAccount(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } catch (err) {
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
            backgroundColor: Colors.indigo,
            body: Obx(
              () => authController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      children: [
                        Container(
                          height: Get.height,
                          width: Get.width / 2.5,
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
                                            horizontal: 18, vertical: 40),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Spacer(),
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
                                              "Sign up to continue",
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
                                                  //TODO: username text Field
                                                  CustomTextField(
                                                    controller: phoneController,
                                                    icon: Icons.person,
                                                    HintText:
                                                        "Enter Phone Number ",
                                                    color: Colors.indigo,
                                                    obscure: false,
                                                    type: TextInputType.text,
                                                  ),

                                                  // Spacing
                                                  const SizedBox(
                                                    height: 25,
                                                  ),

                                                  // TODO: email text field
                                                  CustomTextField(
                                                    icon: Icons.mail,
                                                    HintText: "Email@gmail.com",
                                                    color: Colors.indigo,
                                                    controller: emailController,
                                                    obscure: false,
                                                    type: TextInputType
                                                        .emailAddress,
                                                  ),

                                                  // Spacing
                                                  const SizedBox(
                                                    height: 25,
                                                  ),

                                                  // TODO: Password text field
                                                  CustomTextField(
                                                    icon: Icons.lock,
                                                    HintText: "Enter Password",
                                                    color: Colors.indigo,
                                                    obscure: true,
                                                    type: TextInputType
                                                        .visiblePassword,
                                                    controller:
                                                        passwordController,
                                                  ),

                                                  // Spacing
                                                  const SizedBox(
                                                    height: 20,
                                                  ),

                                                  // Spacing
                                                  const SizedBox(
                                                    height: 20,
                                                  ),

                                                  // TODO: create Sign Up Button
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      shape:
                                                          MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
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
                                                      authController
                                                          .isLoading(true);
                                                      authController
                                                          .createAccount(
                                                        emailController.text
                                                            .trim(),
                                                        passwordController.text
                                                            .trim(),
                                                      );
                                                    },
                                                    child: const Text(
                                                      "Sign Up",
                                                    ),
                                                  ),

                                                  // Spacing
                                                  const SizedBox(
                                                    height: 30,
                                                  ),

                                                  // don't have an account
                                                  Text.rich(
                                                    TextSpan(
                                                      style: AppConstants()
                                                          .h2Style,
                                                      text:
                                                          "Already have an account ",
                                                      children: [
                                                        TextSpan(
                                                            recognizer:
                                                                TapGestureRecognizer()
                                                                  ..onTap = widget
                                                                      .onClickedSignUp,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            text: " Log in")
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
                        Container(),
                      ],
                    ),
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
                            const Spacer(),

                            // Form
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // TODO: email text field
                                  CustomTextField(
                                    icon: Icons.phone,
                                    HintText: "Enter Phone Number",
                                    color: Colors.indigo,
                                    controller: emailController,
                                    obscure: false,
                                    type: TextInputType.emailAddress,
                                  ),

                                  // Spacing
                                  const SizedBox(
                                    height: 25,
                                  ),

                                  CustomTextField(
                                    icon: Icons.mail,
                                    HintText: "Enter Email",
                                    color: Colors.indigo,
                                    controller: emailController,
                                    obscure: false,
                                    type: TextInputType.emailAddress,
                                  ),

                                  // Spacing
                                  const SizedBox(
                                    height: 25,
                                  ),

                                  // TODO: Password text field
                                  CustomTextField(
                                    icon: Icons.lock,
                                    HintText: "Enter Password",
                                    color: Colors.indigo,
                                    obscure: true,
                                    type: TextInputType.visiblePassword,
                                    controller: passwordController,
                                  ),

                                  // Spacing
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  const Text.rich(
                                    TextSpan(
                                      style: TextStyle(color: Colors.white),
                                      text: "I Agree To",
                                      children: [
                                        TextSpan(text: " Terms"),
                                        TextSpan(text: " and"),
                                        TextSpan(text: " Conditions"),
                                      ],
                                    ),
                                  ),

                                  // Spacing
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // TODO: create Sign Up Button
                                  Obx(
                                    () => authController.isLoading.value
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : ElevatedButton(
                                            style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24),
                                              ),
                                            ),
                                            onPressed: () {
                                              signup();
                                            },
                                            child: const Text(
                                              "Sign Up",
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                      text: "Already have an account ",
                                      children: [
                                        TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = widget.onClickedSignUp,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            text: " Log in")
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
                );
              },
            ),
          ));
  }
}
