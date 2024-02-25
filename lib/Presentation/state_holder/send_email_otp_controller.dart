import 'package:crafty_bay/data/Utility/urls.dart';
import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController {
  bool _inProgress = false;

  String _errorMessage='';
  String get errorMessage=> _errorMessage;

  bool get inProgress => _inProgress;

  Future<bool> sendOtpToEmail(String email) async {
    _inProgress = true;
    update();
    final ResponseData response =
        await NetworkCaller().getRequest(Urls.sendEmailOtp(email));
    _inProgress=false;
    if(response.isSuccess){
      update();
      return true;

    }else{
      _errorMessage=response.errorMessage;
      update();
      return false;
    }
  }
}
