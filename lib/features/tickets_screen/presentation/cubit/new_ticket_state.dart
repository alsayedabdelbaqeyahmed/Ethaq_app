abstract class NewTicketState {}

class NewTicketInitial extends NewTicketState {}

class NewTicketLoadingState extends NewTicketState {}

class NewTicketSuccessState extends NewTicketState {}

class NewTicketErrorState extends NewTicketState {}
