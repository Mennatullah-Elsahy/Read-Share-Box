import 'package:flutter/material.dart';

import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';

class ListBookStoreCardView extends StatefulWidget {
  const ListBookStoreCardView({
    super.key,
  });

  @override
  State<ListBookStoreCardView> createState() => _ListBookStoreCardViewState();
}

class _ListBookStoreCardViewState extends State<ListBookStoreCardView> {
  bool isInit = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () => setState(() => isInit = true));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CustomNavigator.push(Routes.userPostDetails),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: isInit ? 1 : 0,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title", style: Theme.of(context).textTheme.headline6),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                                  ),
                                  const SizedBox(width: 8),
                                  Text("Author", style: Theme.of(context).textTheme.bodyText2),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
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
                              const SizedBox(width: 8),
                              const Icon(Icons.bookmark_border, size: 20),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Theme.of(context).hintColor),
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
      ),
    );
  }
}
