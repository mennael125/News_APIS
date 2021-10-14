abstract class NewsStates {}

class IntialState extends NewsStates {}

class BottomNavChangeState extends NewsStates {}

class GetBusinessStateError extends NewsStates {
  final  String ?  error ;

  GetBusinessStateError(this.error);
}

class GetBusinessStateDone extends NewsStates {}

class LoadingGetBusinessState extends NewsStates {}

class GetSportStateError extends NewsStates {
  final  String ?  error ;

  GetSportStateError(this.error);
}

class GetSportStateDone extends NewsStates {}

class LoadingGetSportState extends NewsStates {}


class GetScienceStateError extends NewsStates {
  final  String ?  error ;

  GetScienceStateError(this.error);
}

class GetScienceStateDone extends NewsStates {}

class LoadingGetScienceState extends NewsStates {}

class DarkStateChange extends NewsStates {}



class GetSearchStateError extends NewsStates {
  final  String ?  error ;

  GetSearchStateError(this.error);
}

class GetSearchStateDone extends NewsStates {}

class LoadingGetSearchState extends NewsStates {}