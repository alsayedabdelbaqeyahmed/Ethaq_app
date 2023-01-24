import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:flutter/material.dart';
import '../widgets/requests_container.dart';
import '../widgets/see_all_title.dart';

class ConsultingSlider extends StatelessWidget {
  const ConsultingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeeAllTitle(
          onTap: () {},
          title: 'consulting',
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.largePadding,
            vertical: AppPadding.padding16,
          ),
          child: Row(
            children: List.generate(
              3,
                  (index) => Container(
                      margin: EdgeInsetsDirectional.only(
                        end: context.width * 0.04,
                      ),
                      child: const RequestContainer(),),
            ),
          ),
        ),
      ],
    );
  }
}
