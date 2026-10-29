import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: context.setWidth(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.location_on_rounded, size: context.setMinSize(20)),
          SizedBox(width: context.setWidth(10)),
          Text('address'.tr(), style: textTheme.labelLarge),
          SizedBox(width: context.setWidth(8)),

          Icon(
            Icons.keyboard_arrow_down,
            color: colorScheme.primary,
            size: context.setMinSize(25),
          ),
        ],
      ),
    );
  }
}
