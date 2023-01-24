import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/config/themes/styles.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class RequestContainer extends StatelessWidget {
  const RequestContainer({
    Key? key,
    this.type,
  }) : super(key: key);
  final String? type;

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
                  children: const [
                    Icon(
                      Icons.sell_outlined,
                      color: AppColors.secondColor,
                      size: 24,
                    ),
                    SizedBox(
                      width: AppPadding.padding4,
                    ),
                    Text(
                      '14',
                      style: TextStyle(
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
                  child: FittedBox(child: Text(type ?? "متاح")),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppPadding.padding8,
          ),

          // date =====>>>
          Row(
            children: const [
              Icon(
                IconlyLight.calendar,
                color: AppColors.secondColor,
                size: 24,
              ),
              SizedBox(
                width: AppPadding.padding4,
              ),
              Text(
                '12/12/2021',
                style: TextStyle(
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
            child: Text(
              'تمثيل قانوني قضائي',
              style: AppStyles.title600.copyWith(
                height: 1,
                fontSize: 12,
              ),
            ),
          ),

          // type =====>>>
          const SizedBox(
            height: AppPadding.padding2,
          ),
          const FittedBox(
            child: Text(
              'تجاري',
              style: AppStyles.subtitle500,
            ),
          ),
        ],
      ),
    );
  }
}
