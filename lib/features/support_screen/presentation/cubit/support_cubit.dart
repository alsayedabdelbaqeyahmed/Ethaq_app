import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';

import 'package:ethaqapp/features/support_screen/presentation/cubit/support_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit() : super(SupportInitial());

  static SupportCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messegeController = TextEditingController();
  String phoneNumber = "";
  GlobalKey<FormState> supportFormKey = GlobalKey<FormState>();

  Future<void> contatctUs(BuildContext context) async {
    debugPrint(phoneNumberController.text);
    emit(SupportLoadingState());
    try {
      await DioHelper.postData(
        endPoint: EndPoints.contactUs,
        formDataIsEnabled: true,
        data: {
          'name': nameController.text,
          'phone': phoneNumberController.text,
          'email': emailController.text,
          'subject': subjectController.text,
          'message': messegeController.text,
          'created_at': DateTime.now()
        },
      ).then((value) {
        if (value.statusCode == 200 || value.data['status'] == true) {
          OtherHelper().showTopSuccessToast(
            context,
            "${value.data["message"]}",
          );
        } else {
          OtherHelper().showTopSuccessToast(
            context,
            "${value.data["message"]}",
          );
        }
        emit(SupportSuccessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(SupportErrorState());
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
