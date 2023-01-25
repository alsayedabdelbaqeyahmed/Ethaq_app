import 'package:bloc/bloc.dart';
import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/features/search_a_lawyer_screen/data/lawyers_models.dart';
import 'package:ethaqapp/features/search_a_lawyer_screen/presentation/cubit/lawyers_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchLawyersScreenCubit extends Cubit<SearchLawyersScreenState> {
  SearchLawyersScreenCubit() : super(SearchLawyersScreenInitState());
  static SearchLawyersScreenCubit get(BuildContext context) =>
      BlocProvider.of(context);
  TextEditingController nameControllers = TextEditingController();
  // get all lawyers data name and photo and id
  List<LawyersModels>? searchlawyersScreenModel;

  Future<void> searchAboutVenders(BuildContext context) async {
    emit(SearchLawyersScreenInitState());
    try {
      await DioHelper.getData(
        url: EndPoints.searchAboutVender,
        query: {
          'name': nameControllers.text,
        },
      ).then((value) {
        //  List<dynamic> responceData = value.data;
        searchlawyersScreenModel = value.data['vendors']
            .map(
              (e) => LawyersModels.fromJson(e),
            )
            .toList();
        debugPrint('ticket is ${searchlawyersScreenModel![0]}');
        emit(SearchLawyersScreengetDataSucessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(SearchLawyersScreengetDataerrorState());
        },
      );
      debugPrint('ticket is ${searchlawyersScreenModel![0]}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getAllVenders(BuildContext context) async {
    emit(SearchLawyersScreenInitState());
    try {
      await DioHelper.getData(
        url: EndPoints.searchAboutVender,
      ).then((value) {
        //  List<dynamic> responceData = value.data;
        searchlawyersScreenModel = value.data['vendors']
            .map(
              (e) => LawyersModels.fromJson(e),
            )
            .toList();
        debugPrint('ticket is ${searchlawyersScreenModel![0]}');
        emit(SearchLawyersScreengetDataSucessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(SearchLawyersScreengetDataerrorState());
        },
      );
      debugPrint('ticket is ${searchlawyersScreenModel![0]}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
