
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';
class SortOptionItem extends StatelessWidget {
  final String title;
  final int value;

  const SortOptionItem({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      borderRadius: BorderRadius.circular(context.setRadius(8)),
      onTap: () {
        RadioGroup.maybeOf<int>(context)?.onChanged(value);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: context.setWidth(16),
        ),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(context.setRadius(8)),
          boxShadow: [
            BoxShadow(
              color: colorScheme.onSecondary.withAlpha(90),
              blurRadius: context.setRadius(3),
              spreadRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: textTheme.bodyLarge),
            Radio<int>(value: value),
          ],
        ),
      ),
    );
  }
}