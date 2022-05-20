import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:habit_tracker_desktop/models/habit.dart';

class TodayHabit extends StatefulWidget {
  const TodayHabit(this.habit, this.state, {Key? key}) : super(key: key);

  final Habit habit;
  final HabitState state;

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

    bool darkForeground =
        widget.state == HabitState.skip || widget.state == HabitState.future;

    return ListTile(
      onTap: () {
        print('toggle habit state');
      },
      onLongPress: () {
        print('toggle not today');
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: darkForeground
            ? const BorderSide(color: Colors.black38)
            : BorderSide.none,
      ),
      tileColor: habitStateColors[widget.state],
      textColor: darkForeground ? Colors.black : Colors.white,
      iconColor: darkForeground ? Colors.black : Colors.white,
      title: SizedBox(
        height: 55,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.habit.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    habitStateIcons[widget.state],
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    habitStateNames[widget.state] ?? 'NO NAME ASSIGNED TO STATE',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    percentage.toStringAsPrecision(3),
                    style: const TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.w300,
                    ),
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
                    style: const TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.w300,
                    ),
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
          ],
        ),
      ),
    );
  }
}
