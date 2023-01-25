part of 'consulting_show_cubit.dart';

@immutable
abstract class ConsultingShowState {}

class ConsultingShowInitial extends ConsultingShowState {}

class LoadingConsultingShowState extends ConsultingShowState {}

class SuccessConsultingShowState extends ConsultingShowState {}

class ErrorConsultingShowState extends ConsultingShowState {}
