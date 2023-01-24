part of 'consulting_cubit.dart';

@immutable
abstract class ConsultingState {}

class ConsultingInitial extends ConsultingState {}

class SendCodeLoadingConsultingState extends ConsultingState {}

class SendCodeSuccessConsultingState extends ConsultingState {}

class SendCodeErrorConsultingState extends ConsultingState {}

class VerifyLoadingConsultingState extends ConsultingState {}

class VerifySuccessConsultingState extends ConsultingState {}

class VerifyErrorConsultingState extends ConsultingState {}
