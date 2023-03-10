// ignore_for_file: avoid_print, unnecessary_parenthesis, unnecessary_null_comparison

import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';
import 'package:ethaqapp/features/my_profile/data/models/my_profile_model.dart';
import 'package:ethaqapp/features/tickets_screen/dara/commets_models.dart';

import 'package:ethaqapp/features/tickets_screen/dara/tickets_model.dart';
import 'package:ethaqapp/features/tickets_screen/presentation/cubit/new_ticket_state.dart';
import 'package:ethaqapp/features/tickets_screen/presentation/pages/tickets_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTicketCubit extends Cubit<NewTicketState> {
  NewTicketCubit() : super(NewTicketInitial());

  static NewTicketCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController ticketIdController = TextEditingController();
  TextEditingController comment = TextEditingController();

  GlobalKey<FormState> newTicketFormKey = GlobalKey<FormState>();
  List<TicketModel>? ticketData = [];
  List<CommentsModel>? commentModels = [];
  MyProfileModel? myProfileModel;

// add new tickets
  Future<void> newTicket(BuildContext context) async {
    debugPrint(typeController.text);
    emit(NewTicketLoadingState());
    try {
      await getUserId(context)!.then((value) async {
        print('user_id ${value.dataMyProfile!.userMyProfile!.id}');
        await DioHelper.postData(
          endPoint: EndPoints.tickets,
          formDataIsEnabled: true,
          data: {
            'id': ticketData!.isEmpty || ticketData == null
                ? 1
                : (ticketData!.last.id! + 1),
            'title': titleController.text,
            'type': typeController.text,
            'description': descController.text,
            'user_id': value.dataMyProfile!.userMyProfile!.id,
            'status': 'open',
            'created_at': DateTime.now().toString(),
          },
        ).then((value) {
          // send a notifiy to user with status of add messgege
          if (value.statusCode == 200 || value.data["code"] == 200) {
            OtherHelper().showTopSuccessToast(
              context,
              "${value.data["message"]}",
            );
            navigateTo(
              context,
              const TicketsScreen(),
            );
          } else {
            OtherHelper().showTopSuccessToast(
              context,
              "${value.data["message"]}",
            );
          }

          debugPrint(titleController.text);
          debugPrint('sucess');
          emit(NewTicketSuccessState());
        }).catchError(
          (onError) {
            debugPrint(onError.toString());
            emit(NewTicketErrorState());
          },
        );
      });
    } catch (e) {
      debugPrint('add ticket error is ${e.toString()}');
    }
  }

// get the user id
  Future<MyProfileModel>? getUserId(BuildContext context) async {
    //emit(MyProfileLoadingState());
    try {
      await DioHelper.getData(
        url: EndPoints.getMyProfile,
      ).then(
        (value) {
          myProfileModel = MyProfileModel.fromJson(value.data);
          if (myProfileModel!.status == false) {
            OtherHelper()
                .showTopInfoToast(context, myProfileModel!.message ?? '');
          } else {
            //  setUserData();
          }

          // emit(MyProfileSuccessState());
        },
      ).catchError(
        (error) {
          debugPrint('id error is ${error.toString()}');
          // throw(error);

          //  emit(MyProfileErrorState());
        },
      );
      return myProfileModel!;
    } catch (e) {
      throw (e.toString());
    }
  }

// get all ticket
  Future<void> getAllTicket(BuildContext context) async {
    debugPrint(typeController.text);
    emit(NewTicketLoadingState());
    try {
      await DioHelper.getData(url: EndPoints.tickets).then((value) {
        final List<dynamic> ticketsData = value.data["data"];
        print(ticketsData);
        for (final element in ticketsData) {
          ticketData!.add(TicketModel.fromJson(element));
        }
        print('ticket is ${ticketData![0].title}');
        emit(NewTicketSuccessState());
      }).catchError(
        (onError) {
          debugPrint(onError.toString());
          emit(NewTicketErrorState());
        },
      );
      print('ticket is ${ticketData![0]}');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // add comment with the ticket screen
  Future<void> addComment(BuildContext context, num ticetID) async {
    debugPrint(typeController.text);
    emit(NewTicketLoadingState());
    try {
      await getUserId(context)!.then((value) async {
        await DioHelper.postData(
          endPoint: EndPoints.storeComment,
          formDataIsEnabled: true,
          data: {
            'id':
                ticetID == null || ticetID == 0 ? 1 : ticetID + 1, //comment id
            'ticket_id': ticetID,
            'user_id': value.dataMyProfile!.userMyProfile!.id,
            'comment': comment.text,
            'created_at': DateTime.now(),
            'updated_at': DateTime.now(),
            'read_at': DateTime.now(),
          },
        ).then((value) {
          // if the comment is added sucessfully

          if (value.statusCode == 200 || value.data['code'] == 200) {
            OtherHelper().showTopSuccessToast(
              context,
              "${value.data["message"]}",
            );
          } else {
            OtherHelper().showTopSuccessToast(
              context,
              "${value.data["message"]}",
            );
          }

          emit(NewTicketSuccessState());
        }).catchError(
          (onError) {
            debugPrint(onError.toString());
            emit(NewTicketErrorState());
          },
        );
      });
    } catch (e) {
      debugPrint('add ticket error is ${e.toString()}');
    }
  }

// get all comments
  Future<void> getAllComments(BuildContext context) async {
    debugPrint(typeController.text);
    emit(NewTicketLoadingState());
    try {
      await DioHelper.getData(url: EndPoints.comments).then((value) async {
        final List<dynamic> commentsData = value.data["ticket"]["comments"];

        for (final element in commentsData) {
          commentModels!.add(CommentsModel.fromJson(element));
        }
        debugPrint('commentModels ${commentModels![0].comment}');
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
