import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

class BatteryIndicator extends StatelessWidget {
  const BatteryIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: Battery().batteryLevel,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data! >= 0) {
          return StreamBuilder<BatteryState>(
            stream: Battery().onBatteryStateChanged,
            builder: (context, stateSnapshot) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF8CB682),
                  border: Border.all(color: Colors.black54, width: 1.5),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF704214),
                      offset: Offset(-5, 5),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StreamBuilder<int>(
                      stream: Stream.periodic(const Duration(seconds: 30))
                          .asyncMap((_) => Battery().batteryLevel),
                      builder: (context, levelSnapshot) {
                        final level = levelSnapshot.data ?? snapshot.data ?? 0;
                        return Text(
                          '$level%',
                          style: const TextStyle(
                            fontFamily: "Audiowide",
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      stateSnapshot.data == BatteryState.charging
                          ? Icons.battery_charging_full
                          : Icons.battery_full,
                      color: Colors.black54,
                      size: 16,
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
