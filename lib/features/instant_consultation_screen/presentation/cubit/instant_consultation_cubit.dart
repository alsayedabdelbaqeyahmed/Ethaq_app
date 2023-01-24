// ignore_for_file: avoid_positional_boolean_parameters

import 'package:dio/dio.dart';
import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/api/local/hive_reuse.dart';
import 'package:ethaqapp/core/api/remote/dio_helper.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_const.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';
import 'package:ethaqapp/features/instant_consultation_screen/presentation/cubit/instant_consultation_state.dart';
import 'package:ethaqapp/features/instant_consultation_screen/presentation/pages/step_2.dart';
import 'package:ethaqapp/features/main_screen/presentation/pages/main_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/data_for_create_consulting_model.dart';
import '../pages/step_1.dart';

class InstantConsultationCubit extends Cubit<InstantConsultationState> {
  InstantConsultationCubit() : super(InstantConsultationInitial());

  static InstantConsultationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  int currentStep = 0;
  List<Widget> steps = [
    const StepOneInstantConsultation(),
    const StepTwoInstantConsultation(),
  ];
  PageController pageController = PageController();
  bool forAllLawyers = true;

  void changeForLawyer(bool value) {
    forAllLawyers = value;
    emit(ChangeIndex());
  }

  // next step
  void nextStep(BuildContext context) {
    if (currentStep == 1) {
      if (departmentId == 0) {
        OtherHelper().showTopInfoToast(context, "department_is_required");
      } else if (detailsController.text.isEmpty) {
        OtherHelper().showTopInfoToast(context, "details_is_required");
      } else {
        createConsultation(context);
      }
    } else {
      if (currentStep < steps.length - 1) {
        currentStep++;
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        emit(ChangeIndex());
      }
    }
  }

  DataForCreateConsultingModel? dataForCreateConsultingModel;
  List<Departments> departments = [];
  List<DataVendor> vendorsList = [];
  int currentPage = 1;
  int lastPage = 1;
  bool isFree = false;
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();

  // on scroll to end ====>>
  Future<void> onScrollToEnd(BuildContext context) async {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (currentPage < lastPage) {
          currentPage++;
          getDataForConsultation(context, isPagination: true);
        }
      }
    });
  }

  // change is free ====>>>
  void changeIsFree(BuildContext context) {
    isFree = !isFree;
    getDataForConsultation(context);
  }

  // get data for consultation =====>>>
  Future<void> getDataForConsultation(
    BuildContext context, {
    bool isPagination = false,
  }) async {
    isPagination
        ? emit(GetDataForConsultationPaginationLoadingState())
        : emit(GetDataForConsultationLoadingState());
    await DioHelper.getData(
      url: EndPoints.getDataForConsulting,
      query: {
        'page': currentPage,
        if (searchController.text.isNotEmpty) "name": searchController.text,
        'free': isFree,
      },
    ).then(
      (value) {
        dataForCreateConsultingModel =
            DataForCreateConsultingModel.fromJson(value.data);
        if (dataForCreateConsultingModel!.status == false) {
          OtherHelper().showTopFailToast(
            context,
            dataForCreateConsultingModel!.message ?? '',
          );
        } else {
          // if pagination it will add to the list else it will equal to new
          if (isPagination) {
            departments
                .addAll(dataForCreateConsultingModel!.allData!.departments!);
            vendorsList.addAll(dataForCreateConsultingModel!
                .allData!.vendorsCreateConsultation!.dataVendor!,);
          } else {
            departments = dataForCreateConsultingModel!.allData!.departments!;
            vendorsList = dataForCreateConsultingModel!
                .allData!.vendorsCreateConsultation!.dataVendor!;
          }
        }
        emit(GetDataForConsultationSuccessState());
      },
    ).catchError(
      (error) {
        debugPrint(error.toString());
        emit(GetDataForConsultationErrorState());
      },
    );
  }

  TextEditingController departmentController = TextEditingController();
  int departmentId = 0;
  int? vendorId = 0;
  TextEditingController detailsController = TextEditingController();

  // change vendor id ======>>>
  void changeVendorId(int? value) {
    if (value == vendorId) {
      vendorId = 0;
    } else {
      vendorId = value;
    }
    emit(ChangeVendorId());
  }

  // pick files =====>>>
  List<String> files = [];
  List<String> fileNames = [];

  Future<void> pickFiles() async {
    await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'pdf', 'doc', 'docx'],
    ).then(
      (value) {
        if (value != null) {
          for (final element in value.files) {
            files.add(element.path!);
            fileNames.add(element.name);
          }
          emit(PickFilesSuccessState());
        }
      },
    ).catchError(
      (error) {
        debugPrint(error.toString());
      },
    );
  }

  // create consultation =====>>>
  Future<void> createConsultation(BuildContext context) async {
    emit(CreateConsultationLoadingState());
    await DioHelper.postData(
      endPoint: EndPoints.createConsulting,
      formDataIsEnabled: true,
      data: {
        'other_department': '',
        'department_id': "$departmentId",
        'client_id': await HiveReuse.mainBox.get(AppConst.userIdBox),
        'vendor_id': forAllLawyers ? null : "$vendorId",
        'details': detailsController.text,
        'status': 'pending',
        'min': '0',
        'sec': '0',
        'free': isFree ? "1" : "0",
        if (files.isNotEmpty)
          'images': [
            for (final file in files)
              await MultipartFile.fromFile(
                file,
                filename: file.split('/').last,
              ),
          ],
      },
    ).then(
      (value) {
        if (value.data['status'] == false) {
          OtherHelper().showTopFailToast(context, value.data['message']);
        } else {
          navigateAndFinish(context, const MainScreen());
          OtherHelper().showTopSuccessToast(
            context,
            value.data['message'] ?? '',
          );
        }
        emit(CreateConsultationSuccessState());
      },
    ).catchError(
      (error) {
        debugPrint(error.toString());
        OtherHelper().showTopFailToast(context, 'some_thing_went_wrong');
        emit(CreateConsultationErrorState());
      },
    );
  }
}
