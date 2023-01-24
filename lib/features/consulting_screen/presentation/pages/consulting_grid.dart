import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../home_screen/presentation/widgets/consulting_container.dart';

class ConsultingGrid extends StatelessWidget {
  const ConsultingGrid({Key? key, required this.type}) : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppPadding.mediumPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.2,
      ),
      itemCount: 20,
      itemBuilder: (context, index) => ConsultingContainer(type: type),
    );
  }
}
