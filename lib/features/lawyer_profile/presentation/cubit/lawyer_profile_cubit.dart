import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/features/lawyer_profile/models/lawyers_profile_models.dart';
import 'package:ethaqapp/features/lawyer_profile/presentation/cubit/lawyser_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LawyerProfileCubit extends Cubit<LawyerProfileState> {
  LawyerProfileCubit() : super(LawyerProfileInitState());

  static LawyerProfileCubit get(BuildContext context) =>
      BlocProvider.of(context);
  LawyersProfileModels? lawyersProfileModels;
  Future<void> getProfileData(BuildContext context, num id) async {
    emit(LawyerProfileInitState());
    try {
      await DioHelper.getData(url: '/client/vendor/$id/profile').then((value) {
        //  List<dynamic> responceData = value.data;
        lawyersProfileModels = value.data['vendor']
            .map(
              (e) => LawyersProfileModels.fromJson(e),
            )
            .toList();
        debugPrint('ticket is ${lawyersProfileModels!.name}');
        emit(LawyerProfileGetDataSucessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(LawyerProfileGetDataErrorState());
        },
      );
      //  debugPrint('ticket is ${searchlawyersScreenModel![0]}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
