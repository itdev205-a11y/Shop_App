// استيراد مكتبة Curved Navigation Bar
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// استيراد مكتبة Flutter الأساسية
import 'package:flutter/material.dart';

// استيراد صفحات التطبيق
import 'package:store_app/Screens/Home_Screen.dart';
import 'package:store_app/Screens/Favourite_Screen.dart';
import 'package:store_app/Screens/Profile_Screen.dart';

// الشاشة الرئيسية التي تحتوي على الـ Bottom Navigation
class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {

  // رقم الصفحة الحالية
  int currentIndex = 0;

  // جميع الصفحات التي سيتم التنقل بينها
  static const List<Widget> pages = [
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  // أيقونات الـ Navigation Bar
  static const List<IconData> icons = [
    Icons.home,
    Icons.favorite_outline,
    Icons.person,
  ];

  // تغيير الصفحة عند الضغط على أيقونة
  void changePage(int index) {
    if (currentIndex == index) return;

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    // معرفة هل التطبيق Dark Mode أم لا
    final bool isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(

      // يجعل الـ BottomNavigationBar يظهر فوق الـ body
      extendBody: true,

      // يعرض الصفحة الحالية مع الاحتفاظ بحالة باقي الصفحات
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      // شريط التنقل السفلي
      bottomNavigationBar: Padding(

        // المسافة حول الـ Navigation Bar
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),

        child:DecoratedBox(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(
            isDark ? 0.25 : 0.08,
          ),
          blurRadius: 25,
          offset: const Offset(0, 8),
        ),
      ],
    ),
          child: CurvedNavigationBar(

            // الأيقونة المحددة
            index: currentIndex,

            // ارتفاع الشريط
            height: 60,

            // لون الخلفية خلف الـ Navigation
            backgroundColor: Colors.transparent,

            // لون الشريط نفسه
            color: isDark
                ? Colors.grey.shade900
                : Colors.white,

            // لون الدائرة المتحركة
            buttonBackgroundColor:
            isDark ? Colors.white : Colors.black,

            // مدة الحركة
            animationDuration:
            const Duration(milliseconds: 250),

            // إنشاء الأيقونات
            items: List.generate(
              icons.length,
                  (index) => _buildIcon(
                icon: icons[index],
                selected: currentIndex == index,
                isDark: isDark,
              ),
            ),

            // عند الضغط على أيقونة
            onTap: changePage,
          ),
        ),
      ),
    );
  }

  // تصميم كل أيقونة
  Widget _buildIcon({
    required IconData icon,
    required bool selected,
    required bool isDark,
  }) {

    return AnimatedScale(

      // مدة التكبير
      duration: const Duration(milliseconds: 250),

      // حجم الأيقونة عند التحديد
      scale: selected ? 1.15 : 1,

      child: Icon(

        // الأيقونة
        icon,

        // حجمها
        size: 28,

        // لونها
        color: selected
            ? (isDark
            ? Colors.black
            : Colors.white)
            : Colors.grey,
      ),
    );
  }
}