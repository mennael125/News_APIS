import 'package:apis/shared/bloc/cubit.dart';
import 'package:apis/shared/bloc/states.dart';
import 'package:apis/shared/components/companents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NewsCubit,NewsStates >(
      listener: (context,state){},
      builder: (context, state){
        var list = NewsCubit.get(context).search;
      return Scaffold(
        appBar: AppBar(),
    body: Column(
    children: [
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: defaultTextFormFiled(
      validate: (value) {
      if(value!.isEmpty)
      {
      return ('Enter something');

      }
      },
      cont: searchController,
      keyboard: TextInputType.text ,
      onChange: (value){
      NewsCubit.get(context).getSearchData(value);


      },
      icon: Icons.search,
      text: 'Search'),
    ),
    Expanded(
      child:
      list.length>0
          ?pageBuilder(list,context)
          :  Center(child: Text('"\ No search yet\" ' , style: Theme.of(context).textTheme.bodyText2,) ),
    ),


    ],
    ),
    ) ;      });
  }
}
