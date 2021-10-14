import 'package:apis/layout/news_layout.dart';
import 'package:apis/shared/bloc/cubit.dart';
import 'package:apis/shared/bloc/states.dart';
import 'package:apis/shared/network/local/cached_helper/cached_helper.dart';
import 'package:apis/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'shared/bloc/bloc_observer.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized()
 ; Bloc.observer = MyBlocObserver();
  DioHelper.init();
   await CashHelper.init();
  bool ? isDark = CashHelper.getData(key: 'isDark');
  runApp(MyApp(isDark ));
}

class MyApp extends StatelessWidget {


  final bool ? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsCubit()..darkChange(fromShared: isDark )..getBusinessData(),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                textTheme: TextTheme(  bodyText2: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                  bodyText1: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                    iconTheme: IconThemeData(color: Colors.black, size: 30.0),
                    elevation: 0.0,
                    backgroundColor: Colors.white,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark),
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 20.0,
                  unselectedItemColor: Colors.black,
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.deepOrange,
                ),
              ),
              darkTheme: ThemeData(


                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  bodyText2: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),

                ),

                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                    titleSpacing: 20,
                    iconTheme: IconThemeData(color: Colors.grey, size: 30.0),
                    elevation: 0.0,
                    backgroundColor: HexColor('333739'),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light),
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.grey)),


                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 20.0,
                  unselectedItemColor: Colors.grey,

                  backgroundColor: HexColor('333739'),
                  selectedItemColor: Colors.deepOrange,
                ),
              ),
              debugShowCheckedModeBanner: false,

              home: NewsLayout(),
              themeMode:

              NewsCubit.get(context).isDark? ThemeMode.dark: ThemeMode.light,
            );
          },
        ));
  }
}
