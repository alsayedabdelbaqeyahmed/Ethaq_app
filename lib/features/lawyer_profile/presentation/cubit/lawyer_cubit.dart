import 'package:bloc/bloc.dart';
import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/features/lawyer_profile/presentation/cubit/lawyer_state.dart';
import 'package:ethaqapp/features/support_screen/presentation/cubit/support_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LawyerCubit extends Cubit<LawyerState> {
  LawyerCubit() : super(LawyerInitial());
  static LawyerCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messegeController = TextEditingController();
  String phoneNumber = "";
  GlobalKey<FormState> supportFormKey = GlobalKey<FormState>();

  Future<void> gatLawyerProfile(BuildContext context) async {
    debugPrint(phoneNumberController.text);
    emit(LawyerInitial());
    try {
      await DioHelper.getData(url: EndPoints.lawyerProfile).then((value) {
        debugPrint(phoneNumberController.text);
        debugPrint('sucess');
        emit(LawyerSuccessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(LawyerErrorState());
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
