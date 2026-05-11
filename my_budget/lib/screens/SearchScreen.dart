import 'package:flutter/material.dart';
import 'package:my_budget/data/dummy_data.dart';
import 'package:my_budget/screens/HomeScreen.dart';
import 'package:my_budget/screens/SettingScreen.dart';
import 'package:my_budget/widgets/filterbutton.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("ميزانيتي"),
        leading:  CircleAvatar(
            backgroundImage: AssetImage("assets/profile.jpg"), // صورة شخصية
          ),
        actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.blue,)),
          const SizedBox(width: 12),
        ],
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
                  filterTransactionItem = dummyTransactionItem;
                },),
                FilterButton(title: "مصاريف",
                onPressed: () {
                  filterTransactionItem = dummyTransactionItem.where((transactionItem){
                    return transactionItem.category.contains('مصاريف');
                  }).toList();
                },),
                FilterButton(title: "دخل",
                onPressed: () {
                  filterTransactionItem = dummyTransactionItem.where((transactionItem){
                    return transactionItem.category.contains('دخل');
                  }).toList();
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        items:  [
          BottomNavigationBarItem(icon: IconButton(onPressed: () {
            Navigator.of(context).push( 
              MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
          icon: Icon(Icons.home),
          ),
           label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "الإحصائيات"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "البحث"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "الفئات"),
          BottomNavigationBarItem(icon: IconButton(onPressed: () {
            Navigator.of(context).push( 
              MaterialPageRoute(builder: (context)=>SettingsScreen()));
          },
          icon:  Icon(Icons.settings)),
            label: "الإعدادات"),
        ],

      ),
    );
  }

  //  زر فلترة
}


