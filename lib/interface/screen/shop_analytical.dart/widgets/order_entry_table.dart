import 'package:flutter/material.dart';
import 'package:crafity/interface/features/searchBar.dart';

class OrderEntryTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(        
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Entry',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SearchBar(
                    usePopupMenu: true,
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    color: Color(0xFF858585),
                    onPressed: () {},
                  ),
                  Text(
                    '20 orders',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    showCheckboxColumn: true,
                    columns: dataTableList.keys.map(
                      (item) => DataColumn(
                        label: Text(
                          item,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF747474),
                          ),
                        ),
                      ),
                    ),
                    rows: List.generate(
                      dataTableList.values.first.length,
                      (i) => DataRow.byIndex(
                        index: i,
                        cells: List.generate(
                          dataTableList.values.length,
                          (j) {
                            if (j == 2 || j == 3) {
                              return DataCell(
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: dataTableList[j][i][i].map(
                                    (item) => Text(item.toString()),
                                  ),
                                ),
                              );
                            }
                            return DataCell(
                                Text(dataTableList[j][i].toString()));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.cancel),
                    color: Color(0xFF858585),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    color: Color(0xFF858585),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, List<dynamic>> dataTableList = {
    'N': [1, 2, 3],
    'Name': ['Daniel Jack', 'Lion Barck', 'Rainer Vanquin'],
    'products': <List<String>>[
      ['Layang', 'Amaia Mask'],
      ['Katana Girl'],
      ['Dracula Stone', 'Liliput']
    ],
    'Total Price(\$)': [
      ['(2) \$56', '(1) \$66'],
      ['(3) \$126'],
      ['(2) \$56', '(1) \$66'],
    ],
    'Account': [
      'danieljack12@gmail.com, 085666745239',
      'danieljack12@gmail.com, 085666745239',
      'danieljack12@gmail.com, 085666745239'
    ],
    'Address': [
      'autem consectetur qui amet Exercitationem, Bali, Indonesia, 15773',
      'autem consectetur qui amet Exercitationem, Bali, Indonesia, 15773',
      'autem consectetur qui amet Exercitationem, Bali, Indonesia, 15773'
    ],
    'Credit': [
      'Daniel 88 Jack, BCA Mandiri',
      'Daniel 88 Jack, BCA Mandiri',
      'Daniel 88 Jack, BCA Mandiri'
    ],
    'Order Date': ['05/03/2020', '08/22/202', '09/15/2020'],
  };
}

// class OrderTableEntity {
//   OrderTableEntity({
//     this.name,
//     this.products,
//     this.price,
//     this.account,
//     this.address,
//     this.credit,
//     this.date,
//   });

//   final String name;
//   final List<String> products;
//   final List<int> price;
//   final String account;
//   final String address;
//   final String credit;
//   final String date;
// }
