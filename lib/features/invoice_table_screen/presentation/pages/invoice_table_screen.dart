import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/all_table_items.dart';

class InvoiceTableScreen extends StatelessWidget {
  const InvoiceTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('invoice').tr(),
      ),
      // invoice table horizontal scroll and rounded row border =====>>>
      body: const AllTableItems(),
    );
  }
}
