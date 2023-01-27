import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/auth_screens/presentation/cubit/login/login_cubit.dart';
import 'package:ethaqapp/features/auth_screens/presentation/cubit/login/login_state.dart';
import 'package:ethaqapp/features/consulting_screen/presentation/pages/consulting_screen.dart';
import 'package:ethaqapp/features/search_a_lawyer_screen/presentation/pages/search_a_lawyer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../balance_screen/presentation/pages/balance_screen.dart';
import '../../../invoice_table_screen/presentation/pages/invoice_table_screen.dart';
import '../../../my_profile/presentation/pages/my_profile_screen.dart';
import '../../../privacy_policy_screen/presentation/pages/privacy_policy_screen.dart';
import '../../../support_screen/presentation/pages/support_screen.dart';
import '../../../tickets_screen/presentation/pages/tickets_screen.dart';
import '../widgets/image_name_drawer.dart';
import '../widgets/list_tile_drawer.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key, required this.scaffoldKey}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsetsDirectional.only(
          top: AppPadding.largePadding,
        ),
        children: [
          // close drawer button =====>>>
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
              onPressed: () {
                // close drawer with a slide animation
                scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(
                Icons.close,
              ),
            ),
          ),

          // profile image & name =======>>>
          const ImageNameDrawer(),

          // drawer items =====>>>
          // profile =====>>>
          ListTileDrawer(
            title: 'profile',
            leadingIcon: AppImages.personSvg,
            onTap: () {
              navigateTo(context, const MyProfileScreen());
            },
          ),

          // balance =====>>>
          ListTileDrawer(
            title: 'balance',
            leadingIcon: AppImages.dollarSvg,
            onTap: () {
              navigateTo(context, const BalanceScreen());
            },
          ),

          // my requests =====>>>
          ListTileDrawer(
            title: 'requests',
            leadingIcon: AppImages.documentSvg,
            onTap: () {},
          ),

          // consulting =====>>>
          ListTileDrawer(
            title: 'consulting',
            leadingIcon: AppImages.messageSvg,
            onTap: () {
              navigateTo(context, const ConsultingScreen());
            },
          ),

          // search a lawyer =====>>>
          ListTileDrawer(
            title: 'search_a_lawyer',
            leadingIcon: AppImages.searchSvg,
            onTap: () {
              navigateTo(
                context,
                const SearchALawyerScreen(),
              );
            },
          ),

          // invoice ======>>>
          ListTileDrawer(
            title: 'invoice',
            leadingIcon: AppImages.invoiceSvg,
            onTap: () {
              navigateTo(context, const InvoiceTableScreen());
            },
          ),

          // divider =====>>>
          Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 1,
            indent: 20,
            endIndent: 20,
            height: 30,
          ),

          // support =====>>>
          ListTileDrawer(
            title: 'support',
            leadingIcon: AppImages.phoneSvg,
            onTap: () {
              navigateTo(context, const SupportScreen());
            },
          ),

          // privacy policy =====>>>
          ListTileDrawer(
            title: 'privacy_policy',
            leadingIcon: AppImages.clipboardSvg,
            onTap: () {
              navigateTo(context, const PrivacyPolicy());
            },
          ),

          // tickets =====>>>
          ListTileDrawer(
            title: 'tickets',
            leadingIcon: AppImages.send2Svg,
            onTap: () {
              navigateTo(context, const TicketsScreen());
            },
          ),

          // logout =====>>>
          const SizedBox(
            height: AppPadding.padding4,
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {},
              builder: (context, state) {
                return IconButton(
                  icon: Row(
                    children: [
                      const Icon(
                        IconlyLight.logout,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'logout',
                        style: AppStyles.title500,
                      ).tr(),
                    ],
                  ),
                  onPressed: () {
                    LoginCubit.get(context).logout(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
