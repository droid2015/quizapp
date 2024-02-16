import 'package:flutter/material.dart';
import 'package:quizapp/ui/views/home/menu_view.dart';
import 'package:stacked/stacked.dart';
import 'package:quizapp/ui/common/app_colors.dart';
import 'package:quizapp/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer:DrawerMenu(),
      body: Center(
        child: Text('Content of Home Screen'),
      ),
      
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
