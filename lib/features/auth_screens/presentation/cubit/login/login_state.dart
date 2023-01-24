abstract class LoginState {}

class LoginInitial extends LoginState {}

class SendCodeLoadingState extends LoginState {}

class SendCodeSuccessState extends LoginState {}

class SendCodeErrorState extends LoginState {}

class VerifyLoadingState extends LoginState {}

class VerifySuccessState extends LoginState {}

class VerifyErrorState extends LoginState {}
