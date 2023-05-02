import 'package:flutter/material.dart';
import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';
import '../../../utilities/theme/text_styles.dart';

class PostCardView extends StatelessWidget {
  const PostCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomNavigator.push(Routes.ownerPostDetails),
      child: Column(
        children: [
          Row(children: [
            Hero(
              tag: "image",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network("https://th.bing.com/th/id/OIP.Svt2jL8zI91oGCn0yaSXlQHaLH?pid=ImgDet&rs=1", height: 150, width: 90, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title", style: AppTextStyles.w600.copyWith(fontSize: 20)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                        ),
                        const SizedBox(width: 8),
                        Text("Author", style: AppTextStyles.w500.copyWith(fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: AppTextStyles.w400.copyWith(color: Theme.of(context).hintColor, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 0, color: Theme.of(context).dividerColor),
          )
        ],
      ),
    );
  }
}
