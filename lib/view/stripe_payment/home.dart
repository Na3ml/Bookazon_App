import 'package:bookazon/view/stripe_payment/payment_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';





class ButtonStripeScreen extends StatelessWidget {
  const ButtonStripeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: ()=>PaymentManager.makePayment(40, "EGP"), 
              child:const Text("Pay 20 dollar"),
              ),
          )
        ],
      ),
    );
  }
}