import 'package:flutter/material.dart';
import 'package:my_budget/widgets/filterbutton.dart';
import 'package:my_budget/widgets/transaction_card.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

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
          title: Row(
            children: [
              const Spacer(),

              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),

              const SizedBox(width: 12),

              const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAy6eIsuBQ-I93XFvhDo11G0kz0c3M24M_AMefPz0KWMnBIsqZSSTnn2H7Esq-o1chRdOm4PIum5l6o3ShPy-JfOI-kE-xROz4HZGo_vB1VcBSh4Hk0FNZiSrswOVAMbFedSHw4UqU_UkQXad3zWD_SftKuHPRmlLX_ctYCK8z5N8GOSXl9NP9EZ_dQhgTjYC_QYeTlze0qAiIceJY3d_EH1-KvQtXi_35cUhggOkgwHoKOoKXKptzqQ7N8keYEGfW-p-GY1A76EGGC',
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                'ميزانيتك',
                style: TextStyle(
                  color: Color(0xff003FB1),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              _navItem(
                icon: Icons.home,
                label: 'الرئيسية',
                
              ),

              _navItem(
                icon: Icons.receipt_long,
                label: 'العمليات',
                active: true,
              ),

              Transform.translate(
                offset: const Offset(0, -25),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xff003FB1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),

              _navItem(
                icon: Icons.account_balance_wallet,
                label: 'الحسابات',
              ),

              _navItem(
                icon: Icons.more_horiz,
                label: 'المزيد',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= WIDGETS =================

  // Widget _filterChip({
  //   required String title,
  //   bool active = false,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 8),
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: 18,
  //         vertical: 10,
  //       ),
  //       decoration: BoxDecoration(
  //         color: active
  //             ? const Color(0xff003FB1)
  //             : const Color(0xffE7E8E9),
  //         borderRadius: BorderRadius.circular(30),
  //       ),
  //       child: Text(
  //         title,
  //         style: TextStyle(
  //           color: active
  //               ? Colors.white
  //               : const Color(0xff434654),
  //           fontSize: 14,
  //         ),
  //       ),
  //     ),
  //   );
  // }

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

  Widget _navItem({
    required IconData icon,
    required String label,
    bool active = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            
          },
          icon:Icon(icon),
          color: active
              ? const Color(0xff003FB1)
              : Colors.grey,
              
        ),

        

        Text(
          label,
          style: TextStyle(
            color: active
                ? const Color(0xff003FB1)
                : Colors.grey,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}