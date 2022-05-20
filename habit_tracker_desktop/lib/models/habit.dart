import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

enum HabitState {
  completed,
  partiallyCompleted,
  failed,
  excused,
  skip,
  future,
}

Map<HabitState, String> habitStateNames = {
  HabitState.completed: 'Completed',
  HabitState.partiallyCompleted: 'Partially Completed',
  HabitState.failed: 'Failed',
  HabitState.excused: 'Excused',
  HabitState.skip: 'Not Today',
  HabitState.future: 'Mark Complete',
};

Map<HabitState, Color> habitStateColors = {
  HabitState.completed: const Color(0xFF358F74),
  HabitState.partiallyCompleted: const Color(0xFF347F9F),
  HabitState.failed: const Color(0xFFC03F3F),
  HabitState.excused: const Color(0xFFAC7B33),
  HabitState.skip: Colors.transparent,
  HabitState.future: Colors.transparent,
};

Map<HabitState, IconData> habitStateIcons = {
  HabitState.completed: FontAwesomeIcons.circleCheck,
  HabitState.partiallyCompleted: FontAwesomeIcons.circleCheck,
  HabitState.failed: Icons.cancel_outlined,
  HabitState.excused: Icons.remove_circle_outline_rounded,
  HabitState.skip: Icons.circle_outlined,
  HabitState.future: Icons.circle_outlined,
};