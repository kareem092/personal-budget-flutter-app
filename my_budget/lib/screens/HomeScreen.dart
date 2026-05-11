import 'package:flutter/material.dart';
import 'package:my_budget/screens/AddIncomeScreen.dart';
import 'package:my_budget/screens/TransactionsScreen.dart';
import 'package:my_budget/screens/categoriesScreen.dart';

void main() {
  runApp(MyBudgetApp());
}

class MyBudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ميزانيتك',
      theme: ThemeData(
        fontFamily: 'Tajawal',
        scaffoldBackgroundColor: const Color(0xffF8F9FA),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color primaryColor = const Color(0xff1A56DB);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FA),

        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {},
        ),

        bottomNavigationBar: Container(
          height: 75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(Icons.home, "الرئيسية", true,(){

              }),
              navItem(Icons.receipt_long, "العمليات", false,
              (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionsScreen(),));
              }),
              navItem(Icons.add_circle, "إضافة", false,(){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => IncomeScreen(),));
              }),
              navItem(Icons.account_balance_wallet, "الحسابات", false,(){}),
            ],
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/150?img=3",
                      ),
                    ),

                    Text(
                      "ميزانيتك",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),

                    Icon(Icons.menu, size: 30, color: Colors.grey.shade700),
                  ],
                ),

                const SizedBox(height: 25),

                /// BALANCE CARD
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [Color(0xff1A56DB), Color(0xff003FB1)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "الرصيد الكلي",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: const [
                          Text(
                            "24,500",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "ريال",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              smallIcon(Icons.credit_card),
                              const SizedBox(width: 10),
                              smallIcon(Icons.payments),
                            ],
                          ),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "تفاصيل الحساب",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// FILTER BUTTONS
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      periodButton("يوم", false),
                      periodButton("أسبوع", false),
                      periodButton("شهر", true),
                      periodButton("سنة", false),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// ACCOUNTS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "الحسابات",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "عرض الكل",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      accountCard(
                        Icons.payments,
                        "نقدي",
                        "4,200 ريال",
                        Colors.green,
                      ),

                      accountCard(
                        Icons.credit_card,
                        "بطاقة مدى",
                        "18,300 ريال",
                        Colors.blue,
                      ),

                      accountCard(
                        Icons.savings,
                        "ادخار",
                        "2,000 ريال",
                        Colors.red,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// INCOME & EXPENSE
                Row(
                  children: [
                    Expanded(
                      child: summaryCard(
                        Icons.arrow_downward,
                        "الدخل",
                        "+12,400",
                        Colors.green,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: summaryCard(
                        Icons.arrow_upward,
                        "المصاريف",
                        "-5,120",
                        Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                /// EXPENSES
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "توزيع المصاريف",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: CircularProgressIndicator(
                              value: 0.75,
                              strokeWidth: 25,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation(primaryColor),
                            ),
                          ),

                          Column(
                            children: const [
                              Text(
                                "الإجمالي",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "5,120",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      Wrap(
                        spacing: 18,
                        runSpacing: 14,
                        children: [
                          legendItem("السكن", Colors.blue),
                          legendItem("الغذاء", Colors.green),
                          legendItem("الترفيه", Colors.orange),
                          legendItem("أخرى", Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// ACTION BUTTONS
                Row(
                  children: [
                    Expanded(
                      child: actionButton(
                        "إضافة دخل",
                        Icons.add_circle,
                        Colors.green,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: actionButton(
                        "إضافة مصروف",
                        Icons.remove_circle,
                        Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String title, bool active, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       IconButton(onPressed: onPressed, icon: Icon(icon, color: active ? primaryColor : Colors.grey),) 
       , const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: active ? primaryColor : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget smallIcon(IconData icon) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget periodButton(String text, bool active) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: active ? primaryColor : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget accountCard(IconData icon, String title, String amount, Color color) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),

          const Spacer(),

          Text(title, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 8),

          Text(
            amount,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget summaryCard(IconData icon, String title, String amount, Color color) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey)),

              const SizedBox(height: 4),

              Text(
                amount,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget legendItem(String title, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),

        const SizedBox(width: 8),

        Text(title, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget actionButton(String title, IconData icon, Color color) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 12)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),

          const SizedBox(width: 10),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
