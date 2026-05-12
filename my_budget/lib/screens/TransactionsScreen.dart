import 'package:flutter/material.dart';
import 'package:my_budget/screens/AccountsScreen.dart';
import 'package:my_budget/screens/HomeScreen.dart';
import 'package:my_budget/screens/SearchScreen.dart';
import 'package:my_budget/screens/SettingScreen.dart';
import 'package:my_budget/widgets/filterbutton.dart';
import 'package:my_budget/widgets/nav_item.dart';
import 'package:my_budget/widgets/transaction_card.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF8F9FA),

        // ================= APP BAR =================
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title:  Row(
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
                        color: Colors.blue,
                      ),
                    ),

                    IconButton(icon:Icon(Icons.settings,
                     size: 30, color: Colors.grey.shade700),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingsScreen()));
                    },),
                  ],
                ),

        ),

        // ================= BODY =================
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 20,
            left: 16,
            right: 16,
            bottom: 120,
          ),
          child: Column(
            children: [
              // ================= SEARCH =================
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xffC3C5D7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "ابحث عن عملية...",
                      suffix: IconButton(
                        onPressed: () {
                          
                        },
                        icon: Icon(Icons.tune, color: Colors.blue)),
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.zero
                        ),
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.zero
                        )
                      
                    
                  ),
                                   ),
                ),
                )
              ,

              const SizedBox(height: 16),

              // ================= FILTERS =================
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterButton(
                     title: 'الكل',
                     onPressed: () {
                       
                     },
                    ),
                    FilterButton( onPressed: () {
                       
                     },
                      title: 'المصروفات'
                      ),
                    FilterButton( onPressed: () {
                       
                     },
                      title: 'الدخل'
                      ),
                    FilterButton( onPressed: () {
                       
                     },
                      title: 'التصنيفات'
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ================= TODAY =================
              _sectionTitle(
                title: 'اليوم',
                date: '15 أكتوبر 2023',
              ),

              const SizedBox(height: 14),

              transactionsContainer(
                children: [
                  _transactionItem(
                    icon: Icons.restaurant,
                    iconBg: Colors.orange.shade50,
                    iconColor: Colors.orange,
                    title: 'وجبة غداء',
                    subtitle: 'مطعم شواية',
                    amount: '- 45.00 SR',
                    amountColor: Colors.red,
                    time: '01:30 م',
                  ),

                  _divider(),

                  _transactionItem(
                    icon: Icons.local_gas_station,
                    iconBg: Colors.blue.shade50,
                    iconColor: Colors.blue,
                    title: 'وقود',
                    subtitle: 'محطة الدريس',
                    amount: '- 120.00 SR',
                    amountColor: Colors.red,
                    time: '10:15 ص',
                  ),

                  _divider(),

                  _transactionItem(
                    icon: Icons.payments,
                    iconBg: Colors.green.shade50,
                    iconColor: Colors.green,
                    title: 'تحويل وارد',
                    subtitle: 'من: فهد العتيبي',
                    amount: '+ 500.00 SR',
                    amountColor: Colors.green,
                    time: '08:00 ص',
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // ================= YESTERDAY =================
              _sectionTitle(
                title: 'أمس',
                date: '14 أكتوبر 2023',
              ),

              const SizedBox(height: 14),

              transactionsContainer(
                children: [
                  _transactionItem(
                    icon: Icons.shopping_bag,
                    iconBg: Colors.purple.shade50,
                    iconColor: Colors.purple,
                    title: 'ملابس',
                    subtitle: 'إتش آند إم',
                    amount: '- 349.00 SR',
                    amountColor: Colors.red,
                    time: '09:45 م',
                  ),

                  _divider(),

                  _transactionItem(
                    icon: Icons.shopping_cart,
                    iconBg: Colors.green.shade50,
                    iconColor: Colors.green,
                    title: 'مقاضي المنزل',
                    subtitle: 'أسواق بنده',
                    amount: '- 185.20 SR',
                    amountColor: Colors.red,
                    time: '07:20 م',
                  ),

                  _divider(),

                  _transactionItem(
                    icon: Icons.medication,
                    iconBg: Colors.red.shade50,
                    iconColor: Colors.red,
                    title: 'صيدلية',
                    subtitle: 'صيدلية النهدي',
                    amount: '- 54.00 SR',
                    amountColor: Colors.red,
                    time: '04:10 م',
                  ),
                ],
              ),
            ],
          ),
        ),

        // ================= BOTTOM NAV =================
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
                active: true,
              ),

              navItem(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountsScreen()));
                },
                icon: Icons.account_balance_wallet,
                label: 'الحسابات',
              ),

              navItem(
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
                },
                icon: Icons.search,
                label: 'اعدادات',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= WIDGETS =================
  Widget _sectionTitle({
    required String title,
    required String date,
  }) {
    return Row(
      children: [
        Text(
          date,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        const Spacer(),

        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      color: Color(0xffEEEEEE),
    );
  }

  Widget _transactionItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    required Color amountColor,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amount,
                style: TextStyle(
                  color: amountColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),

          const SizedBox(width: 14),

          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}