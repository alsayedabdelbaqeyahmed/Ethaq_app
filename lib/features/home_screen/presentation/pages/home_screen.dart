import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/home_screen/presentation/pages/consulting_slider.dart';
import 'package:ethaqapp/features/home_screen/presentation/pages/home_slider.dart';
import 'package:ethaqapp/features/home_screen/presentation/pages/requests_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/components/textformfields/search_textform.dart';
import '../../../drawer/presentation/pages/drawer_page.dart';
import '../../../instant_consultation_screen/presentation/pages/instant_consultation_screen.dart';
import '../../../notifications_screen/presentation/pages/notification_screen.dart';
import '../../../search_a_lawyer_screen/presentation/pages/search_a_lawyer_screen.dart';
import '../widgets/home_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key
    return Scaffold(
      key: scaffoldKey,
      // appBar =======>>>
      appBar: AppBar(
        // sort of a title =====>>>
        leading: IconButton(
          onPressed: () {
            // open drawer with a slide animation
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.sort_outlined,
            size: 30,
          ),
        ),
        // title =====>>>
        title: Image.asset(
          AppImages.logoWithoutText,
        ),
        // notification =====>>>
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(
                context,
                const NotificationsScreen(),
                pageTransitionType: PageTransitionType.topToBottom,
              );
            },
            icon: Container(
              padding: const EdgeInsets.all(AppPadding.padding4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: const [
                  Icon(
                    IconlyLight.notification,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: AppColors.secondColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // drawer =====>>>
      drawer: DrawerPage(
        scaffoldKey: scaffoldKey,
      ),

      // body =====>>>
      body: Column(
        children: [
          // search bar =====>>>
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: AppPadding.padding16,
              horizontal: AppPadding.largePadding,
            ),
            child: SearchTextFormField(
              searchController: TextEditingController(),
              hintText: 'search_a_lawyer',
              readOnly: true,
              onTap: () {
                navigateTo(
                  context,
                  const SearchALawyerScreen(),
                  pageTransitionType: PageTransitionType.bottomToTop,
                );
              },
            ),
          ),

          // all body =====>>>
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // slider =====>>>
                  const HomeSlider(),

                  // choose consulting or new request =====>>>
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.padding16,
                      horizontal: AppPadding.largePadding,
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: HomeContainer(
                            title: 'create_new_request',
                            imageSvg: AppImages.elementplusSvg,
                            color: AppColors.cPrimary,
                          ),
                        ),
                        const SizedBox(
                          width: AppPadding.padding16,
                        ),
                        Expanded(
                          child: HomeContainer(
                            title: 'instant_consultation',
                            imageSvg: AppImages.messageBoldSvg,
                            color: AppColors.secondColor,
                            onTap: () {
                              navigateTo(
                                context,
                                const InstantConsultationScreen(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // requests =====>>>
                  const RequestsSlider(),

                  // consulting =====>>>
                  const ConsultingSlider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
