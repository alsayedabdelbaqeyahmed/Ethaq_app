import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:ethaqapp/features/invoice_table_screen/presentation/widgets/header_row.dart';
import 'package:ethaqapp/features/invoice_table_screen/presentation/widgets/row_element.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllTableItems extends StatelessWidget {
  const AllTableItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsetsDirectional.only(
        end: context.width * 0.4,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderRow(),
            for (var i = 0; i < 8; i++) const RowElement(),
          ]
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.padding2,
                  ),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
