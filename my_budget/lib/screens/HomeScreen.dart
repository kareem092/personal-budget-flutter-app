import 'dart:math' as math;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  final List<String> tabs = ["الكل", "كاش", "بطاقة"];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("زر الإضافة")),
            );
          },
          backgroundColor: Color(0xFF20D67B),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            Icons.add,
            size: 32,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),

                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    Text(
                      "مصرفيات",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        size: 28,
                        color: Color(0xFF1E1E1E),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18),

                // Balance Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF1FAF52),
                        Color(0xFF169442),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x331FAF52),
                        blurRadius: 18,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.arrow_outward_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        "الرصيد الحالي",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.95),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "3,450.00 ر.ي",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth < 360 ? 30 : 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 14),

                // Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color(0xFF1FAF52),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 18),

                // Tabs
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD8D8D8)),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: List.generate(tabs.length, (index) {
                      bool isSelected = selectedTabIndex == index;

                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTabIndex = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color(0xFFE9EFE8)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1E1E1E),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: 26),

                // Chart + Legend
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: SizedBox(
                          width: screenWidth * 0.42,
                          height: screenWidth * 0.42,
                          child: CustomPaint(
                            painter: DonutChartPainter(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLegendItem("السكن", Color(0xFF2E9E44)),
                          SizedBox(height: 12),
                          _buildLegendItem("الطعام", Color(0xFFF04B3A)),
                          SizedBox(height: 12),
                          _buildLegendItem("المواصلات", Color(0xFFF6BE00)),
                          SizedBox(height: 12),
                          _buildLegendItem("الترفيه", Color(0xFF4256C7)),
                          SizedBox(height: 12),
                          _buildLegendItem("سفر", Color(0xFFD6D6D6)),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 28),

                // Income + Expense cards
                Row(
                  children: [
                    Expanded(
                      child: _buildSummaryCard(
                        title: "المصروفات",
                        amount: "-1,550.00 ر.ي",
                        borderColor: Color(0xFFD86B5B),
                        textColor: Color(0xFFD86B5B),
                        icon: Icons.arrow_downward_rounded,
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: _buildSummaryCard(
                        title: "الدخل",
                        amount: "+5,000.00 ر.ي",
                        borderColor: Color(0xFF4D9960),
                        textColor: Color(0xFF2E9E44),
                        icon: Icons.arrow_upward_rounded,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String title, Color color) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF222222),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String amount,
    required Color borderColor,
    required Color textColor,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: textColor, size: 24),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E1E1E),
            ),
          ),
          SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              amount,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = size.width * 0.22;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    List<_ChartSegment> segments = [
      _ChartSegment(color: Color(0xFF2E9E44), value: 28),
      _ChartSegment(color: Color(0xFFF04B3A), value: 17),
      _ChartSegment(color: Color(0xFFF6BE00), value: 20),
      _ChartSegment(color: Color(0xFF10A9E8), value: 14),
      _ChartSegment(color: Color(0xFF4256C7), value: 10),
      _ChartSegment(color: Color(0xFFFF9E00), value: 7),
      _ChartSegment(color: Color(0xFFAF36D3), value: 4),
      _ChartSegment(color: Color(0xFFE5E5E5), value: 4),
    ];

    double startAngle = -math.pi / 2;
    double total = segments.fold(0, (sum, item) => sum + item.value);

    for (var segment in segments) {
      final paint = Paint()
        ..color = segment.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.butt;

      double sweepAngle = (segment.value / total) * 2 * math.pi;
      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _ChartSegment {
  final Color color;
  final double value;

  _ChartSegment({
    required this.color,
    required this.value,
  });
}