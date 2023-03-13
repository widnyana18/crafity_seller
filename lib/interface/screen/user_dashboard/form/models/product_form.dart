import 'package:flutter/material.dart';
import 'package:crafity/interface/screen/user_dashboard/form/widgets/model_product_card.dart';
import 'package:crafity/interface/util/responsiveLayout.dart';

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  Widget modelListMobile() {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (ctx, idx) {
          return ModelProductCard();
        },
        childCount: 5,
      ),
      itemExtent: 75,
    );
  }

  Widget firstStep() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              labelText: 'Product Name',
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Text(
                'Build Model',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15),
              IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {},
                color: Color(0xFFF6B16C),
                tooltip:
                    'Give Some Caption Comment About Your Company and Tag with "#" Sign for Better Sale Your Products',
              ),
            ],
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFDEDEDE)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RaisedButton(
                  child: Text('Select Photo'),
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                SizedBox(height: 8),
                Text(
                  'lauren_botle.png',
                  style: TextStyle(color: Color(0xFF8174F2)),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    labelText: 'Product Price',
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Product Size',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    sizeList.length,
                    (idx) => Row(
                      children: <Widget>[
                        Checkbox(
                          value: _checked[idx],
                          onChanged: (val) {},
                          activeColor: Color(0xFFE36789),
                        ),
                        SizedBox(width: 6),
                        Text(
                          sizeList[idx],
                          style: TextStyle(
                              color: _checked[idx]
                                  ? Color(0xFFE36789)
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Color'),
                      onPressed: () {},
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    ButtonTheme(
                      height: 26,
                      minWidth: 26,
                      child: OutlineButton(
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFA74D76),
                          radius: 7,
                        ),
                        onPressed: () {},
                        borderSide: BorderSide(color: Color(0xFFA74D76)),
                        shape: CircleBorder(),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                      color: Color(0xFF858585),
                      iconSize: 15,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                ButtonTheme(
                  minWidth: double.infinity,
                  child: OutlineButton(
                    child: Text('Pick Model'),
                    textColor: Color(0xFF858585),
                    onPressed: () {},
                    borderSide: BorderSide(
                      color: Color(0xFF858585),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Discount',
              style: TextStyle(fontSize: 16),
            ),
            value: false,
            onChanged: (val) {},
            activeColor: Color(0xFFF27496),
            inactiveThumbColor: Color(0xFF858585),
          ),
          SizedBox(height: 15),
          Text(
            'Percentage',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Slider(
            value: 5.6,
            onChanged: (newVal) {},
            divisions: 5,
            label: '56%',
          ),
        ],
      );

  Widget secondStep() => Column(
        children: <Widget>[
          TextFormField(
            controller: TextEditingController(),
            maxLines: 12,
            decoration: InputDecoration(
              labelText: 'Description',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
            color: Color(0xFFF6B16C),
            tooltip:
                'Give Some Caption Comment About Your Company and Tag with "#" Sign for Better Sale Your Products',
          ),
        ],
      );

  Widget thirdStep() => Column(
        children: [
          InkWell(
            onTap: () {},
            child: Ink(
              height: 130,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF858585)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add_circle_outline),
                  SizedBox(height: 8),
                  Text('Preview Video'),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          ResponsiveLayout(
            largeScreen: Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, idx) => ModelProductCard(),
                itemCount: 3,
                itemExtent: 75,
              ),
            ),
            smallScreen: SizedBox.shrink(),
          ),
        ],
      );

  Widget formTitle() {
    return Text(
      'Preferred Product',
      style: TextStyle(
        color: Color(0xFFDFDFDF),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget formActionBtn() {
    return RaisedButton(
      child: Text('Keep to Shop'),
      onPressed: () {},
      color: Color(0xFFE36789),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // formTitle(),
          // SizedBox(height: 15),
          Form(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: firstStep(),
                ),
                SizedBox(width: 30, height: 30),
                Expanded(
                  child: secondStep(),
                ),
                SizedBox(width: 30, height: 30),
                Expanded(
                  child: thirdStep(),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: formActionBtn(),
          ),
        ],
      ),
      smallScreen: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  firstStep(),
                  SizedBox(height: 15),
                  secondStep(),
                  SizedBox(height: 15),
                  thirdStep(),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
          modelListMobile(),
          SliverToBoxAdapter(child: formActionBtn()),
        ],
      ),
    );
  }

  List<bool> _checked = [false, false, false];

  List<String> sizeList = ['Big', 'Medium', 'Small'];
}
