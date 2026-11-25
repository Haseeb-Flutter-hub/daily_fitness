import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:daily_fitness/app/core/theme/app_colors.dart';
import 'package:daily_fitness/app/core/theme/app_spacing.dart';
import 'package:daily_fitness/app/core/theme/app_text_styles.dart';

/// Bahar se OTP boxes ko control karne ke liye (abhi: clear).
class AppOtpController {
  VoidCallback? _clear;

  /// Saare boxes khali karo aur pehle box par focus le jao.
  void clear() => _clear?.call();
}

/// 6 (ya length jitne) alag boxes wali code field.
class AppOtpField extends StatefulWidget {
  final int length;
  final AppOtpController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  const AppOtpField({
    super.key,
    this.length = 6,
    this.controller,
    this.onChanged,
    this.onCompleted,
  });

  @override
  State<AppOtpField> createState() => _AppOtpFieldState();
}

class _AppOtpFieldState extends State<AppOtpField> {
  late final List<TextEditingController> _controllers =
      List.generate(widget.length, (_) => TextEditingController());
  late final List<FocusNode> _nodes = List.generate(widget.length, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    widget.controller?._clear = _clearAll;
  }

  @override
  void didUpdateWidget(covariant AppOtpField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?._clear = null;
      widget.controller?._clear = _clearAll;
    }
  }

  @override
  void dispose() {
    widget.controller?._clear = null;
    for (final c in _controllers) {
      c.dispose();
    }
    for (final n in _nodes) {
      n.dispose();
    }
    super.dispose();
  }

  void _clearAll() {
    for (final c in _controllers) {
      c.clear();
    }
    _nodes.first.requestFocus();
    widget.onChanged?.call('');
  }

  void _onChanged(int i, String value) {
    if (value.isNotEmpty && i < widget.length - 1) _nodes[i + 1].requestFocus();
    if (value.isEmpty && i > 0) _nodes[i - 1].requestFocus();
    final code = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(code);
    if (code.length == widget.length) {
      FocusScope.of(context).unfocus();
      widget.onCompleted?.call(code);
    }
  }

  Widget _box(int i) => SizedBox(
        height: 58,
        child: TextField(
          controller: _controllers[i],
          focusNode: _nodes[i],
          autofocus: i == 0,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(1)],
          cursorColor: AppColors.primary,
          style: AppTextStyles.display(26),
          onChanged: (v) => _onChanged(i, v),
          decoration: const InputDecoration(counterText: '', contentPadding: EdgeInsets.zero),
        ),
      );

  @override
  Widget build(BuildContext context) => Row(
        children: [
          for (var i = 0; i < widget.length; i++) ...[
            if (i > 0) AppSpacing.w8,
            Expanded(child: _box(i)),
          ],
        ],
      );
}
