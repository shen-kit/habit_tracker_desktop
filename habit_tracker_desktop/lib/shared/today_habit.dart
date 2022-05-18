import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_tracker_desktop/models/habit.dart';

class TodayHabit extends StatefulWidget {
  const TodayHabit(this.habit, this.state, {Key? key}) : super(key: key);

  final Habit habit;
  final habitState state;

  @override
  State<TodayHabit> createState() => _TodayHabitState();
}

class _TodayHabitState extends State<TodayHabit> {
  @override
  Widget build(BuildContext context) {
    double percentage =
        (widget.habit.completed + widget.habit.partiallyCompleted) *
            100 /
            (widget.habit.completed +
                widget.habit.partiallyCompleted +
                widget.habit.excused +
                widget.habit.failed);
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: habitStateColors[widget.state],
        border: (widget.state == habitState.skip ||
                widget.state == habitState.future)
            ? Border.all(color: Colors.black38)
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Stack(
          children: [
            Text(
              widget.habit.name,
              style: const TextStyle(fontSize: 20),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    percentage.toStringAsPrecision(3),
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(width: 2),
                  const SizedBox(
                    // to ensure the numbers align perfectly
                    width: 16,
                    child: FaIcon(
                      Icons.percent,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.habit.streak.toString(),
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(width: 2),
                  const SizedBox(
                    width: 16,
                    child: FaIcon(
                      FontAwesomeIcons.fire,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 18,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Completed',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
