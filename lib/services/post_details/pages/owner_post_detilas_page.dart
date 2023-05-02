import 'package:flutter/material.dart';
import '../../../handlers/icon_handler.dart';
import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';
import '../../../utilities/components/arrow_back.dart';
import '../../../utilities/components/custom_page_body.dart';
import '../../../utilities/theme/text_styles.dart';
import '../widgets/information_app_bar.dart';
import 'book_details_view.dart';
import 'books_overview_view.dart';

class OwnerPostDetailsPage extends StatefulWidget {
  const OwnerPostDetailsPage({super.key});

  @override
  State<OwnerPostDetailsPage> createState() => _OwnerPostDetailsPageState();
}

class _OwnerPostDetailsPageState extends State<OwnerPostDetailsPage> {
  List<Widget> views = [
    const BookOverView(),
    const BookDetailsView(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16, top: 16),
            child: ArrowBack(),
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert_outlined, size: 22, color: Theme.of(context).colorScheme.secondary),
            offset: const Offset(0, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onSelected: (value) {
              if (value == 1) {
                CustomNavigator.push(Routes.userRequests);
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 1,
                  // row has two child icon and text.
                  child: Row(
                    children: [
                      drawSvgIcon("request", width: 16, height: 16),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text(
                        "Requests",
                        style: AppTextStyles.w600.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
        title: Text(
          "Post Details",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                //==========================================
                //==========================================
                //==========================================
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, shape: BoxShape.circle),
                      ),
                      Hero(
                        tag: "image",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network("https://th.bing.com/th/id/OIP.Svt2jL8zI91oGCn0yaSXlQHaLH?pid=ImgDet&rs=1", height: 250, width: 150, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                //==========================================
                //==========================================
                //==========================================
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Post Title",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
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
                      )
                    ],
                  ),
                ),
                //==========================================
                //==========================================
                //==========================================
                const SizedBox(height: 16),
                Divider(height: 0, color: Theme.of(context).dividerColor),
                InformationTapBar(
                  overViewTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  detailsTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
                Divider(height: 0, color: Theme.of(context).dividerColor),
                //==========================================
                //==========================================
                //==========================================
                views[index],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
