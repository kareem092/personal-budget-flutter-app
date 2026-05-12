import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:my_budget/screens/AccountsScreen.dart';
import 'package:my_budget/screens/HomeScreen.dart';
import 'package:my_budget/screens/SearchScreen.dart';
import 'package:my_budget/screens/TransactionsScreen.dart';
import 'package:my_budget/screens/TransferScreen.dart';
import 'package:my_budget/widgets/nav_item.dart';
class SettingsScreen extends StatelessWidget {
   SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
      
        bottomNavigationBar:  Container(
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
      
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  const SizedBox(height: 12),
      
                  /// TOP BAR
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
                          color: Colors.blue,
                        ),
                      ),
      
                     
                    ],
                  ),
      
                  const SizedBox(height: 28),
      
                  /// TITLE
                   Center(
                    child: Column(
                      children: [
                        Text(
                          "الإعدادات",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "قم بتخصيص تجربتك المالية وتأمين بياناتك.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
      
                  const SizedBox(height: 24),
      
                  /// CARD 1
                  const SettingsCard(
                    title: "إدارة الميزانية",
                    icon: Icons.account_balance_wallet_outlined,
                    iconBg: Color(0xffEEF2FF),
                    children: [
                      SettingsSwitchTile(
                        title: "ترحيل الرصيد",
                        subtitle: "نقل الميزانية المتبقية للشهر القادم",
                      ),
                      Divider(),
                      SettingsArrowTile(
                        title: "العمليات المتكررة",
                        subtitle: "إدارة الاشتراكات والمصاريف الثابتة",
                      ),
                      Divider(),
                      SettingsArrowTile(
                        title: "خيارات وضع الميزانية",
                        subtitle: "تعديل الأهداف والحدود الشهرية",
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 18),
      
                  /// CARD 2
                  const SettingsCard(
                    title: "التفضيلات",
                    icon: Icons.language,
                    iconBg: Color(0xffE9F9F1),
                    children: [
                      SettingsArrowTile(
                        title: "لغة التطبيق",
                        subtitle: "العربية",
                        leading: Icons.translate,
                      ),
                      Divider(),
                      SettingsArrowTile(
                        title: "العملة الأساسية",
                        subtitle: "ريال سعودي (SAR)",
                        leading: Icons.payments_outlined,
                      ),
                      Divider(),
                      SettingsSwitchTile(
                        title: "الوضع الليلي",
                        subtitle: "تلقائي حسب إعدادات النظام",
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 18),
      
                  /// CARD 3
                  const SettingsCard(
                    title: "الأمان والبيانات",
                    icon: Icons.shield_outlined,
                    iconBg: Color(0xffFFF0F0),
                    children: [
                      SettingsSwitchBox(
                        title: "قفل التطبيق",
                        subtitle: "استخدام FaceID أو رمز القفل",
                        icon: Icons.lock_outline,
                      ),
      
                      SizedBox(height: 14),
      
                      SettingsButtonTile(
                        title: "النسخ الاحتياطي",
                        subtitle: "آخر مزامنة منذ ساعتين",
                        icon: Icons.cloud_upload_outlined,
                      ),
      
                      SizedBox(height: 14),
      
                      SettingsButtonTile(
                        title: "تصدير البيانات",
                        subtitle: "تحميل ملف Excel أو CSV",
                        icon: Icons.file_copy_outlined,
                      ),
      
                      SizedBox(height: 14),
      
                      DeleteAccountTile(),
                    ],
                  ),
      
                  const SizedBox(height: 24),
      
                  /// HELP BOX
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xff1F4ED8),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "هل تحتاج للمساعدة؟",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
      
                        const SizedBox(height: 10),
      
                        const Text(
                          "مركز الدعم متاح دائماً للإجابة على استفساراتك المالية.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
      
                        const SizedBox(height: 22),
      
                        Container(
                          width: 170,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Text(
                              "تواصل معنا",
                              style: TextStyle(
                                color: Color(0xff1F4ED8),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      
                  const SizedBox(height: 26),
      
                  const Center(
                    child: Text(
                      "ميزانيتي - الإصدار 2.4.0 (2024)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
      
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconBg;
  final List<Widget> children;

  const SettingsCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconBg,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xffE8E8E8)),
      ),
      child: Column(
        children: [

          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon),
              ),

              const Spacer(),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          ...children,
        ],
      ),
    );
  }
}

class SettingsArrowTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? leading;

  const SettingsArrowTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [

          if (leading != null)
            Icon(leading, color: Colors.grey),

          if (leading != null)
            const SizedBox(width: 14),

          const Icon(Icons.arrow_back_ios, size: 16),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsSwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const SettingsSwitchTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Switch(
          value: true,
          onChanged: (v) {},
        ),

        const Spacer(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SettingsSwitchBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const SettingsSwitchBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          Switch(
            value: true,
            onChanged: (v) {},
          ),

          const Spacer(),

          Icon(icon),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsButtonTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const SettingsButtonTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffE8E8E8)),
      ),
      child: Row(
        children: [

          Icon(icon),

          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DeleteAccountTile extends StatelessWidget {
  const DeleteAccountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffFFF4F4),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffF2DADA)),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete_outline, color: Colors.red),
              SizedBox(width: 8),
              Text(
                "حذف الحساب",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 6),

          Text(
            "سيتم مسح كافة البيانات بشكل نهائي",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final bool active;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.title,
    this.active = false, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: active ? const Color(0xff1F4ED8) : Colors.grey,
        ),

        const SizedBox(height: 4),

        Text(
          title,
          style: TextStyle(
            color: active ? const Color(0xff1F4ED8) : Colors.grey,
            fontSize: 12,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}