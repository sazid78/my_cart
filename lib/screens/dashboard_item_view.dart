import 'package:flutter/material.dart';
import 'package:my_cart/models/dashboard_model.dart';

class DashboardItemView extends StatelessWidget {
  final DashboardModel model;
  const DashboardItemView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, model.routeName);
      },
      child: Card(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(model.iconData,size: 50,color: Colors.deepPurple,),
              const SizedBox(height: 10,),
              Text(model.title,style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
