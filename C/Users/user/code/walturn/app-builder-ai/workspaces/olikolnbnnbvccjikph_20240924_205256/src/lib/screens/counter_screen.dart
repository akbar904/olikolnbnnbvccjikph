
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/cubits/counter_cubit.dart';
import 'package:counter_app/widgets/counter_display.dart';
import 'package:counter_app/widgets/counter_button.dart';

class CounterScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Counter App'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						CounterDisplay(),
						SizedBox(height: 20),
						CounterButton(),
					],
				),
			),
		);
	}
}
