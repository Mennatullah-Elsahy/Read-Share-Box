import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../../../base/models/select_option.dart';

class SingleSelectField extends StatefulWidget {
  const SingleSelectField({
    super.key,
    this.onSelect,
    this.errorText,
    this.labelText,
    this.withBottomPadding = true,
    this.hasError = false,
    this.initialValue,
    required this.valueSet,
  });
  final String? labelText;
  final String? errorText;
  final bool hasError;
  final Function(SelectOption)? onSelect;
  final bool withBottomPadding;
  final List<SelectOption> valueSet;
  final SelectOption? initialValue;
  @override
  State<SingleSelectField> createState() => _SingleSelectFieldState();
}

class _SingleSelectFieldState extends State<SingleSelectField> {
  SelectOption? value;
  List<SelectOption> valueSet = [];
  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    valueSet = widget.valueSet;
    if (value != null) {
      valueSet.forEach((element) {
        element.value == value!.value ? element.isSelected = true : element.isSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Row(
            children: [
              Text(widget.labelText ?? ""),
              if (widget.hasError) const SizedBox(width: 4),
              if (widget.hasError)
                Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red, size: 16),
                    const SizedBox(width: 4),
                    Text(widget.errorText ?? "Error", style: const TextStyle(color: Colors.red)),
                  ],
                ),
            ],
          ),
        const SizedBox(height: 4),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: valueSet.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, index) => SingleSelectOption(
            option: valueSet[index],
            onSelect: (option) {
              setState(() {
                valueSet.forEach((element) {
                  element.isSelected = false;
                });
                valueSet[index].isSelected = true;
              });
              widget.onSelect?.call(option);
            },
          ),
        ),
        if (widget.withBottomPadding) const SizedBox(height: 16),
      ],
    );
  }
}

class SingleSelectOption extends StatelessWidget {
  const SingleSelectOption({
    super.key,
    required this.option,
    this.onSelect,
  });
  final SelectOption option;
  final Function(SelectOption)? onSelect;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect?.call(option),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          color: option.isSelected ? Theme.of(context).colorScheme.primary.withOpacity(.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          option.label,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: option.isSelected ? Theme.of(context).colorScheme.primary : Colors.black),
        )),
      ),
    );
  }
}
