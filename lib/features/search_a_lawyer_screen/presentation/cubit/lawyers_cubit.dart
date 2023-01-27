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
  List<LawyersModels>? searchlawyersScreenModel = [];

  Future<void> searchAboutVenders(BuildContext context) async {
    emit(SearchLawyersScreenInitState());
    try {
      await DioHelper.getData(
        url: EndPoints.searchAboutVender,
        query: {
          'name': nameControllers.text,
        },
      ).then((value) {
        // debugPrint('valus is ${value.data['vendors']}');
        //  List<dynamic> responceData = value.data;
        final List<dynamic> lawyersData = value.data["data"]["vendors"];
        debugPrint('value 1 is $lawyersData');

        for (final element in lawyersData) {
          searchlawyersScreenModel!.add(LawyersModels.fromJson(element));
        }

        // debugPrint('ticket is ${searchlawyersScreenModel![0].name}');
        emit(SearchLawyersScreengetDataSucessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(SearchLawyersScreengetDataerrorState());
        },
      );
      // debugPrint('ticket is ${searchlawyersScreenModel![0]}');
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
        final List<dynamic> lawyersData = value.data["data"]["vendors"];
        // debugPrint('value 1 is $lawyersData');

        for (final element in lawyersData) {
          searchlawyersScreenModel!.add(LawyersModels.fromJson(element));
        }
        // debugPrint('lawyers is ${searchlawyersScreenModel!.length}');
        emit(SearchLawyersScreengetDataSucessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(SearchLawyersScreengetDataerrorState());
        },
      );
      //  print('responce is $responce');
      //  debugPrint('ticket is ${searchlawyersScreenModel![0]}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
