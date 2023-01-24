import 'package:dio/dio.dart';
import 'package:ethaqapp/features/auth_screens/presentation/cubit/register/register_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/api/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  // pick file ======>>>
  XFile? file;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null) {
      file = XFile(result.files.single.path!);
      emit(RegisterPickFileState());
    } else {
      // User canceled the picker
    }
  }

  // pick image from gallery ======>>>
  Future<void> pickImage({ImageSource source = ImageSource.gallery}) async {
    final result = await ImagePicker().pickImage(source: source);
    if (result != null) {
      file = XFile(result.path);
      emit(RegisterPickFileState());
    } else {
      // User canceled the picker
    }
  }

  // register =====>>>
  TextEditingController membershipController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController licenseNameController = TextEditingController();
  TextEditingController endAtController = TextEditingController();
  bool isAgreeTerms = false;
  String accountType = "";
  String accountMembership = "";
  String phoneNumber = "";

  // change account type ======>>>
  void changeAccountType(String type, String membership) {
    accountType = type;
    accountMembership = membership;
  }

  // change agree terms ======>>>
  void changeAgreeTerms() {
    isAgreeTerms = !isAgreeTerms;
    emit(RegisterChangeAgreeTermsState());
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    await DioHelper.postData(
      endPoint: EndPoints.register,
      formDataIsEnabled: true,
      data: {
        'type': accountType,
        'membership': accountMembership,
        'agree': isAgreeTerms ? "1" : "0",
        'phone': phoneController.text,
        'license_name': licenseNameController.text,
        'end_at': endAtController.text,
        'licence': await MultipartFile.fromFile(file!.path),
      },
    ).then(
      (value) {
        emit(RegisterSuccessState());
      },
    ).catchError(
      (onError) {
        emit(RegisterErrorState());
      },
    );
  }
}
