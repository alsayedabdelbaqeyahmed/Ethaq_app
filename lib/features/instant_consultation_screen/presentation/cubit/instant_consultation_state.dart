abstract class InstantConsultationState {}

class InstantConsultationInitial extends InstantConsultationState {}

class ChangeIndex extends InstantConsultationState {}

class ChangeVendorId extends InstantConsultationState {}

class GetDataForConsultationLoadingState extends InstantConsultationState {}
class GetDataForConsultationPaginationLoadingState extends InstantConsultationState {}

class GetDataForConsultationSuccessState extends InstantConsultationState {}

class GetDataForConsultationErrorState extends InstantConsultationState {}

class CreateConsultationLoadingState extends InstantConsultationState {}

class CreateConsultationSuccessState extends InstantConsultationState {}

class CreateConsultationErrorState extends InstantConsultationState {}

class PickFilesSuccessState extends InstantConsultationState {}
