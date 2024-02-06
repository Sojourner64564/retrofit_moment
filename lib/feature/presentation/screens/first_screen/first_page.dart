import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit_moment/feature/presentation/cubit/test_cubit/test_cubit.dart';

class FirstPage extends StatelessWidget {
 // final TestCubit testCubit = TestCubit();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TestCubit, TestState>(
            bloc: testCubit,
            builder: (context, state) {
              if (state is TestInitial) {
                return const Text('TestInitial');
              }
              if (state is TestLoading) {
                return const Text('TestLoading');
              }
              if (state is TestLoading) {
                return const Text('TestLoading');
              } else {
                return const Text('error bruh');
              }
            }),
        GestureDetector(
          onTap: () {
            testCubit.myTestCubitMethod();
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
            child: const Center(
              child: Text('dfdfd'),
            ),
          ),
        ),
      ],
    );
  }
}
