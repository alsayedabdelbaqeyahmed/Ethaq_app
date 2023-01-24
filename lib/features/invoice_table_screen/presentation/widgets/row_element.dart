import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/features/invoice_table_screen/presentation/widgets/row_text.dart';
import 'package:flutter/material.dart';

class RowElement extends StatelessWidget {
  const RowElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.smallRadius),
        ),
        child: Row(
          children: const [
            RowTableText('14'),
            RowTableText('14'),
            RowTableText('إستشارة'),
            RowTableText('100 ر.س'),
            RowTableText('2'),
            RowTableText('102'),
          ],
        ),
      ),
    );
  }
}
