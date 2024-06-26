import 'package:crafty_bay/Presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/category_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/complete_profile_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/home_banner_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/read_profile_data.dart';
import 'package:crafty_bay/Presentation/state_holder/send_email_otp_controller.dart';
import 'package:crafty_bay/data/models/category_list_model.dart';
import 'package:get/get.dart';
import 'Presentation/state_holder/main_bottom_nav_controller.dart';
import 'Presentation/state_holder/verify_otp_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOtpController());
    Get.put(ReadProfileDataController());
    Get.put(AuthController());
    Get.put(CompleteProfileController());
    Get.put(HomeBannerController());
    Get.put(CategoryController());
  }

}