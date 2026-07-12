import 'package:flutter/material.dart';


class AddressStep extends StatefulWidget {

  final GlobalKey<FormState> formKey;

  const AddressStep({
    super.key,
    required this.formKey,
  });


  @override
  State<AddressStep> createState() => _AddressStepState();

}



class _AddressStepState extends State<AddressStep> {


  final TextEditingController addressController =
  TextEditingController();


  final TextEditingController emailController =
  TextEditingController();



  @override
  void dispose() {

    addressController.dispose();

    emailController.dispose();

    super.dispose();

  }




  @override
  Widget build(BuildContext context) {


    return Form(

      key: widget.formKey,


      child: Column(

        children: [


          TextFormField(

            controller:
            addressController,


            validator: (value){

              if(value == null || value.isEmpty){

                return "Please enter your address";

              }

              return null;

            },


            decoration:
            inputDecoration(

              "Address",

              Icons.location_on,

            ),

          ),



          const SizedBox(height:15),




          TextFormField(

            controller:
            emailController,


            keyboardType:
            TextInputType.emailAddress,


            validator: (value){

              if(value == null || value.isEmpty){

                return "Please enter your email";

              }


              if(!value.contains("@")){

                return "Enter a valid email";

              }


              return null;

            },


            decoration:
            inputDecoration(

              "Email",

              Icons.email,

            ),

          ),



        ],

      ),

    );

  }






  InputDecoration inputDecoration(
      String text,
      IconData icon,
      ) {


    return InputDecoration(

      labelText:text,


      prefixIcon:
      Icon(icon),


      filled:true,


      fillColor:
      Colors.white,


      border:
      OutlineInputBorder(

        borderRadius:
        BorderRadius.circular(15),

        borderSide:
        BorderSide.none,

      ),


      enabledBorder:
      OutlineInputBorder(

        borderRadius:
        BorderRadius.circular(15),

        borderSide:
        BorderSide.none,

      ),

    );


  }

}