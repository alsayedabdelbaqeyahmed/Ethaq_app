import 'package:ethaqapp/features/auth_screens/presentation/pages/register/step_one_as_company.dart';
import 'package:ethaqapp/features/auth_screens/presentation/pages/register/step_two_as_company.dart';
import 'package:flutter/material.dart';

class CompanyTabView extends StatelessWidget {
  const CompanyTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final List<Widget> steps = [
      StepOneAsCompany(
        pageController: pageController,
      ),
      const StepTwoAsCompany(),
    ];
    return PageView.builder(
      itemCount: 2,
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => steps[index],
    );
  }
}
