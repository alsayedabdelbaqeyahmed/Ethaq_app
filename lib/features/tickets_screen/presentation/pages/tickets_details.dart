import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/components/textformfields/profile_textformfield.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/tickets_screen/presentation/cubit/new_ticket_cubit.dart';
import 'package:flutter/material.dart';

class TicketsDetailsScreen extends StatelessWidget {
  final int? index;
  final NewTicketCubit? newTicketCubit;
  final String? createdAt;
  const TicketsDetailsScreen({
    Key? key,
    required this.index,
    required this.newTicketCubit,
    required this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tickets').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(AppPadding.mediumPadding),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const AssetSvgImage(
                      AppImages.ticket3Icon,
                      color: AppColors.secondColor,
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(
                        start: AppPadding.mediumPadding * 0.5,
                        end: AppPadding.mediumPadding * 0.5,
                      ),
                      child: Text('${'Tickets_num'.tr()}$index'),
                    ),
                    const SizedBox(
                      width: AppPadding.mediumPadding * 0.1,
                    ),
                    const Icon(
                      Icons.calendar_month,
                      color: AppColors.secondColor,
                    ),
                    const SizedBox(
                      width: AppPadding.mediumPadding * 0.2,
                    ),
                    Text(
                      createdAt!,
                      style: AppStyles.subtitle100,
                    ),
                    const SizedBox(
                      width: AppPadding.mediumPadding * 0.4,
                    ),
                    const Icon(
                      Icons.watch_later,
                      color: AppColors.secondColor,
                    ),
                    const SizedBox(
                      width: AppPadding.mediumPadding * 0.3,
                    ),
                    const Text(
                      '?????? 15 ??????????',
                      style: AppStyles.subtitle100,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(AppPadding.mediumPadding),
              child: Text(
                newTicketCubit!.ticketData![index!].title!,
                style: AppStyles.title900,
              ).tr(),
            ),
            Container(
              padding: const EdgeInsets.all(AppPadding.mediumPadding),
              child: Text(
                newTicketCubit!.ticketData![index!].description!,
                style: AppStyles.title300,
              ).tr(),
            ),
            ProfileTextFormField(
              labelText: '',
              hintText: 'Write your comment',
              maxLines: 3,
              textEditingController: newTicketCubit!.comment,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'description_is_required'.tr();
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ReusedRoundedButton(
              onPressed: () async {
                await newTicketCubit!.addComment(
                  context,
                  newTicketCubit!.ticketData![index!].id!,
                );
              },
              text: "send".tr(),
              color: AppColors.cPrimary,
              textColor: AppColors.offWhite,
            ),
          ],
        ),
      ),
    );
  }
}
