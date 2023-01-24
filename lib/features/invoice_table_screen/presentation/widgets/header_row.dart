import 'package:flutter/material.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/header_text.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffE1F4FF),
          borderRadius: BorderRadius.circular(AppBorderRadius.smallRadius),
        ),
        child: Row(
          children: const [
            TableHeaderText('invoice_number'),
            TableHeaderText('contract_number'),
            TableHeaderText('invoice_type'),
            TableHeaderText('invoice_price'),
            TableHeaderText('value_added_tax'),
            TableHeaderText('total_price'),
          ],
        ),
      ),
    );
  }
}
