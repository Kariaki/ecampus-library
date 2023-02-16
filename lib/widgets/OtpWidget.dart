// import 'package:ecampus/Data/Controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({Key? key}) : super(key: key);

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final controller = TextEditingController();
  final focusNode = FocusNode();


  // AuthController authController = Get.find<AuthController>();

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1),),
    borderRadius: BorderRadius.circular(8),
    ),
    );

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Color.fromRGBO(137, 146, 168, 1),
          borderRadius: BorderRadius.circular(8)
        ),
      ),
    );

    return Pinput(
      length: 6,
      controller: controller,
      focusNode: focusNode,
      onCompleted: (String otpNumber){
        // authController.verifyOtp(otpNumber);
      },
      defaultPinTheme:  defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0,1),
              blurRadius: 10,
            ),
          ],
        ),
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0,3),
                blurRadius: 16,
              ),
            ],
        ),
      ),
      separator: SizedBox(width: 16,),
      showCursor: true,
      cursor: cursor,
    );
  }
}

