import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
import '../cubit/app_states.dart';
import '../shared/components.dart';


class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('salla'),
            actions: [
              IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.search),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 10,),
              ),
            ],
          ),
          body: Column(
            children: [ Container(height: 50,width: 50,color: Colors.red,)],
          )
        );
      },
    );
  }
}
