import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/privacy_policy_screen/presentation/cubit/privacy_polcy_cubit.dart';
import 'package:ethaqapp/features/privacy_policy_screen/presentation/cubit/privacy_polcy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrivecyPolicyCubit(),
      child: BlocConsumer<PrivecyPolicyCubit, PrivecyPolicyState>(
        listener: (context, state) {},
        builder: (ctx, state) {
          final privacyPolicyScreen = PrivecyPolicyCubit.get(ctx);

          return Scaffold(
            appBar: AppBar(
              title: const Text('privacy_policy').tr(),
            ),
            body: FutureBuilder(
              future: privacyPolicyScreen.privecyPolicy(context),
              builder: (context, data) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.largePadding,
                  ),
                  children: [
                    // contact us text ======>>>>
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: AppPadding.largePadding,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "privacy_policy",
                            style: AppStyles.title600,
                          ).tr(),
                          const SizedBox(
                            width: AppPadding.smallPadding,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.rectangle,
                          color: AppColors.secondColor,
                        ),
                        const SizedBox(
                          width: AppPadding.smallPadding,
                        ),
                        const SizedBox(
                          height: 200,
                          child: Text(
                            'تمثل هذه السياسة جميع الشروط والضوابط التي يجب \nمراعاتها عند استخدام الموقع الإلكتروني للأكاديمية بحيث \nتحدد العلاقة بين الموقع من جهة، والمستخدمين أو الزائريين \nمن جهة اخرى مما يضمن تقديم خدمة أفضل وتحقيق \nأكبر استفادة من كل ما يحتويه الموقع من معلومات. \nتحتفظ الأكاديمية بحق التعديل لشروط الاستخدام في أي \nوقت تراه مناسباً. لذا تأكّد من أن تطلع على هذه الصفحة\nبشكل دوري لتبقى مطلعاً على الإصدار الأحدث لهذه \nالشروط.',
                            style: AppStyles.subtitle100,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: AppPadding.largePadding),
                      child: Row(
                        children: [
                          const Text(
                            "Scope of use",
                            style: AppStyles.title600,
                          ).tr(),
                          const SizedBox(
                            width: AppPadding.smallPadding,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.rectangle,
                          color: AppColors.secondColor,
                        ),
                        const SizedBox(
                          width: AppPadding.smallPadding,
                        ),
                        const SizedBox(
                          height: 100,
                          child: Text(
                            'نسخ أي محتوى من موقع الأكاديمية عن طريق الأجهزة \nالالكترونية أو يدويا دون تصريح مسبق من الأكاديمية.',
                            style: AppStyles.subtitle100,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.rectangle,
                          color: AppColors.secondColor,
                        ),
                        const SizedBox(
                          width: AppPadding.smallPadding,
                        ),
                        const SizedBox(
                          height: 100,
                          child: Text(
                            'نسخ أي محتوى من موقع الأكاديمية عن طريق الأجهزة \nالالكترونية أو يدويا دون تصريح مسبق من الأكاديمية.',
                            style: AppStyles.subtitle100,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.rectangle,
                          color: AppColors.secondColor,
                        ),
                        const SizedBox(
                          width: AppPadding.smallPadding,
                        ),
                        const SizedBox(
                          height: 100,
                          child: Text(
                            'نسخ أي محتوى من موقع الأكاديمية عن طريق الأجهزة \nالالكترونية أو يدويا دون تصريح مسبق من الأكاديمية.',
                            style: AppStyles.subtitle100,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.rectangle,
                          color: AppColors.secondColor,
                        ),
                        const SizedBox(
                          width: AppPadding.smallPadding,
                        ),
                        const SizedBox(
                          height: 100,
                          child: Text(
                            'نسخ أي محتوى من موقع الأكاديمية عن طريق الأجهزة \nالالكترونية أو يدويا دون تصريح مسبق من الأكاديمية.',
                            style: AppStyles.subtitle100,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
