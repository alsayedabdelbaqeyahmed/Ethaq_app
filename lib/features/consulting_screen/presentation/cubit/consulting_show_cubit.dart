import 'package:bloc/bloc.dart';
import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';
import 'package:ethaqapp/features/consulting_screen/data/models/consulting_show_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'consulting_show_state.dart';

class ConsultingShowCubit extends Cubit<ConsultingShowState> {
  ConsultingShowCubit() : super(ConsultingShowInitial());

  static ConsultingShowCubit get(BuildContext context) => BlocProvider.of(context);

  // variables
  ConsultingShowModel consultingShowModel = ConsultingShowModel();

  // functions
  Future<void> getConsultingData(BuildContext context,
      String id) async {
    emit(LoadingConsultingShowState());
    await DioHelper.getData(
      url: '${EndPoints.baseUrl}/client/consulting/$id',
      query: {},
    ).then(
          (value) {
            consultingShowModel =
                ConsultingShowModel.fromJson(value.data);

        // handle after response ======>>>
        if (consultingShowModel.status == true) {
          debugPrint('${consultingShowModel.data}');
        } else {
          OtherHelper()
              .showTopFailToast(context, consultingShowModel.message ?? '');
        }
        emit(SuccessConsultingShowState());
      },
    ).catchError(
          (onError) {
        debugPrint(onError.toString());
        emit(ErrorConsultingShowState());
      },
    );
  }
}
