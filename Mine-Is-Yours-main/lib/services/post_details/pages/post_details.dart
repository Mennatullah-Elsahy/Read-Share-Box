import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mus_app/components/animated_widgets.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/helpers/app_text_styles.dart';
import 'package:mus_app/helpers/media_query_helper.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/models/post_model.dart';
import 'package:mus_app/services/new_post/widgets/custom_btn.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: MediaQueryHelper.width,
        height: MediaQueryHelper.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24,),
              InkWell(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  RouterGenerator.pop();
                },
              ),
              Expanded(
                child: ListAnimator(
                  data: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Center(
                        child: Text(
                          post.book!.title!,
                          style: AppTextStyles.w800.copyWith(fontSize: 32),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: post.book!.id!,
                          child: Container(
                            width: 200,
                            height: 300,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(post.book!.image!)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Book Details",
                        style: AppTextStyles.w800.copyWith(fontSize: 28),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DetailElement(
                              icon: Icons.pages,
                              value: post.book!.pages.toString(),
                            ),
                            SizedBox(width: 24),
                            DetailElement(
                              icon: Icons.star_rate_rounded,
                              value: post.book!.state.toString(),
                            ),
                            SizedBox(width: 24),
                            DetailElement(
                              icon: Icons.language,
                              value: post.book!.lang.toString(),
                            ),
                          ],
                        ),
                        SizedBox(height: 18),
                        InkWell(
                          onTap: () {
                            RouterGenerator.push(Routes.myProfile);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          post.book!.owner!.image!),
                                      fit: BoxFit.contain),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                post.book!.owner!.name!,
                                style: AppTextStyles.w400.copyWith(
                                    fontSize: 18, color: AppColor.SUB_HEADER),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Divider(height: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Book Details",
                        style: AppTextStyles.w800.copyWith(fontSize: 28),
                      ),
                    ),
                    Text(
                      post.book!.describtion!,
                      style: AppTextStyles.w400.copyWith(fontSize: 24),
                    )
                  ],
                ),
              ),
              SizedBox(height: 24,),
              Row(
                children: [
                  Expanded(
                      child: CustomBtn(
                    icon: Icons.check,
                    text: "Request",
                    onTap: () {},
                  )),
                  SizedBox(width: 16),
                  Expanded(
                      child: CustomBtn(
                    icon: Icons.message_rounded,
                    text: "Comment",
                    onTap: () {},
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class DetailElement extends StatelessWidget {
  const DetailElement({super.key, required this.value, required this.icon});
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: AppColor.SUB_HEADER,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style:
              AppTextStyles.w600.copyWith(fontSize: 18, color: AppColor.HEADER),
        )
      ],
    );
  }
}
