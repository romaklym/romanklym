import 'package:flutter/material.dart';

class StickyNoteWidget extends StatelessWidget {
  const StickyNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> goals = [
      {"text": "Launch tokenomics, roadmap, white paper", "checked": true},
      {"text": "Launch \$NACHO Token", "checked": true},
      {"text": "Launch Touch Grass", "checked": false},
      {"text": "Hire more talent!", "checked": false},
      {"text": "Start building World Order Game", "checked": false},
      {"text": "...keep building", "checked": false},
    ];

    return Container(
      width: 275,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF176), // Sticky note yellow color
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: const Offset(4, 4),
            blurRadius: 4,
          ),
        ],
        border: Border.all(
          color: const Color(0xFF704214), // Retro brown border
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Goals Checklist",
            style: TextStyle(
              fontFamily: "Doto",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          for (var goal in goals)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: goal["checked"] as bool?, // Explicitly cast to bool?
                    onChanged: null, // Disable interaction
                    checkColor: Colors.white70,
                    activeColor:
                        const Color(0xFF704214), // Retro brown checkmark color
                  ),
                  Expanded(
                    child: Text(
                      goal["text"] as String, // Explicitly cast to String
                      style: TextStyle(
                        fontFamily: "Doto",
                        fontSize: 12,
                        color: (goal["checked"] as bool? ?? false)
                            ? Colors.black87
                            : Colors.black54, // Dim incomplete goals
                        fontWeight: (goal["checked"] as bool? ?? false)
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
