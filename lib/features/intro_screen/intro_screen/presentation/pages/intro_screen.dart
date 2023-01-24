import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/appbox.dart';
import '../../../../../core/components/buttons/rounded_button.dart';
import '../../../../../core/components/reuse_functions.dart';
import '../../../../../core/utils/app_const.dart';
import '../../../../auth_screens/presentation/pages/login/login_screen.dart';
import '../../data/models/slider_model.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<SliderModel> slides = <SliderModel>[
    SliderModel(
      imagePath: AppImages.introSlider1,
      title: 'intro_title1',
      subtitle: 'sub_intro_title1',
    ),
    SliderModel(
      imagePath: AppImages.introSlider2,
      title: 'intro_title2',
      subtitle: 'sub_intro_title2',
    ),
    SliderModel(
      imagePath: AppImages.introSlider3,
      title: 'intro_title3',
      subtitle: 'sub_intro_title3',
    ),
  ];
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: finishIntro,
          child: FittedBox(child: const Text('skip').tr()),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // page view
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: PageView.builder(
                    itemCount: slides.length,
                    controller: pageController,
                    // physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            slides[index].imagePath,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                          Column(
                            children: [
                              Text(
                                slides[index].title.tr(),
                                textAlign: TextAlign.center,
                                style: AppStyles.title700,
                              ),
                              const SizedBox(
                                height: AppPadding.padding8,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.largePadding,
                                ),
                                child: Text(
                                  slides[index].subtitle.tr(),
                                  textAlign: TextAlign.center,
                                  style: AppStyles.title500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: AppColors.cDisActiveLight,
                    activeDotColor: AppColors.cPrimary,
                    dotHeight: 8,
                    dotWidth: 12,
                    expansionFactor: 2,
                  ),
                ),

                const SizedBox(
                  height: AppPadding.mediumPadding,
                ),
                // indicator and control button
                if (currentIndex != 0 && currentIndex == slides.length - 1)
                  ReusedRoundedButton(
                    text: 'start_now',
                    onPressed: finishIntro,
                  )
                else
                  ReusedRoundedButton(
                    text: 'next',
                    onPressed: nextIntro,
                  ),
              ]
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.smallPadding,
                      ),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> finishIntro() async {
    await AppBoxes.mainBox.put(
      AppConst.introFinishBox,
      true,
    );
    // ignore: use_build_context_synchronously
    navigateAndFinish(context, const LoginScreen());
  }

  Future<void> nextIntro() async {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    currentIndex++;
    setState(() {});
  }
}
