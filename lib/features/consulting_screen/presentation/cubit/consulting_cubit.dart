import 'package:bloc/bloc.dart';
import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';
import 'package:ethaqapp/features/consulting_screen/data/models/consulting_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'consulting_state.dart';

class ConsultingCubit extends Cubit<ConsultingState> {
  ConsultingCubit() : super(ConsultingInitial());

  static ConsultingCubit get(BuildContext context) => BlocProvider.of(context);

  // variables
  ConsultingModel pendingConsultingModel = ConsultingModel();
  ConsultingModel activeConsultingModel = ConsultingModel();
  ConsultingModel doneConsultingModel = ConsultingModel();
  ConsultingModel cancelConsultingModel = ConsultingModel();

  // functions
  Future<void> getAllData(BuildContext context) async{
    emit(LoadingConsultingState());
    pendingConsultingModel = await getConsultingData(context, {'status':'pending'});
    activeConsultingModel = await getConsultingData(context, {'status':'active'});
    doneConsultingModel = await getConsultingData(context, {'status':'done'});
    cancelConsultingModel = await getConsultingData(context, {'status':'cancel'});
    emit(SuccessConsultingState());
  }

  Future<ConsultingModel> getConsultingData(BuildContext context,
      Map<String, dynamic> queryData) async {
    ConsultingModel consultingModel = ConsultingModel();
    await DioHelper.getData(
      url: '${EndPoints.baseUrl}/client/consulting',
      query: queryData,
    ).then(
          (value) {
        consultingModel =
            ConsultingModel.fromJson(value.data);

        // handle after response ======>>>
        if (consultingModel.status == true) {
          debugPrint('${consultingModel.data}');
        } else {
          OtherHelper()
              .showTopFailToast(context, consultingModel.message ?? '');
        }

      },
    ).catchError(
          (onError) {
        debugPrint(onError.toString());
        emit(ErrorConsultingState());
      },
    );
    return consultingModel;
  }

}
