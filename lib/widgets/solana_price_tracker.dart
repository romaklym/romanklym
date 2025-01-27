import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class SolanaPriceWidget extends StatefulWidget {
  const SolanaPriceWidget({super.key});

  @override
  State<SolanaPriceWidget> createState() => _SolanaPriceWidgetState();
}

class _SolanaPriceWidgetState extends State<SolanaPriceWidget> {
  String solPrice = '\$0';

  @override
  void initState() {
    super.initState();
    _fetchSolPrice();
  }

  Future<void> _fetchSolPrice() async {
    const url =
        'https://api.coingecko.com/api/v3/simple/price?ids=solana&vs_currencies=usd';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        setState(() {
          solPrice = '\$${json['solana']['usd'].toString()}';
        });
      } else {
        throw Exception('Failed to load price');
      }
    } catch (error) {
      setState(() {
        solPrice = 'Zzz...';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFC978), // Retro beige background color
          borderRadius: BorderRadius.circular(8), // Rounded corners
          border: Border.all(
            color: const Color(0xFF704214), // Brown border color
            width: 2.0, // Border thickness
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF704214), // Shadow color
              offset: const Offset(-5, 5),
              blurRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/images/solana.svg',
                width: 16, // Adjust SVG size as needed
                height: 16,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF1E8EC0), // Matching text color
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                solPrice,
                style: const TextStyle(
                  fontFamily: "Audiowide",
                  fontSize: 12,
                  color: Color(0xFF704214), // Adjusted text color
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
