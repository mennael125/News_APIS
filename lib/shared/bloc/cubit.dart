import 'package:apis/modules/business/business.dart';
import 'package:apis/modules/science/science.dart';

import 'package:apis/modules/sports/sports.dart';
import 'package:apis/shared/bloc/states.dart';
import 'package:apis/shared/network/local/cached_helper/cached_helper.dart';
import 'package:apis/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(IntialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_outlined), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball_rounded), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
  ];

  void change(index) {
    currentindex = index;

    if (currentindex == 1) {
      getSportData();
    }
    if (currentindex == 2) {
      getScienceData();
    }
    emit(BottomNavChangeState());
  }

  List<Widget> Screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<dynamic> business = [];

  void getBusinessData() {
    emit(LoadingGetBusinessState());
    if (business.length == 0) {
      DioHelper.getData(path: 'v2/top-headlines', queryParameters: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '89fc1cc9e0fb4466b416a295076533a7'
      }).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(GetBusinessStateDone());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetBusinessStateError(onError.toString()));
      });
    } else
      emit(GetBusinessStateDone());
  }

  List<dynamic> sports = [];

  void getSportData() {
    emit(LoadingGetSportState());
    if (sports.length == 0) {
      DioHelper.getData(path: 'v2/top-headlines', queryParameters: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '89fc1cc9e0fb4466b416a295076533a7'
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(GetSportStateDone());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetSportStateError(onError.toString()));
      });
    } else
      emit(GetSportStateDone());
  }

  List<dynamic> science = [];

  void getScienceData() {
    emit(LoadingGetScienceState());
    if (science.length == 0) {
      DioHelper.getData(path: 'v2/top-headlines', queryParameters: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '89fc1cc9e0fb4466b416a295076533a7'
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(GetScienceStateDone());
      }).catchError((onError) {
        print(onError.toString());
        emit(GetScienceStateError(onError.toString()));
      });
    } else
      emit(GetScienceStateDone());
  }

  bool isDark = false;

  void darkChange({
    bool? fromShared,
  }) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(DarkStateChange());
    } else {
      isDark = !isDark;
      CashHelper.putData(value: isDark, key: 'isDark');
      emit(DarkStateChange());
    }
  }

  List<dynamic> search = [];

  void getSearchData(String value) {
    emit(LoadingGetSearchState());

    DioHelper.getData(path: 'v2/everything', queryParameters: {
      'q': '$value',
      'apiKey': '89fc1cc9e0fb4466b416a295076533a7'
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(GetSearchStateDone());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetSearchStateError(onError.toString()));
    });

    emit(GetSearchStateDone());
  }
}
