import 'package:flutter/material.dart';
import '../../../base/widgets/subtitle_view.dart';
import '../widgets/categories_panel.dart';
import '../widgets/home_appBar.dart';
import '../widgets/newest_panal.dart';
import '../widgets/top_offers_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 24),
            //================================= Home Bar ===================================
            //==============================================================================
            //==============================================================================
            HomeBar(),
            SizedBox(height: 24),
            //================================= Top Offers =================================
            //==============================================================================
            //==============================================================================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SubtitleView(text: "Top Offers"),
            ),
            TopOffersPanel(),
            //================================= Newer Books =================================
            //==============================================================================
            //==============================================================================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SubtitleView(text: "Newest"),
            ),
            NewerBooksPanel(),
            //================================= Categories =================================
            //==============================================================================
            //==============================================================================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SubtitleView(text: "Categories"),
            ),
            CategoriesPanel(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
