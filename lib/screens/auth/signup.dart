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

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  AuthController authController = Get.find<AuthController>();

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
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
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
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
                              Text("Sign in to continue")
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
                                //TODO: username text Field
                                CustomTextField(
                                  controller: usernameController,
                                  icon: Icons.person,
                                  HintText: "User Name",
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

                                // Spacing
                                const SizedBox(
                                  height: 20,
                                ),

                                // TODO: create Sign Up Button
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    fixedSize: const MaterialStatePropertyAll(
                                      Size(400, 50),
                                    ),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                      Colors.indigo,
                                    ),
                                    textStyle: const MaterialStatePropertyAll(
                                      TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  onPressed: () {
                                    authController.createAccount(
                                        emailController.text.trim(),
                                        passwordController.text.trim());
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
                                    style: TextStyle(color: Colors.white),
                                    text: "Already have an account ",
                                    children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = widget.onClickedSignUp,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          text: " Log in")
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
