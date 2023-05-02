import 'package:flutter/material.dart';
import '../../../handlers/icon_handler.dart';
import '../../../utilities/components/custom_btn.dart';
import '../../../utilities/theme/text_styles.dart';

class UserRequestCard extends StatefulWidget {
  const UserRequestCard({
    super.key,
  });

  @override
  State<UserRequestCard> createState() => _UserRequestCardState();
}

class _UserRequestCardState extends State<UserRequestCard> {
  bool isColapsed = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // height: 80,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: Theme.of(context).colorScheme.primaryContainer),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Theme.of(context).colorScheme.primary,
                backgroundImage: const NetworkImage("https://th.bing.com/th/id/OIP.OR6j_dwro-MvpN8v1L6cKQHaHa?pid=ImgDet&rs=1"),
              ),
              const SizedBox(width: 16),
              Text("Ahmed", style: Theme.of(context).textTheme.headline6!),
              const Spacer(),
              Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).colorScheme.primary.withOpacity(.1),
                ),
                child: Center(child: Text("Exchange", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).colorScheme.primary))),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    drawSvgIcon("calendar", iconColor: Theme.of(context).hintColor, height: 16, width: 16),
                    const SizedBox(width: 8),
                    Text("12/12/2021", style: Theme.of(context).textTheme.bodyText2!),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    drawSvgIcon("phone", iconColor: Theme.of(context).hintColor, height: 16, width: 16),
                    const SizedBox(width: 8),
                    Text("01065421230", style: Theme.of(context).textTheme.bodyText2!),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 24,
            thickness: .5,
            color: Theme.of(context).dividerColor,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network("https://th.bing.com/th/id/OIP.x6lmINxRTu7atZJI0M8PoAHaK_?pid=ImgDet&rs=1", height: 105, width: 75, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Princess the Cat cover", style: AppTextStyles.w600.copyWith(fontSize: 20)),
                    const SizedBox(height: 4),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: AppTextStyles.w500.copyWith(fontSize: 14, color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomBtn(
            text: "Accept",
            onTap: () {},
          ),
          // AnimatedCrossFade(
          //   firstChild: Column(children: widget.infos),
          //   secondChild: const SizedBox(),
          //   crossFadeState: isColapsed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          //   sizeCurve: Curves.linear,
          //   duration: const Duration(milliseconds: 500),
          // ),
        ],
      ),
    );
  }
}
