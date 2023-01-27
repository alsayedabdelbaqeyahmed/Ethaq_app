import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/features/lawyer_profile/models/lawyers_profile_models.dart';
import 'package:ethaqapp/features/lawyer_profile/presentation/cubit/lawyser_profile_state.dart';
import 'package:ethaqapp/features/search_a_lawyer_screen/data/lawyers_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LawyerProfileCubit extends Cubit<LawyerProfileState> {
  LawyerProfileCubit() : super(LawyerProfileInitState());

  static LawyerProfileCubit get(BuildContext context) =>
      BlocProvider.of(context);
  LawyersProfileModels? lawyersProfileModels;
  Qualification? qualification;
  Specialty? specialty;
  LatestConsultingRequests? latestConsultingRequests;

  Future<void> getProfileData(BuildContext context, num id) async {
    emit(LawyerProfileInitState());
    try {
      await DioHelper.getData(url: '/client/vendor/${id.toString()}/profile')
          .then((value) {
        //  debugPrint('data is ${value.data["data"]['vendor']}');

        lawyersProfileModels =
            LawyersProfileModels.fromJson(value.data["data"]['vendor']);

        // qualification = Qualification.formJson(
        //   value.data["data"]['vendor']["qualification"],
        // );

        // latestConsultingRequests = LatestConsultingRequests.fromJson(
        //   value.data["data"]['vendor']["LatestConsultingRequests"],
        // );

        // specialty = Specialty.formJson(
        //   value.data["data"]['vendor']["specialty"],
        // );

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
