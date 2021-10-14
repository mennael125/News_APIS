import 'package:apis/shared/bloc/cubit.dart';
import 'package:apis/shared/bloc/states.dart';
import 'package:apis/shared/components/companents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=NewsCubit.get(context).science;
        return   list.length>0
            ?pageBuilder(list,context)
            :  Center(child: CircularProgressIndicator());
      },
    );
  }
}
