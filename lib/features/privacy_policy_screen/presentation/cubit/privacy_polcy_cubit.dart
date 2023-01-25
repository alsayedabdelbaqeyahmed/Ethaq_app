import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/features/privacy_policy_screen/data/privecy_model.dart';
import 'package:ethaqapp/features/privacy_policy_screen/presentation/cubit/privacy_polcy_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivecyPolicyCubit extends Cubit<PrivecyPolicyState> {
  PrivecyPolicyCubit() : super(PrivecyPolicyInitial());

  static PrivecyPolicyCubit get(BuildContext context) =>
      BlocProvider.of(context);
  PrivecyPolicyModel? privecyPolicyModel;

  Future<void> privecyPolicy(BuildContext context) async {
    // debugPrint(typeController.text);
    emit(PrivecyPolicyLoadingState());
    try {
      await DioHelper.getData(url: EndPoints.privecyPolcy).then((value) {
        PrivecyPolicyModel.fromJson(value);
        // debugPrint(titleController.text);
        debugPrint('sucess');
        emit(PrivecyPolicySuccessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(PrivecyPolicyErrorState());
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
