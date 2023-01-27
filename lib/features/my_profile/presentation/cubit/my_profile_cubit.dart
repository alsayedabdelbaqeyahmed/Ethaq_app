import 'package:dio/dio.dart';
import 'package:ethaqapp/core/api/end_points.dart';
import 'package:ethaqapp/core/utils/most_used_functions.dart';
import 'package:ethaqapp/core/utils/other_helpers.dart';
import 'package:ethaqapp/features/my_profile/presentation/cubit/my_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/remote/dio_helper.dart';
import '../../data/models/my_profile_model.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(MyProfileInitial());

  static MyProfileCubit get(BuildContext context) => BlocProvider.of(context);

  MyProfileModel? myProfileModel;

  // get user data ======>>>
  Future<void> getMyProfile(BuildContext context) async {
    emit(MyProfileLoadingState());
    await DioHelper.getData(
      url: EndPoints.getMyProfile,
    ).then(
      (value) {
        print('value is ${value.data}');
        myProfileModel = MyProfileModel.fromJson(value.data);
        if (myProfileModel!.status == false) {
          OtherHelper()
              .showTopInfoToast(context, myProfileModel!.message ?? '');
        } else {
          setUserData();
        }
        emit(MyProfileSuccessState());
      },
    ).catchError(
      (error) {
        debugPrint(error.toString());
        emit(MyProfileErrorState());
      },
    );
  }

  // personal info ======>>>
  GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  // secure info ======>>>
  GlobalKey<FormState> secureInfoFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController identityExpiryDateController = TextEditingController();
  TextEditingController ibanController = TextEditingController();

  // set user data after get profile ======>>>
  void setUserData() {
    nameController.text =
        myProfileModel!.dataMyProfile!.userMyProfile!.name ?? '';
    dateOfBirthController.text =
        myProfileModel!.dataMyProfile!.userMyProfile!.birthdate ?? '';
    emailController.text =
        myProfileModel!.dataMyProfile!.userMyProfile!.email ?? '';
    phoneController.text =
        myProfileModel!.dataMyProfile!.userMyProfile!.phone ?? '';
    identityNumberController.text =
        myProfileModel!.dataMyProfile!.userMyProfile!.idNumber ?? '';
    identityExpiryDateController.text =
        myProfileModel!.dataMyProfile!.userMyProfile!.idEnd ?? '';
    ibanController.text =
        myProfileModel!.dataMyProfile!.userMyProfile!.bankAccount ?? '';
  }

  // pick profile image ======>>>
  XFile? profileImage;
  final picker = ImagePicker();

  Future<void> pickProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = pickedFile;
      emit(PickProfileImageState());
    } else {
      MostUsedFun().printFullText('No image selected.');
    }
  }

  // update profile ======>>>
  Future<void> updateProfile(BuildContext context) async {
    emit(UpdateProfileLoadingState());
    DioHelper.postData(
      endPoint: EndPoints.updateMyProfile,
      formDataIsEnabled: true,
      data: {
        'name': nameController.text,
        'email': emailController.text,
        'id_number': identityNumberController.text,
        'birthdate': dateOfBirthController.text,
        'bank_account': ibanController.text,
        if (profileImage != null)
          'image': await MultipartFile.fromFile(
            profileImage!.path,
            filename: profileImage!.name,
          ),
      },
    ).then(
      (value) {
        final myProfileModel = MyProfileModel.fromJson(value.data);

        if (myProfileModel.status == false) {
          OtherHelper().showTopInfoToast(context, myProfileModel.message ?? '');
          emit(UpdateProfileSuccessState());
        } else {
          OtherHelper()
              .showTopSuccessToast(context, myProfileModel.message ?? '');
          getMyProfile(context);
        }
      },
    ).catchError(
      (error) {
        debugPrint(error.toString());
        emit(UpdateProfileErrorState());
      },
    );
  }
}
