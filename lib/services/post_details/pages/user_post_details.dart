import 'package:flutter/material.dart';
import '../../../utilities/components/arrow_back.dart';
import '../../../utilities/components/custom_btn.dart';
import '../../../utilities/components/custom_page_body.dart';
import '../widgets/buy_request_bottomsheet.dart';
import '../widgets/exchange_request_bottomsheet.dart';
import '../widgets/information_app_bar.dart';
import 'book_details_view.dart';
import 'books_overview_view.dart';

class UserPostDetailsPage extends StatefulWidget {
  const UserPostDetailsPage({super.key});

  @override
  State<UserPostDetailsPage> createState() => _UserPostDetailsPageState();
}

class _UserPostDetailsPageState extends State<UserPostDetailsPage> {
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
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 16, top: 16),
            child: ArrowBack(),
          ),
        ),
        title: Text(
          "Post Details",
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
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
                          const Icon(Icons.favorite, color: Colors.red, size: 20),
                        ],
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
                const SizedBox(height: 86),
              ],
            ),
          ),
          //==========================================
          //==========================================
          //==========================================
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomBtn(
                        text: "Exchange",
                        buttonColor: Colors.white,
                        textColor: Theme.of(context).colorScheme.primary,
                        borderColor: Theme.of(context).colorScheme.primary,
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                            ),
                            builder: (context) => const ExchangeRequestBottomSheet(),
                          );
                          // ignore: use_build_context_synchronously
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomBtn(
                        text: "Buy Now",
                        buttonColor: Theme.of(context).colorScheme.primary,
                        textColor: Colors.white,
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                            ),
                            builder: (context) => const BuyRequestBottomSheet(),
                          );
                          // ignore: use_build_context_synchronously
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          )
        ],
      ),
    );
  }
}
