import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/features/tickets_screen/presentation/cubit/new_ticket_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTicketCubit extends Cubit<NewTicketState> {
  NewTicketCubit() : super(NewTicketInitial());

  static NewTicketCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String phoneNumber = "";
  GlobalKey<FormState> newTicketFormKey = GlobalKey<FormState>();

  Future<void> newTicket(BuildContext context) async {
    debugPrint(typeController.text);
    emit(NewTicketLoadingState());
    try {
      await DioHelper.postData(
        endPoint: EndPoints.tickets,
        formDataIsEnabled: true,
        data: {
          'title': titleController.text,
          'type': typeController.text,
          'description': descController.text,
          'user_id': '3',
          'status': 'open',
        },
      ).then((value) {
        debugPrint(titleController.text);
        debugPrint('sucess');
        emit(NewTicketSuccessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(NewTicketErrorState());
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
