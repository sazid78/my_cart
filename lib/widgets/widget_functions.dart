import 'package:flutter/material.dart';
import 'package:my_cart/widgets/snack_message.dart';

showSingleTextInputDialog({
  required BuildContext context,
  required String title,
  String positiveButtonText = 'OK',
  String negativeButtonText = 'Close',
  required Function(String) onSubmit,
}) {
  final  textController = TextEditingController();
  showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          backgroundColor: Colors.white,
          title: Text(title),
          content: Padding(
              padding: const EdgeInsets.all(12),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Enter $title'
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text(negativeButtonText)),
            TextButton(onPressed: (){
              if(textController.text.isEmpty) return;
              onSubmit(textController.text);
              Navigator.pop(context);
              appSnackMessage(context, "Category Added");
            }, child: Text(positiveButtonText)),
          ],
        );
      });
}
