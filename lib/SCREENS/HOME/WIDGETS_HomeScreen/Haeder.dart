import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

Widget HEADER(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.fromLTRB(16, 45, 16, 20),

    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.orange,
          Colors.yellow,
        ],
      ),

      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        // ================= TOP =================
        Row(
          children: [

            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),

            const SizedBox(width: 12),

            const Expanded(
              child: Text(
                "WELCOME",

                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),

            Lottie.asset(
              'assets/animation/Notification bell.json',
              width: 60,
              height: 60,

              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(
                    const ['**'],
                    value: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // ================= SEARCH =================
        Row(
          children: [

            _actionButton(
              icon: Icons.grid_view,
              onTap: () {
                context.push('/gridProducts');
              },
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Container(
                height: 52,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search fashion, shoes...',
                    prefixIcon: Icon(Icons.search),

                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            _actionButton(
              icon: Icons.tune,
              onTap: () {},
            ),
          ],
        ),
      ],
    ),
  );
}

// ================= BUTTON =================

Widget _actionButton({
  required IconData icon,
  required VoidCallback onTap,
}) {
  return Container(
    width: 52,
    height: 52,

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),

    child: IconButton(
      onPressed: onTap,
      icon: Icon(icon),
    ),
  );
}