import 'package:flutter/material.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/routes/routes.dart';
import '../../../helpers/app_text_styles.dart';
import '../../home/models/post_model.dart';

class ListBookItem extends StatelessWidget {
  const ListBookItem({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:18.0),
      child: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            RouterGenerator.push(Routes.bookDetails,arguments: post);
          },
          child: SizedBox(
            height: 150,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Hero(
                      tag: post.book!.id!,
                      child: Container(
                        height: 120,
                        width: 75,
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: NetworkImage(post.book!.image!)),
                        )
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.book!.title ?? "",
                            style: AppTextStyles.w700.copyWith(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.person,size: 16,),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    child: Text(
                                      post.book!.owner!.name??"",
                                      style: AppTextStyles.w400.copyWith(
                                          fontSize: 12, color: AppColor.SUB_TEXT),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.price_change,size: 16,color: AppColor.APPROVED,),
                              SizedBox(width: 8),
                              Text(
                                (post.book!.points ?? 0).toString() ,
                                style: AppTextStyles.w700.copyWith(fontSize: 14,color: AppColor.APPROVED),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  "Open",
                                  style: AppTextStyles.w700.copyWith(
                                      fontSize: 16, color: Colors.black),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_right,size: 16,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Divider(height: 0),
              ],
            ),
          )),
    );
  }
}
