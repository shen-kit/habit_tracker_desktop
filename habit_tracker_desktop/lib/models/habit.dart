import 'package:flutter/material.dart';

class Habit {
  final String name;
  final String requirement;
  final String partialRequirement;

  final int completed;
  final int partiallyCompleted;
  final int failed;
  final int excused;

  final int streak;

  Habit({
    required this.name,
    required this.requirement,
    required this.partialRequirement,
    required this.completed,
    required this.partiallyCompleted,
    required this.failed,
    required this.excused,
    required this.streak,
  });
}

enum habitState {
  completed,
  partiallyCompleted,
  failed,
  excused,
  skip,
  future,
}

Map<habitState, Color> habitStateColors = {
  habitState.completed: const Color(0xFF358F74),
  habitState.partiallyCompleted: const Color(0xFF347F9F),
  habitState.failed: const Color(0xFFC03F3F),
  habitState.excused: const Color(0xFFCF9D51),
  habitState.skip: Colors.transparent,
  habitState.future: Colors.transparent,
};
