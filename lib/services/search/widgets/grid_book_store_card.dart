import 'package:flutter/material.dart';

import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';

class GridBookStoreCardView extends StatefulWidget {
  const GridBookStoreCardView({
    super.key,
  });

  @override
  State<GridBookStoreCardView> createState() => _GridBookStoreCardViewState();
}

class _GridBookStoreCardViewState extends State<GridBookStoreCardView> {
  bool isInit = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () => setState(() => isInit = true));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomNavigator.push(Routes.userPostDetails),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: isInit ? 1 : 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(.1),
                blurRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Hero(
                tag: "image",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network("https://th.bing.com/th/id/OIP.Svt2jL8zI91oGCn0yaSXlQHaLH?pid=ImgDet&rs=1", height: 150, width: 90, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Title", style: Theme.of(context).textTheme.headline6),
                        const Icon(Icons.bookmark_border, size: 20),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                        ),
                        const SizedBox(width: 8),
                        Text("Author", style: Theme.of(context).textTheme.bodyText2),
                        const Expanded(child: SizedBox()),
                        Container(
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.secondary.withOpacity(.03),
                          ),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: "\$",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16, color: Colors.green),
                                children: [
                                  TextSpan(
                                    text: "100",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16, color: Theme.of(context).colorScheme.secondary),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).hintColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
