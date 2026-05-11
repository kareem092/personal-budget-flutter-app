import 'package:flutter/material.dart';
import 'package:my_budget/screens/AccountsScreen.dart';
import 'package:my_budget/screens/HomeScreen.dart';
import 'package:my_budget/screens/TransactionsScreen.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FA),

        // Bottom Navigation
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Color(0xffE5E7EB),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              BottomNavItem(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                icon: Icons.home_outlined,
                title: "الرئيسية",
              ),
              BottomNavItem(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TransactionsScreen()));
                },
                icon: Icons.receipt_long_outlined,
                title: "العمليات",
              ),
              BottomNavItem(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IncomeScreen()));
                },
                icon: Icons.add_circle,
                title: "إضافة",
                active: true,
                iconSize: 34,
              ),
              BottomNavItem(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountsScreen()));
                },
                icon: Icons.account_balance_wallet_outlined,
                title: "الحسابات",
              ),
            ],
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              right: 24,
              left: 24,
              top: 16,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),

                    Row(
                      children: [
                        const Text(
                          "ميزانيتك",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff003FB1),
                          ),
                        ),

                        const SizedBox(width: 12),

                        CircleAvatar(
                          radius: 18,
                          backgroundColor: const Color(0xff1A56DB),
                          child: ClipOval(
                            child: Image.network(
                              "https://i.pravatar.cc/300",
                              fit: BoxFit.cover,
                              width: 36,
                              height: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Toggle Buttons
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xffEDEEEF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "مصروفات",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          alignment: Alignment.center,
                          child: const Text(
                            "دخل",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Amount Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 28,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xffDADCE0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "المبلغ الإجمالي",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "ر.س",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(width: 8),

                          Text(
                            "0.00",
                            style: TextStyle(
                              fontSize: 40,
                              color: Color(0xff003FB1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Category Title
                const Text(
                  "الفئة",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                // Categories Grid
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 12,
                  childAspectRatio: .8,
                  children: const [
                    CategoryItem(
                      icon: Icons.receipt_long,
                      title: "فواتير",
                      selected: true,
                    ),
                    CategoryItem(
                      icon: Icons.directions_car,
                      title: "سيارة",
                    ),
                    CategoryItem(
                      icon: Icons.restaurant,
                      title: "طعام",
                    ),
                    CategoryItem(
                      icon: Icons.movie,
                      title: "ترفيه",
                    ),
                    CategoryItem(
                      icon: Icons.shopping_bag,
                      title: "تسوق",
                    ),
                    CategoryItem(
                      icon: Icons.health_and_safety,
                      title: "صحة",
                    ),
                    CategoryItem(
                      icon: Icons.school,
                      title: "تعليم",
                    ),
                    CategoryItem(
                      icon: Icons.more_horiz,
                      title: "أخرى",
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Date
                const Text(
                  "التاريخ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xffDADCE0),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.calendar_today,
                        color: Color(0xff003FB1),
                      ),

                      SizedBox(width: 12),

                      Text(
                        "اليوم، 24 مايو 2024",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Notes
                const Text(
                  "ملاحظات (اختياري)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  height: 120,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xffDADCE0),
                    ),
                  ),
                  alignment: Alignment.topRight,
                  child: const Text(
                    "أضف وصفاً للعملية...",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff003FB1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "حفظ العملية",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xffFFDAD6)
                : const Color(0xffEDEEEF),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            icon,
            color: selected
                ? const Color(0xff93000A)
                : Colors.grey,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String title;
  final bool active;
  final double iconSize;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.title,
    this.active = false,
    this.iconSize = 24, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: onPressed, icon: Icon(
          icon,
          size: iconSize,
          color: active
              ? const Color(0xff003FB1)
              : Colors.grey,
        ),),

        const SizedBox(height: 4),

        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: active
                ? const Color(0xff003FB1)
                : Colors.grey,
            fontWeight:
                active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}