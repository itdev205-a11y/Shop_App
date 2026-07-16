import 'package:flutter/material.dart';
import 'package:store_app/Screens.dart';
import 'package:store_app/Screens/Home_Screen.dart';


class AppBarCheckout extends StatelessWidget
    implements PreferredSizeWidget {


  const AppBarCheckout({
    super.key,
  });



  @override
  Widget build(BuildContext context) {


    return AppBar(

      backgroundColor: Colors.white,

      elevation: 0,

      centerTitle: true,


      title: const Text(

        "Checkout",

        style: TextStyle(

          color: Colors.black,

          fontWeight: FontWeight.bold,

          fontSize: 20,

        ),

      ),



      leading: Container(

        margin: const EdgeInsets.all(8),


        decoration: BoxDecoration(

          color: Colors.grey.shade100,

          shape: BoxShape.circle,

        ),


        child: IconButton(

          onPressed: () {

            Navigator.pop(context);

          },


          icon: const Icon(

            Icons.arrow_back,

            color: Colors.black,

          ),

        ),

      ),




      actions: [


        Container(

          margin: const EdgeInsets.all(8),


          decoration: BoxDecoration(

            color: Colors.grey.shade100,

            shape: BoxShape.circle,

          ),


          child: IconButton(

            onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => Screens(),));


            },


            icon: const Icon(

              Icons.home_outlined,

              color: Colors.black,

            ),
          ),
        )
      ],
    );
  }




  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

}