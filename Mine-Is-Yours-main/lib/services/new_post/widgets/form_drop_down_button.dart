import 'package:flutter/material.dart';
import 'package:mus_app/components/animated_widgets.dart';
import 'package:mus_app/services/new_post/blocs/custom_model_sheet.dart';

class FormSelector extends StatefulWidget {
  const FormSelector({
    required this.label,
    required this.value,
    required this.onTap,
    required this.data,
    Key? key,
  }) : super(key: key);
  final String? label;
  final CustomModelSheet? value;
  final Function(CustomModelSheet) onTap;
  final List<CustomModelSheet> data;

  @override
  State<FormSelector> createState() => _FormSelectorState();
}

class _FormSelectorState extends State<FormSelector> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      height: isExpanded ? 300 : 54,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
        // border: value == ""
        //     ? Border.all(style: BorderStyle.none)
        //     : Border.all(width: 1, color: Styles.PRIMARY_COLOR),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15), bottom: !isExpanded ? Radius.circular(15) : Radius.circular(0)),
                border: Border.all(style: BorderStyle.none),
                // border: value == ""
                //     ? Border.all(style: BorderStyle.none)
                //     : Border.all(width: 1, color: Styles.PRIMARY_COLOR),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.value != "") Text(widget.label!, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: Colors.grey)),
                      if (widget.value != "") const SizedBox(height: 6),
                      Text(
                        widget.value == null ? widget.label! : widget.value!.name!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: widget.value == "" ? Colors.grey : Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    isExpanded ? Icons.arrow_drop_up_sharp : Icons.arrow_drop_down_sharp,
                    size: 30,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
          if (isExpanded)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListAnimator(
                  controller: ScrollController(),
                  data: List.generate(
                    widget.data.length,
                    (index) => Column(
                      children: [
                        ListTile(
                          title: Text(widget.data[index].name ?? "", style: TextStyle(fontWeight: FontWeight.w600)),
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                            widget.onTap(widget.data[index]);
                          },
                        ),
                        const Divider(height: 5),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
