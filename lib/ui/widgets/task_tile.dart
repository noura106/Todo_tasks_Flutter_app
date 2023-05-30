import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/ui/size_config.dart';
import 'package:todo/ui/theme.dart';

import '../../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(
              SizeConfig.orientation == Orientation.landscape ? 8 : 20),
        ),
        width: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth / 2
            : SizeConfig.screenWidth,
        margin: EdgeInsets.only(bottom: getProportionateScreenHeight(12)),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _getBGClr(task.color),
          ),
          child: Row(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     ' ${task.title}',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[100],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_alarm_rounded,
                          color: Colors.grey[200],
                          size: 18,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          '${task.startTime} _ ${task.endTime}',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                   task.note ==null? Container() : Text(
                     task.note.toString(),
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[100],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                width: 0.5,
                color: Colors.grey[400],
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  task.isCompleted == 0 ? 'TODO' : 'Completed' ,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getBGClr(int? color) {
    switch (color) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return orangeClr;
      default:
        return bluishClr;
    }
  }
}
