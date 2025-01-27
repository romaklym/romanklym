import 'package:flutter/material.dart';
import 'package:klymroman/models/widget_position_model.dart';

typedef OnDragStartCallback = void Function();

class DraggableWidget extends StatelessWidget {
  final String keyName;
  final Widget child;
  final OnDragStartCallback onDragStart;
  final Map<String, WidgetPosition> widgetPositions;
  final Function(String key, WidgetPosition position) onPositionUpdate;

  const DraggableWidget({
    super.key,
    required this.keyName,
    required this.child,
    required this.onDragStart,
    required this.widgetPositions,
    required this.onPositionUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final position = widgetPositions[keyName]!;

    return Positioned(
      left: position.left,
      top: position.top,
      right: position.right,
      bottom: position.bottom,
      child: GestureDetector(
        onPanStart: (_) => onDragStart(),
        onPanUpdate: (details) {
          final currentPos = widgetPositions[keyName]!;
          final newPosition = WidgetPosition(
            left: currentPos.left != null
                ? (currentPos.left! + details.delta.dx)
                : null,
            top: currentPos.top != null
                ? (currentPos.top! + details.delta.dy)
                : null,
            right: currentPos.right != null
                ? (currentPos.right! - details.delta.dx)
                : null,
            bottom: currentPos.bottom != null
                ? (currentPos.bottom! - details.delta.dy)
                : null,
          );

          onPositionUpdate(keyName, newPosition);
        },
        child: Material(
          type: MaterialType.transparency,
          child: child,
        ),
      ),
    );
  }
}
