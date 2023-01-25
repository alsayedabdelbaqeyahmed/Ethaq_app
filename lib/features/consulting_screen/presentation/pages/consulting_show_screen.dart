import 'package:easy_localization/easy_localization.dart';
import 'package:ethaqapp/config/themes/colors.dart';
import 'package:ethaqapp/core/components/buttons/rounded_button.dart';
import 'package:ethaqapp/core/utils/app_sizes.dart';
import 'package:ethaqapp/core/utils/most_used_extensions.dart';
import 'package:ethaqapp/features/consulting_screen/presentation/cubit/consulting_cubit.dart';
import 'package:ethaqapp/features/consulting_screen/presentation/pages/consulting_grid.dart';
import 'package:ethaqapp/features/home_screen/presentation/widgets/consulting_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultingShowScreen extends StatelessWidget {
  const ConsultingShowScreen({Key? key , required this.id ,required this.type}) : super(key: key);

  final String id;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('consulting_show'.tr()+' $id'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ConsultingContainer(
              type: type,
              date: '2023-01-24' ?? '',
              id: id ?? '',
              details: 'عميل فردي عميل عميل' ?? '',
            ),
          ),
          Container(
            width: context.width * 0.4,
            margin: const EdgeInsets.symmetric(
              horizontal: AppPadding.largePadding,
            ),
            child: ReusedRoundedButton(
              text: "pay",
              onPressed: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: const Flexible(
              child: Text('''
 سيتواصل معك محاميك خلال "8 ساعة"
    مدة الاستشارة "15" دقيقة, وتستطيع التمديد بعد انتهاء الوقت
    سيكون معك المحامي /المستشار مدة ربع ساعة يجيبك علي استفساراتك القانونية, وللعلم فإن المحادثة توفر ميزة التوقف التلقائي لعداد الوقت في حال عدم تفاعل المحامي /المستشار مدة 10 ثواني متواصلة, حفظأ لحقك في وقت الاستشارة, وتحسبأ لأي ظرف قد يواجه المحامي / المستشار 
          '''),
            )
          ),

        ],
      ),
    );
  }
}
