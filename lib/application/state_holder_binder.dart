import 'package:ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:ecommerce/presentation/state_holders/otp_verification_controller.dart';
import 'package:get/get.dart';

import '../presentation/state_holders/main_bottom_nav_controller.dart';
class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
  }

}