import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';
import '../Widgets/Widgets_Checkout/AdressStep.dart';
import '../Widgets/Widgets_Checkout/OrderStep.dart';


class Checkout extends StatefulWidget {

  const Checkout({super.key});


  @override
  State<Checkout> createState() => _CheckoutState();

}



class _CheckoutState extends State<Checkout> {
  final GlobalKey<FormState> addressKey = GlobalKey<FormState>();

  int currentStep = 0;

  final TextEditingController addressController =
  TextEditingController();
  final TextEditingController emailController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    final cart = context.watch<CartProvider>();

    return Scaffold(

      backgroundColor:
      const Color(0xffF7F7F7),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme:
        const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [

            const SizedBox(height:20),
            Row(
              children: [

                stepItem(
                  0,
                  "Order",
                  Icons.shopping_cart,
                ),

                progressLine(0),

                stepItem(
                  1,
                  "Address",
                  Icons.location_on,
                ),

                progressLine(1),

                stepItem(
                  2,
                  "Payment",
                  Icons.payment,
                ),
              ],
            ),

            const SizedBox(height:20),

            Expanded(

              child: Padding(
                padding:
                const EdgeInsets.all(20),
                child:
                AnimatedSwitcher(
                  duration:
                  const Duration(
                    milliseconds:300,
                  ),

                  child:
                  buildContent(cart),

                ),
              ),
            ),

            Container(

              padding:
              const EdgeInsets.all(20),
              color:
              Colors.white,
              child:
              Row(
                children: [
                  if(currentStep > 0)
                    Expanded(
                      child:
                      OutlinedButton(
                        onPressed: (){
                          setState(() {
                            currentStep--;
                          });
                        },
                        child:
                        const Text(
                          "Back",
                        ),
                      ),
                    ),

                  if(currentStep > 0)

                    const SizedBox(
                      width:10,
                    ),
                  Expanded(

                    child:
                    ElevatedButton(

                      onPressed: (){

                        if(currentStep < 2){

                          setState(() {
                            currentStep++;
                          });
                        }
                        else{

                          ScaffoldMessenger
                              .of(context)
                              .showSnackBar(
                            const SnackBar(
                              content:
                              Text(
                                "Order Completed 🎉",
                              ),
                            ),
                          );
                        }
                      },

                      style:
                      ElevatedButton.styleFrom(
                        backgroundColor:
                        Colors.black,
                        padding:
                        const EdgeInsets.all(15),

                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                      ),
                      child:
                      Text(
                        currentStep == 2
                            ?
                        "Pay Now"
                            :
                        "Continue",
                        style:
                        const TextStyle(

                          color:
                          Colors.white,

                          fontSize:16,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget stepItem(
      int index,
      String title,
      IconData icon,
      ){

    bool active =
        currentStep >= index;

    return Column(
      children: [
        CircleAvatar(
          radius:25,
          backgroundColor:

          active
              ?
          Colors.black
              :
          Colors.grey.shade300,

          child:
          Icon(
            icon,
            color:
            active
                ?
            Colors.white
                :
            Colors.grey,

          ),

        ),

        const SizedBox(height:8),

        Text(
          title,
          style:
          TextStyle(
            fontWeight:
            FontWeight.bold,

            color:
            active
                ?
            Colors.black
                :
            Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildContent(CartProvider cart){

    if(currentStep == 0){
      return OrderStep();

    }

    if(currentStep == 1){

      return AddressStep(
        formKey: addressKey,
      );

    }

    return paymentStep();
  }
////////////////////////////



////////////////////////////////////////////////




///////////////////////////////////////////////



  Widget paymentStep(){


    return Column(

      children: [
        paymentItem(
          Icons.credit_card,
          "Credit Card",
        ),

        paymentItem(
          Icons.account_balance_wallet,
          "PayPal",
        ),

        paymentItem(
          Icons.money,
          "Cash On Delivery",
        ),
      ],
    );
  }

  Widget paymentItem(
      IconData icon,
      String title,
      ){
    return Container(
      margin:
      const EdgeInsets.only(
        bottom:15,
      ),

      padding:
      const EdgeInsets.all(18),

      decoration:
      boxDecoration(),

      child:
      Row(
        children: [

          Icon(
            icon,
            size:30,
          ),

          const SizedBox(width:15),

          Text(
            title,
            style:
            const TextStyle(
              fontSize:17,

              fontWeight:
              FontWeight.bold,

            ),
          ),
        ],
      ),
    );
  }


///////////////////////////

  InputDecoration inputDecoration(
      String text,
      IconData icon,
      ){

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
    );
  }

  BoxDecoration boxDecoration(){

    return BoxDecoration(
      color:
      Colors.white,

      borderRadius:
      BorderRadius.circular(20),
      boxShadow:[

        BoxShadow(

          color:
          Colors.black.withOpacity(0.05),

          blurRadius:10,

        ),
      ],
    );
  }

  Widget progressLine(int index) {

    return Expanded(

      child: Container(

        height: 3,

        margin: const EdgeInsets.symmetric(
          horizontal: 8,
        ),


        color: currentStep > index
            ? Colors.black
            : Colors.grey.shade300,
      ),
    );
  }
}

////////////////

