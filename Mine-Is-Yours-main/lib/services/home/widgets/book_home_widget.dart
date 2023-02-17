import 'package:flutter/material.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/models/post_model.dart';

class BookHomeWidget extends StatelessWidget {
  const BookHomeWidget({
    Key? key,
    required this.model
  }) : super(key: key);
  final PostModel model;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: model.book!.id!,
      child: GestureDetector(
        onTap: (){RouterGenerator.push(Routes.bookDetails,arguments: model);},
        child: Container(
            width: 130,
            height: 200,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(model.book!.image!))
            ),
          ),
      ),
    );
  }
}
