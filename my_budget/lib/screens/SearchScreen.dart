import 'package:flutter/material.dart';
import 'package:my_budget/data/dummy_data.dart';
import 'package:my_budget/screens/AccountsScreen.dart';
import 'package:my_budget/screens/HomeScreen.dart';
import 'package:my_budget/screens/SettingScreen.dart';
import 'package:my_budget/screens/TransactionsScreen.dart';
import 'package:my_budget/widgets/filterbutton.dart';
import 'package:my_budget/widgets/nav_item.dart';
import 'package:my_budget/widgets/transaction_item.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<TransactionItem> filterTransactionItem = dummyTransactionItem;

  void _filterTransactionItem(String query) {
    setState(() {
      filterTransactionItem = dummyTransactionItem.where((transactionItem){
        return transactionItem.title.contains(query) ||
        transactionItem.category.contains(query) ||
        transactionItem.amount.contains(query);
      }).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
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
        body: Column(
          children: [
            //  مربع البحث
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: _filterTransactionItem,
                decoration: InputDecoration(
                  hintText: "ابحث عن معاملة، فئة، أو مبلغ...",
                  suffix: const Icon(Icons.search),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  
                  ),
                  
                ),
                textAlign: TextAlign.right,
              ),
            ),
      
            //  أزرار الفلترة
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FilterButton(title: "الكل",
                  onPressed: () {
                   setState(() {
                     filterTransactionItem = dummyTransactionItem;
                   }); 
                  },),
                  FilterButton(title: "مصاريف",
                  onPressed: () {
                    filterTransactionItem = dummyTransactionItem.where((transactionItem){
                      return transactionItem.category.contains('مصاريف');
                    }).toList();
                  },),
                  FilterButton(title: "دخل",
                  onPressed: () {
                   setState(() {
                     filterTransactionItem = dummyTransactionItem.where((transactionItem){
                      return transactionItem.category.contains('دخل');
                    }).toList();
                   }); 
                  },),
                  FilterButton(title: "هذا الشهر",
                  onPressed: () {
                    
                  },),
                  
                ],
              ),
            ),
      
            const SizedBox(height: 20),
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("نتائج البحث",
                  style: TextStyle(fontSize: 20),),
                  Text(" نتائج موجودة ${filterTransactionItem.length}", style: TextStyle(color: Colors.grey[400]),)
                ],
              ),
            ),
      
            //  نتائج البحث
            Expanded(
              child: filterTransactionItem.isEmpty?
              const Center(
                child: Text('لا توجد معاملات مطابقة',
                style: TextStyle(fontSize: 16, color: Colors.grey),),
              ): ListView.builder(
                itemCount: filterTransactionItem.length,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                itemBuilder: (context, index){
                final TransactionItem transactionItem = filterTransactionItem[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      child: Icon(transactionItem.icon),
                    ),
                    title: Text(
                      transactionItem.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      '${transactionItem.category}.${transactionItem.date}'
                    ),
                    trailing: Text(
                      transactionItem.amount,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                      color: transactionItem.category=='دخل'? Colors.green: Colors.red
                      ),
                    ),
                  ),
                );
              })
            ),
            SizedBox(height: 15,),
      
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360),
                color: Colors.grey[200]
              ),
              child: Icon(Icons.restore_rounded, size: 50,),
            ),
      
            SizedBox(height: 15,),
      
            //  عمليات بحث سابقة
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("عمليات بحث سابقة",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text("اشتراك نتفليكس"),
                  Text("فواتير الكهرباء"),
                ],
              ),
            ),
          ],
        ),
      
        //  شريط التنقل السفلي
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
                  active: true,
                  label: 'البحث',
                ),
              ],
            ),
          ),
      ),
    );
  }

  
}


