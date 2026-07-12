

import 'package:flutter/material.dart';

class SelectColor extends StatefulWidget {
  const SelectColor({super.key});

  @override
  State<SelectColor> createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {

  final List<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.green,
  ];


  Color? selectedColor;


  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        const Text(
          "Select Color",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),


        const SizedBox(height: 15),


        Row(

          children: colors.map((color) {

            bool isSelected =
                selectedColor == color;


            return GestureDetector(

              onTap: () {

                setState(() {

                  selectedColor = color;

                });

              },


              child: Container(

                margin:
                const EdgeInsets.only(right: 15),


                width: 45,

                height: 45,


                decoration: BoxDecoration(

                  color: color,

                  shape: BoxShape.circle,


                  border: Border.all(

                    color: isSelected
                        ? Colors.black
                        : Colors.grey.shade300,

                    width: isSelected
                        ? 3
                        : 1,

                  ),

                ),


                child: isSelected

                    ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )

                    : null,

              ),

            );


          }).toList(),

        ),

      ],

    );

  }
}
