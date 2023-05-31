// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:task_list_app/generated/assets.dart';
import 'package:task_list_app/styles/text_styles.dart';
import '../../../../projectScreen.dart';
import '../../../../styles/color.dart';
import '../../models/task.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../view/home/widgets/task_widget.dart';
import '../../view/tasks/task_view.dart';
import '../../utils/strings.dart';
import 'package:percent_indicator/percent_indicator.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  /// Checking Done Tasks
  int checkDoneTask(List<Task> task) {
    int i = 0;
    for (Task doneTasks in task) {
      if (doneTasks.isCompleted) {
        i++;
      }
    }
    return i;
  }

  /// Checking The Value Of the Circle Indicator
  dynamic valueOfTheIndicator(List<Task> task) {
    if (task.isNotEmpty) {
      return task.length;
    } else {
      return 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);
    var textTheme = Theme.of(context).textTheme;

    var base2 = BaseWidget.of(context).dataStore.box;


    return ValueListenableBuilder(
        valueListenable: base.dataStore.listenToTask(),
        builder: (ctx, Box<Task> box, Widget? child) {
          var tasks = box.values.toList();

          /// Sort Task List
          tasks.sort(((b, a) => a.createdAtDate.compareTo(b.createdAtDate)));

          return Scaffold(
            backgroundColor: ColorsTheme.backgroundColor,

            /// Floating Action Button
            floatingActionButton: const FAB(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

            /// Main Body
              body: SafeArea(
                child: _buildBody(
                  tasks,
                  base,
                  textTheme,
                  base2
            ),
              ),
          );
        });
  }

  /// Main Body
  Widget _buildBody(
    List<Task> tasks,
    BaseWidget base,
    TextTheme textTheme,
      Box<Task> base2,
  ) {
    return Column(
      children: [
        /// Top Section Of Home page : Text, Progress Indicator
        SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// Texts
              SizedBox(),
              Text(MyString.mainTitle, style: ThemeTexts.textStyleTitle1),
              SizedBox(
                child: GestureDetector(
                  onTap: () {
                    base2.isEmpty
                        ? warningNoTask(context)
                        : deleteAllTask(context);
                  },
                  child: const Icon(
                    CupertinoIcons.delete,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),


        /// LinearProgressIndicator

        Padding(
          padding: const EdgeInsets.all(8),
          child: LinearPercentIndicator(
            animation: true,
            lineHeight: 40,
            animationDuration: 1000,
            percent: checkDoneTask(tasks) / valueOfTheIndicator(tasks),
            center: Text("${checkDoneTask(tasks)} of ${tasks.length} task done",
                style: TextStyle(color: Colors.white)),
            animateFromLastPercent: true,
            progressColor: MyColors.primaryColor,
            barRadius: Radius.circular(5),
          ),
        ),

        /// Bottom ListView : Tasks
        Expanded(
          child: tasks.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    var task = tasks[index];

                    return Dismissible(
                      direction: DismissDirection.horizontal,
                      background: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(MyString.deletedTask,
                              style: TextStyle(
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      onDismissed: (direction) {
                        base.dataStore.deleteTask(task: task);
                      },
                      key: Key(task.id),
                      child: TaskWidget(
                        task: tasks[index],
                      ),
                    );
                  },
                )

              /// if All Tasks Done Show this Widgets
              : SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  Assets.lottieNoData,
                  animate: tasks.isNotEmpty ? false : true,
                ),
              ),
        )
      ],
    );
  }
}


/// Floating Action Button
class FAB extends StatelessWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          Navigator.push(context,
              CupertinoPageRoute(
                builder: (context) => TaskView(
                  taskControllerForSubtitle: null,
                  taskControllerForTitle: null,
                  task: null,
                  isImp: false,
                ),
              )
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsTheme.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: EdgeInsets.all(25),
        ),
        child: Icon(CupertinoIcons.add,color: Colors.white,size: 30,),
      );
  }
}
