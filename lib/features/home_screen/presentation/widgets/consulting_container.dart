import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ConsultingContainer extends StatelessWidget {
  const ConsultingContainer({
    Key? key,
    this.type,
    this.id,
    this.date,
    this.details,
  }) : super(key: key);

  final String? type;
  final String? id;
  final String? date;
  final String? details;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      padding: const EdgeInsets.all(AppPadding.padding10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppBorderRadius.defaultRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(
              0,
              3,
            ), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // number & status =====>>>
          Row(
            children: [
              // number =====>>>
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Icons.sell_outlined,
                      color: AppColors.secondColor,
                      size: 24,
                    ),
                    const SizedBox(
                      width: AppPadding.padding4,
                    ),
                    Text(
                      id ?? '0',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // status =====>>>
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.padding8,
                    vertical: AppPadding.padding4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.cPrimary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(
                      AppBorderRadius.radius8,
                    ),
                  ),
                  child: FittedBox(child: Text(type ?? "????????")),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppPadding.padding8,
          ),

          // date =====>>>
          Row(
            children: [
              const Icon(
                IconlyLight.calendar,
                color: AppColors.secondColor,
                size: 24,
              ),
              const SizedBox(
                width: AppPadding.padding4,
              ),
              Text(
                date ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 1,
            height: AppPadding.padding20,
          ),

          // title =====>>>
          FittedBox(
            child: Container (
              //width: MediaQuery.of(context).size.width*0.1,
              height: MediaQuery.of(context).size.width*0.1,
              child: Text(
                details ?? '',
                style: AppStyles.title600.copyWith(
                  height: 1,
                  fontSize: 12,
                ),
              ),
            ),
          ),

          // type =====>>>
          // const SizedBox(
          //   height: AppPadding.padding2,
          // ),
          // const FittedBox(
          //   child: Text(
          //     '??????????',
          //     style: AppStyles.subtitle500,
          //   ),
          // ),
        ],
      ),
    );
  }
}
