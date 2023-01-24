import 'package:bloc/bloc.dart';
import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';
import 'package:ethaqapp/features/consulting_screen/data/models/consulting_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'consulting_state.dart';

class ConsultingCubit extends Cubit<ConsultingState> {
  ConsultingCubit() : super(ConsultingInitial());

  static ConsultingCubit get(BuildContext context) => BlocProvider.of(context);

  // variables
  ConsultingModel consultingModel = ConsultingModel();

  // functions
  Future<void> getConsultingData(BuildContext context , Map<String, dynamic> queryData) async {
    emit(SendCodeLoadingConsultingState());
    await DioHelper.getData(
      url: '${EndPoints.baseUrl}/client/consulting',
      query: queryData,
    ).then(
          (value) {
            consultingModel =
        ConsultingModel.fromJson(value.data);

        // handle after response ======>>>
        if (consultingModel.status == true) {
          debugPrint('otpCode: ${consultingModel.data}');
        } else {
          OtherHelper()
              .showTopFailToast(context, consultingModel.message ?? '');
        }
        emit(SendCodeSuccessConsultingState());
      },
    ).catchError(
          (onError) {
        debugPrint(onError.toString());
        emit(SendCodeErrorConsultingState());
      },
    );
  }
}
