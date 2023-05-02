import 'package:flutter/material.dart';

import '../../../utilities/theme/media.dart';

class InformationTapBar extends StatefulWidget {
  const InformationTapBar({
    super.key,
    required this.overViewTap,
    required this.detailsTap,
  });
  final Function() overViewTap, detailsTap;
  @override
  State<InformationTapBar> createState() => _InformationTapBarState();
}

class _InformationTapBarState extends State<InformationTapBar> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() => _index = 0);
              widget.overViewTap();
            },
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 2),
                  const Expanded(child: Center(child: Text("Over View"))),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 2,
                    width: _index == 0 ? (MediaHelper.width * 0.5) - 48 : 0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() => _index = 1);
              widget.detailsTap();
            },
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  const SizedBox(height: 2),
                  const Expanded(child: Center(child: Text("Book Details"))),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 2,
                    width: _index == 1 ? (MediaHelper.width * 0.5) - 48 : 0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
