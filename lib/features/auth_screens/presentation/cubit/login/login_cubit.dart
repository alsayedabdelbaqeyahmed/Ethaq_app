import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/local/hive_reuse.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/core/utils/app_const.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';
import 'package:ethaqapp/features/auth_screens/data/models/send_login_sms_model.dart';
import 'package:ethaqapp/features/auth_screens/presentation/cubit/login/login_state.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/login/login_screen.dart';
import 'package:ethaqapp/features/main_screen/presentation/pages/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/components/reuse_functions.dart';
import '../../../../../core/utils/enums.dart';
import '../../../data/models/login_model.dart';
import '../../pages/verification_screen.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  // send login message ======>>>
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumber = "";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> sendLoginSms(BuildContext context) async {
    debugPrint(phoneNumberController.text);
    emit(SendCodeLoadingState());
    await DioHelper.postData(
      endPoint: EndPoints.login,
      formDataIsEnabled: true,
      data: {
        'mobile': phoneNumberController.text,
        'account_type': UserType.client.name,
      },
    ).then(
      (value) {
        final SendLoginSmsModel sendLoginSmsModel =
            SendLoginSmsModel.fromJson(value.data);

        // handle after response ======>>>
        if (sendLoginSmsModel.status == true) {
          debugPrint('otpCode: ${sendLoginSmsModel.data!.otp}');
          OtherHelper().showTopSuccessToast(context, "الكود هو ${sendLoginSmsModel.data!.otp}");
          navigateTo(
            context,
            VerificationCodeScreen(
              phoneNumber: phoneNumberController.text,
            ),
          );
        } else {
          OtherHelper()
              .showTopFailToast(context, sendLoginSmsModel.message ?? '');
        }
        emit(SendCodeSuccessState());
      },
    ).catchError(
      (onError) {
        debugPrint(onError.toString());
        emit(SendCodeErrorState());
      },
    );
  }

  // verify login sms ======>>>
  TextEditingController otpController = TextEditingController();

  Future<void> verifyLoginSms(BuildContext context, String phoneNumber) async {
    emit(VerifyLoadingState());
    await DioHelper.postData(
      endPoint: EndPoints.loginVerify,
      formDataIsEnabled: true,
      data: {
        'mobile': phoneNumber,
        'otp': otpController.text,
      },
    ).then(
      (value) {
        final LoginModel loginModel = LoginModel.fromJson(value.data);

        // handle after response ======>>>
        if (loginModel.status == true) {
          HiveReuse.mainBox.put(AppConst.tokenBox, loginModel.data!.token);
          HiveReuse.mainBox.put(AppConst.userIdBox, loginModel.data!.user!.id);
          navigateAndFinish(context, const MainScreen());
        } else {
          OtherHelper().showTopFailToast(context, loginModel.message ?? '');
        }
        emit(VerifySuccessState());
      },
    ).catchError(
      (onError) {
        emit(VerifyErrorState());
      },
    );
  }

  // logout ======>>>
  Future<void> logout(BuildContext context) async {
    HiveReuse.mainBox.delete(AppConst.tokenBox);
    HiveReuse.mainBox.delete(AppConst.userIdBox);
    navigateAndFinish(context, const LoginScreen());
  }
}
