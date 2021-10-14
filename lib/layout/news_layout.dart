import 'package:apis/layout/search_screen.dart';
import 'package:apis/shared/bloc/cubit.dart';
import 'package:apis/shared/bloc/states.dart';
import 'package:apis/shared/components/companents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(icon: Icon(Icons.search) , onPressed: (){
                  PagePush(context, SearchScreen());

                },)
                ,
                IconButton(icon: Icon(Icons.brightness_4_outlined) , onPressed: (){


                cubit.darkChange();
print(cubit.isDark);

          }

                )
              ],
              title: Text("News App",
               ),
            ),
            body: cubit.Screens[cubit.currentindex ] ,
            bottomNavigationBar:BottomNavigationBar(items: cubit.items,
            onTap: (index){
              cubit.change(index);
            }
            ,currentIndex: cubit.currentindex,

            ) ,
          );
        });
  }
}
