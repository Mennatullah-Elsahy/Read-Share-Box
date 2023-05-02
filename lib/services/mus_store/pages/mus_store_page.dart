import 'package:flutter/material.dart';
import '../../../utilities/components/arrow_back.dart';
import '../../../utilities/components/custom_page_body.dart';
import '../../search/widgets/grid_book_store_card.dart';
import '../../search/widgets/list_book_store_card.dart';
import '../../search/widgets/search_appBar.dart';

class MusShopPage extends StatefulWidget {
  const MusShopPage({super.key});

  @override
  State<MusShopPage> createState() => _MusShopPageState();
}

class _MusShopPageState extends State<MusShopPage> {
  bool listData = true;
  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: ArrowBack(),
          ),
        ),
        title: const Text('Mus Shop', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
        titleSpacing: 8,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //================================= Search Bar =================================
          //==============================================================================
          //==============================================================================
          SearchAppBar(
            onListTap: () => setState(() => listData = !listData),
            onFilterTap: () {},
            isGrid: !listData,
          ),
          //=============================== Books Results ================================
          //==============================================================================
          //==============================================================================
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(height: 0, color: Colors.grey),
          ),
          Expanded(
            child: listData
                ? SingleChildScrollView(
                    padding: EdgeInsets.only(top: 16),
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: List.generate(5, (index) => ListBookStoreCardView()),
                      ),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: .57),
                    itemBuilder: (context, index) => GridBookStoreCardView(),
                  ),
          ),
        ],
      ),
    );
  }
}
