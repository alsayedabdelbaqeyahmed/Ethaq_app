import 'package:easy_localization/easy_localization.dart';

import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/components/widgets.dart';
import 'package:ethaqapp/core/utils/app_images.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/tickets_screen/presentation/cubit/new_ticket_cubit.dart';
import 'package:ethaqapp/features/tickets_screen/presentation/cubit/new_ticket_state.dart';
import 'package:ethaqapp/features/tickets_screen/presentation/pages/new_tickets_screen.dart';
import 'package:ethaqapp/features/tickets_screen/presentation/pages/tickets_details.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tickets').tr(),
      ),
      body: BlocProvider(
        create: (context) => NewTicketCubit()..getAllTicket(context),
        child: BlocConsumer<NewTicketCubit, NewTicketState>(
          listener: (context, state) {},
          builder: (ctx, state) {
            final newTicketCubit = NewTicketCubit.get(ctx);

            return Column(
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: newTicketCubit.ticketData!.length,
                    // ignore: unnecessary_parenthesis
                    itemBuilder: ((context, index) {
                      final date = newTicketCubit.ticketData![0].createdAt!
                          .replaceAll(RegExp('T18:25:42.000000Z'), '');
                      return Container(
                        padding: const EdgeInsets.all(AppPadding.mediumPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Color(0xffDFAF37),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  date,
                                  style: AppStyles.subtitle100,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: AppPadding.largePadding,
                                  ),
                                  child: Text(
                                    newTicketCubit.ticketData![index].title!,
                                    style: AppStyles.title600,
                                  ).tr(),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                navigateTo(
                                  context,
                                  TicketsDetailsScreen(
                                    index: index,
                                    newTicketCubit: newTicketCubit,
                                    createdAt: date,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                )

                // Container(
                //   padding: const EdgeInsets.all(AppPadding.mediumPadding),
                //   decoration: BoxDecoration(
                //     color: AppColors.cGrayOff.withOpacity(.4),
                //     borderRadius: BorderRadius.circular(AppBorderRadius.mediumRadius),
                //   ),
                //   child: Text('${'you_have'.tr()}0${'ticket'.tr()}'),
                // ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsetsDirectional.only(
          start: AppPadding.largePadding,
          end: AppPadding.largePadding,
          bottom: AppPadding.largePadding,
        ),
        child: ReusedRoundedButton(
          onPressed: () {
            navigateTo(context, const NewTicketsScreen());
          },
          text: 'create_new_ticket',
          rowWidget: const AssetSvgImage(
            AppImages.ticket2Icon,
          ),
        ),
      ),
    );
  }
}
