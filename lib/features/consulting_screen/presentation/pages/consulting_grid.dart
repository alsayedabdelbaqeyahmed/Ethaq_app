import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/core/components/reuse_functions.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/consulting_screen/data/models/consulting_model.dart';
import 'package:ethaqapp/features/consulting_screen/presentation/pages/consulting_show_screen.dart';
import 'package:flutter/material.dart';
import '../../../home_screen/presentation/widgets/consulting_container.dart';

class ConsultingGrid extends StatelessWidget {
  const ConsultingGrid({Key? key, required this.type ,required this.consultingModel}) : super(key: key);
  final String type;
  final ConsultingModel consultingModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(AppPadding.mediumPadding),
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.2,
      ),
      itemCount: consultingModel.data
          ?.consulting?.length,
      itemBuilder: (context, index) {
        final String? id = consultingModel.data?.consulting![index].id.toString();
        final String? details = consultingModel.data
            ?.consulting![index].client.name
            .toString();
        final String date = DateFormat('yyyy-MM-dd').format(
            DateTime.parse(consultingModel
                .data?.consulting![index].created_at));

        return InkWell(
          onTap: (){
            navigateTo(context, ConsultingShowScreen(
                id: id ?? '',
                type: type,
            ),);
          },
          child: ConsultingContainer(
            type: type,
            date: date ?? '',
            id: id ?? '',
            details: details ?? '',
          ),
        ); //Any widget you want to use.
      },
    );
  }
}
