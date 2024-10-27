import 'package:flutter/material.dart';
import 'package:latihan_pak_ary_bagian_2/config/app_colors.dart';

class InputContainer extends StatelessWidget {
  final String label;
  final Widget widget;

  const InputContainer({super.key, required this.widget, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            bottom: 8,
          ),
          child: Text(
            label,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            border: Border.all(
              color:
                  colorScheme.primary.withOpacity(0.3), // Border dengan opacity
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: widget,
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
