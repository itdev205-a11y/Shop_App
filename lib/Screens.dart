// استيراد مكتبة الـ Bottom Navigation المنحنية
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// استيراد مكتبة Flutter الأساسية
import 'package:flutter/material.dart';

// استيراد صفحات التطبيق
import 'package:store_app/Screens/Home_Screen.dart';
import 'package:store_app/Screens/Favourite_Screen.dart';
import 'package:store_app/Screens/Profile_Screen.dart';

import 'Screens/Cart_Screen.dart';

// الواجهة الرئيسية التي تحتوي على الصفحات والـ Bottom Navigation
class Screens extends StatefulWidget {

  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {

  // رقم الصفحة الحالية المعروضة
  int currentIndex = 0;

  // قائمة صفحات التطبيق
  final List<Widget> pages = [

    // الصفحة الرئيسية
    HomeScreen(),

    // صفحة المفضلة
    FavouriteScreen(),

    CartScreen(),

    // صفحة الملف الشخصي
    ProfileScreen(),

  ];

  // الأيقونات الخاصة بكل صفحة
  final List<IconData> icons = const [

    Icons.home,

    Icons.favorite_outline,

    Icons.shopping_cart_rounded,

    Icons.person,

  ];

  // تغيير الصفحة عند الضغط على أيقونة
  void changePage(int index) {

    setState(() {

      // تحديث الصفحة الحالية
      currentIndex = index;

    });

  }

  @override
  Widget build(BuildContext context) {

    // معرفة هل الثيم الحالي داكن أم فاتح
    final bool isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return Scaffold(

      // يجعل الـ Body يمتد خلف الـ Bottom Navigation
      extendBody: true,

      // عرض الصفحات مع الاحتفاظ بحالة كل صفحة
      body: IndexedStack(

        // الصفحة التي سيتم عرضها
        index: currentIndex,

        // جميع صفحات التطبيق
        children: pages,

      ),

      // شريط التنقل السفلي
      bottomNavigationBar: Padding(

        // إضافة مسافة حول الـ Bottom Bar
        padding:
        const EdgeInsets.fromLTRB(
          18,
          0,
          18,
          18,
        ),

        child: DecoratedBox(

          // إضافة تصميم خارجي للـ Bottom Bar
          decoration: BoxDecoration(



            // تدوير الحواف
            borderRadius:
            BorderRadius.circular(60),

            // إضافة ظل
            boxShadow: [

              BoxShadow(

                // لون الظل حسب الثيم
                color:
                Colors.black.withOpacity(
                  isDark ? 0.25 : 0.08,
                ),

                // درجة نعومة الظل
                blurRadius: 25,

                // مكان الظل
                offset:
                const Offset(0,8),

              ),

            ],

          ),

          child: CurvedNavigationBar(

            // الصفحة المحددة حالياً
            index: currentIndex,

            // ارتفاع الـ Bottom Navigation
            height: 60,

            // جعل الخلفية شفافة حتى يظهر الـ Padding
            backgroundColor:
            Colors.transparent,

            // لون الشريط نفسه حسب الثيم
            color: isDark
                ? Colors.grey.shade900
                : Colors.white,

            // لون الدائرة المتحركة
            buttonBackgroundColor:
            isDark
                ? Colors.white
                : Colors.black,

            // مدة الحركة عند تغيير الصفحة
            animationDuration:
            const Duration(
              milliseconds: 250,
            ),

            // إنشاء جميع الأيقونات تلقائياً
            items: List.generate(

              // عدد الأيقونات
              icons.length,

                  (index) {

                return _buildIcon(

                  // الأيقونة الحالية
                  icon: icons[index],

                  // هل هذه الأيقونة هي المختارة؟
                  selected:
                  currentIndex == index,

                  // إرسال حالة الثيم
                  isDark: isDark,

                );
              },

            ),

            // استدعاء الدالة عند الضغط على أيقونة
            onTap: changePage,

          ),

        ),

      ),

    );

  }

  // ويدجت مسؤولة عن تصميم كل أيقونة
  Widget _buildIcon({

    // الأيقونة
    required IconData icon,

    // هل هي محددة؟
    required bool selected,

    // هل الثيم داكن؟
    required bool isDark,

    // مفتاح اختياري
    GlobalKey? key,

  }) {

    return AnimatedScale(

      // مدة تكبير وتصغير الأيقونة
      duration:
      const Duration(
        milliseconds:250,
      ),

      // تكبير الأيقونة عند اختيارها
      scale:
      selected ? 1.15 : 1,

      child: Icon(

        // المفتاح
        key: key,

        // الأيقونة
        icon,

        // حجم الأيقونة
        size: 28,

        // لون الأيقونة حسب حالتها والثيم
        color: selected

            ? (
            isDark
                ? Colors.black
                : Colors.white
        )

            : Colors.grey,

      ),

    );

  }

} 