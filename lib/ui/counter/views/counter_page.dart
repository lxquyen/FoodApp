import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/ui/counter/cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  static const String routeName = '/CounterPage';

  @override
  Widget build(BuildContext context) {
    final CounterCubit counterCubit = context.watch<CounterCubit>();
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: Size(88, 40),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.red);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, counter) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Two actions/event here:',
                style: TextStyle(fontSize: 25),
              ),
              TextButton(
                style: flatButtonStyle.copyWith(backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent)),
                onPressed: () {
                  counterCubit.increment();
                },
                child: Text('Increment(+)'),
              ),
              Text('Result: $counter', style: TextStyle(fontSize: 40, color: Colors.blue),),
              // Spacer(),
              // Expanded( // <-- SEE HERE
              //   child: SizedBox.shrink(),
              // ),
              TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  counterCubit.decrement();
                },
                child: Text('Decrement(-)'),
              ),
            ],
          );
        }
      ),
    );
  }
}
