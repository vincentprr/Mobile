import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2_2223/home.dart';
import 'package:td2_2223/mytheme.dart';
import 'package:td2_2223/viewmodels/settingviewmodel.dart';
import 'package:td2_2223/viewmodels/taskviewmodel.dart';

void main() {
  runApp(MyTD2());
}

class MyTD2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          SettingViewModel settingViewModel = SettingViewModel();
          return settingViewModel;
        }),
        ChangeNotifierProvider(create: (_) {
          TaskViewModel taskViewModel = TaskViewModel();
          taskViewModel.generateTasks();
          return taskViewModel;
        })
      ],
      child: Consumer<SettingViewModel>(
        builder: (context, SettingViewModel notifier, child) {
          return MaterialApp(
              theme: notifier.isDark ? MyTheme.dark() : MyTheme.light(),
              title: 'TD2',
              home: Home());
        },
      ),
    );
  }
}
