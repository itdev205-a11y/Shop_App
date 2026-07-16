import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:store_app/Widgets/Widgets_HomeScreen/Haeder.dart';
import 'package:store_app/Widgets/Widgets_HomeScreen/Row_Fashion.dart';
import 'package:store_app/Widgets/Widgets_HomeScreen/textfield_search.dart';

import '../Widgets/Widgets_HomeScreen/Category+see all.dart';
import '../Widgets/Widgets_HomeScreen/TabBar_HomeScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Header()
            // Widget الذي سيتم تطبيق الحركة عليه


        // بدء سلسلة الـ Animations لهذا الـ Widget
            .animate()

        // إضافة تأثير التلاشي (Fade)
            .fade(



          // مدة تنفيذ تأثير التلاشي
          // 300.ms تعني 300 مللي ثانية = 0.3 ثانية
          duration: 300.ms,

        )

        // إضافة حركة عمودية (Slide من الأعلى أو الأسفل)
            .slideX(

          // نقطة بداية الحركة على المحور Y
          // القيمة السالبة تعني يبدأ من الأعلى
          // -0.1 تعني يتحرك من أعلى بمقدار 10% من حجمه
          begin: -0.1,

        ),
                const SizedBox(height: 10),

                TextfieldSearch()
                    .animate()
                    .fade(delay: 200.ms)
                    .slideX(begin: -0.2),

                const SizedBox(height: 10),

                RowFashion()
                    .animate()
                    .fade(delay: 400.ms)
                    .slideX(begin: 0.2),

                const SizedBox(height: 25),

                CategorySeeAll()
                    .animate()
                    .fade(delay: 400.ms)
                    .slideY(begin: 0.2),

                const SizedBox(height: 15),

                TabbarHomescreen()
                    .animate()
                    .fade(delay: 400.ms)
                    .scale(begin: const Offset(0.9, 0.9)),

              ]
          ),
        ),
      ),
    );
  }
}