
import 'dart:convert';

class CounterState {
	final int value;

	CounterState({required this.value});

	Map<String, dynamic> toJson() {
		return {'value': value};
	}

	factory CounterState.fromJson(Map<String, dynamic> json) {
		return CounterState(value: json['value']);
	}
}
