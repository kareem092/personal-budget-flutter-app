import 'package:flutter/material.dart';
import 'package:my_budget/screens/HomeScreen.dart';
import 'package:my_budget/screens/SearchScreen.dart';
// import 'package:my_budget/screens/SettingScreen.dart';
import 'package:my_budget/screens/TransactionsScreen.dart';
import 'package:my_budget/widgets/nav_item.dart';

class AccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffF8F9FA),

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "إدارة الحسابات",
            style: TextStyle(
              color: Color(0xff003FB1),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: CircleAvatar(
                backgroundColor: Color(0xffDBE1FF),
                child: Icon(Icons.person, color: Color(0xff003FB1)),
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "نظرة شاملة على حساباتك المالية",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),

              SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Color(0xff006C4A),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.swap_horiz, color: Colors.white),

                          SizedBox(width: 8),

                          Text(
                            "تحويل",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Color(0xff003FB1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.white),

                          SizedBox(width: 8),

                          Text(
                            "حساب جديد",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [Color(0xff003FB1), Color(0xff1A56DB)],
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(Icons.credit_card, color: Colors.white),
                        ),

                        SizedBox(width: 12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "البنك الراجحي",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "الحساب الرئيسي",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 35),

                    Text(
                      "الرصيد المتوفر",
                      style: TextStyle(color: Colors.white70),
                    ),

                    SizedBox(height: 8),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "24,500",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(width: 8),

                        Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "ر.ي",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "نشط",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        SizedBox(width: 12),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "**** 4421",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 22),

              Row(
                children: [
                  Expanded(
                    child: buildSmallCard(
                      icon: Icons.wallet,
                      title: "النقود الكاش",
                      amount: "1,250",
                      color: Color(0xff006C4A),
                    ),
                  ),

                  SizedBox(width: 14),

                  Expanded(
                    child: buildSmallCard(
                      icon: Icons.savings,
                      title: "حساب الادخار",
                      amount: "15,000",
                      color: Color(0xff98000C),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 28),

              Text(
                "آخر التحويلات",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),

              SizedBox(height: 18),

              buildTransferCard("من الكاش إلى البنك", "500 ر.ي"),

              SizedBox(height: 14),

              buildTransferCard("من البنك إلى الادخار", "1,000 ر.ي"),

              SizedBox(height: 100),
            ],
          ),
        ),

        bottomNavigationBar: Container(
          height: 85,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: Color(0xffEEEEEE),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
                icon: Icons.home,
                label: 'الرئيسية',

              ),

              navItem(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TransactionsScreen()));
                },
                icon: Icons.receipt_long,
                label: 'العمليات',
                
              ),


              navItem(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountsScreen()));
                },
                icon: Icons.account_balance_wallet,
                label: 'الحسابات',
                active: true,
              ),

              navItem(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
                },
                icon: Icons.search,
                
                label: 'البحث',
              ),
            ],
          ),
        ),

      ),
    );
  }

  Widget buildSmallCard({
    required IconData icon,
    required String title,
    required String amount,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),

            child: Icon(icon, color: color),
          ),

          SizedBox(height: 24),

          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),

          SizedBox(height: 6),

          Text(
            amount,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransferCard(String title, String amount) {
    return Container(
      padding: EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,

            decoration: BoxDecoration(
              color: Color(0xffEDEEEF),
              borderRadius: BorderRadius.circular(18),
            ),

            child: Icon(Icons.swap_horiz, color: Colors.grey[700]),
          ),

          SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),

                SizedBox(height: 4),

                Text("14 أكتوبر 2023", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          Text(
            amount,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
