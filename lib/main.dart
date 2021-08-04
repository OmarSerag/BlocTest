import 'dart:ui';

import 'package:bloc_test/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: BlocConsumer<CounterCubit,CounterState>(
          listener: (context, state) {},
          builder: (context, state) =>
              Scaffold(
                appBar: AppBar(
                  title: Text('Bloc Fundamentals'),
                ),
                body: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        child: Text(
                          'MINUS',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                          )
                        ),
                        onPressed: () {
                          CounterCubit.get(context).minus();
                        },
                      ),
                      Text(
                        '${CounterCubit.get(context).counter}',
                        style: TextStyle(
                            color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0
                        )
                      ),
                      TextButton(
                        child: Text(
                          'PLUS',
                          style: TextStyle(
                              color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0
                          )
                        ),
                        onPressed: () {
                          CounterCubit.get(context).plus();
                        },
                      ),
                    ],
                  ),
                ),
              ),
        )
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
