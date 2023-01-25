part of 'consulting_cubit.dart';

@immutable
abstract class ConsultingState {}

class ConsultingInitial extends ConsultingState {}

class LoadingConsultingState extends ConsultingState {}

class SuccessConsultingState extends ConsultingState {}

class ErrorConsultingState extends ConsultingState {}
