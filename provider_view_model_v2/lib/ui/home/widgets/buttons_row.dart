import 'package:flutter/material.dart';
import 'package:provider_view_model_v2/foundation/states/base_state.dart';
import 'package:provider_view_model_v2/utils/states_ext.dart';

class ButtonsRow extends StatelessWidget {
  final BaseState state;
  final VoidCallback onClickLeft;
  final VoidCallback onClickRight;

  const ButtonsRow({
    super.key,
    required this.state,
    required this.onClickLeft,
    required this.onClickRight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 16),
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: onClickLeft,
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        Expanded(
          child: Container(
            color: state.isContentState()
                ? Colors.green
                : state.isLoadingState()
                    ? Colors.amber
                    : Colors.red,
            height: 48,
            child: Center(
              child: Text(
                state.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: onClickRight,
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
