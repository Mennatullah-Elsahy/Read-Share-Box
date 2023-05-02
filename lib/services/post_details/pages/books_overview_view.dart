import 'package:flutter/material.dart';

import '../widgets/info_cards.dart';
import '../widgets/info_list_tile.dart';

class BookOverView extends StatelessWidget {
  const BookOverView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        //==========================================
        //==========================================
        //==========================================
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                  ),
                  const SizedBox(width: 8),
                  Expanded(child: Text("Author", style: Theme.of(context).textTheme.bodyText1)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(
                    child: InfoListTile(icon: "pages", label: "245  (pages)"),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: InfoListTile(icon: "calendar_outlined", label: "12-4-2022"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const Divider(height: 0),
        //==========================================
        //==========================================
        //==========================================
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: InfoCards(sectionTitle: "Condation", cardsLabels: ["New"]),
        ),
        const Divider(height: 0),
        //==========================================
        //==========================================
        //==========================================
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: InfoCards(sectionTitle: "Payment Method", cardsLabels: ["Cash", "Exhange"]),
        ),
        const Divider(height: 0),
        //==========================================
        //==========================================
        //==========================================
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Sellr Contacts"),
              const SizedBox(height: 8),
              Container(
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage("https://picsum.photos/200/300"),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ahmed", style: Theme.of(context).textTheme.headline5),
                          Divider(height: 14, color: Theme.of(context).dividerColor),
                          InfoListTile(label: "01023451859", icon: "phone_outlined"),
                          Divider(height: 14, color: Theme.of(context).dividerColor),
                          InfoListTile(label: "hamada.helbaw@gmail.com", icon: "email"),
                          Divider(height: 14, color: Theme.of(context).dividerColor),
                          InfoListTile(label: "El Mahallah sdfawet", icon: "location_outlined"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
