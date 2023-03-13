import 'package:flutter/material.dart';
import 'package:crafity/interface/screen/user_dashboard/form/models/user_form.dart';

class BuildStoreForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: List.generate(
        stepList.length,
        (idx) {
          return Step(
            title: Text(
              stepList[idx].title,
              style: TextStyle(
                color: Color(0xFF858585),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: Form(child: stepList[idx].content),
            state: StepState.indexed,
            isActive: false,
          );
        },
      ),
      currentStep: 0,
      onStepCancel: () {},
      onStepContinue: () {},
      onStepTapped: (idx) {},
    );
  }

  List<StepEntity> get stepList => [
        StepEntity(
          title: 'Profile',
          content: profileForm(),
        ),
        StepEntity(
          title: 'Description',
          content: descriptionForm(),
        ),
        StepEntity(
          title: 'Credit Card',
          content: CreditCardForm.creditFormField(),
        ),
        StepEntity(
          title: 'Sales Analytic',
          content: salesForm(),
        ),
      ];

  Widget profileForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextFormField(
          controller: TextEditingController(),
          maxLength: 20,
          decoration: InputDecoration(
            labelText: 'Store Name',
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
        ButtonBar(
          children: <Widget>[
            DropdownButton(
              items: region
                  .map((item) => DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      ))
                  .toList(),
              onChanged: (val) {},
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 16,
              value: region[0],
              itemHeight: 30,
            ),
            DropdownButton(
              items: country
                  .map((item) => DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      ))
                  .toList(),
              onChanged: (val) {},
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 16,
              value: country[0],
              itemHeight: 30,
            ),
          ],
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: 'Address',
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
        DropdownButton(
          items: role
              .map((item) => DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  ))
              .toList(),
          onChanged: (val) {},
          icon: Icon(Icons.keyboard_arrow_down),
          iconSize: 16,
          value: role[0],
          itemHeight: 30,
        ),
      ],
    );
  }

  Widget descriptionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            RaisedButton.icon(
              icon: Icon(Icons.insert_photo),
              label: Text('Gallery'),
              onPressed: () {},
              color: Colors.white,
              textColor: Color(0xFF858585),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            IconButton(
              icon: Icon(Icons.info_outline),
              iconSize: 17,
              color: Color(0xFFF6B16C),
              onPressed: () {},
              tooltip:
                  'Post photo and video for Identity Max three photo you can pick',
            ),
          ],
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 45,
          child: ListView.builder(
            itemBuilder: (idx, ctx) => Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Image.asset(
                'assets/perfume9.jpg',
                fit: BoxFit.cover,
              ),
            ),
            itemExtent: 70,
            itemCount: 2,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: TextEditingController(),
          maxLines: 8,
          decoration: InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        IconButton(
          icon: Icon(Icons.info_outline),
          iconSize: 17,
          color: Color(0xFFF6B16C),
          onPressed: () {},
          tooltip:
              'Give Some Caption Comment About Your Company and Tag with "#" Sign for Better Sale Your Products',
        ),
      ],
    );
  }

  Widget salesForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: Text(
            'Enabled Business Analysis',
            style: TextStyle(fontSize: 16),
          ),
          onChanged: (val) {},
          value: true,
          activeColor: Color(0xFFF27496),
        ),
        SizedBox(height: 15),
        Text(
          'Cost Shop',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: Slider(
                value: 5.6,
                onChanged: (newVal) {},
                divisions: 5,
                label: '56M',
              ),
            ),
            DropdownButton(
              items: unitPrice
                  .map((item) => DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      ))
                  .toList(),
              onChanged: (val) {},
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 16,
              value: unitPrice[1],
              itemHeight: 30,
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(
          'Income Plan',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: Slider(
                value: 2.3,
                onChanged: (newVal) {},
                divisions: 5,
                label: '23M',
              ),
            ),
            DropdownButton(
              items: unitPrice
                  .map((item) => DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      ))
                  .toList(),
              onChanged: (val) {},
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 16,
              value: unitPrice[1],
              itemHeight: 30,
            ),
          ],
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: TextEditingController(),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Product Frequency',
            helperText: 'Value of production product every month',
            suffixText: 'pts',
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: TextEditingController(),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Profit',
            helperText: 'Calculate profit employe to every product',
            prefixText: '\$',
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
        SwitchListTile(
          title: Text(
            'Automatic Approval',
            style: TextStyle(fontSize: 16),
          ),
          subtitle: Text(
            'Send Approval Message if Order Success ',
            style: TextStyle(fontSize: 12),
          ),
          onChanged: (val) {},
          value: false,
          activeColor: Color(0xFFF27496),
        ),
      ],
    );
  }

  List<String> region = ['Region', 'Jalarta', 'New York', 'Paris'];

  List<String> country = ['Country', 'Indonesia', 'AS', 'France'];

  List<String> role = [
    'Role',
    'Directur',
    'Manajer',
    'Marketing',
    'Distributor',
  ];

  List<String> unitPrice = ['Thousand', 'Million', 'Billion', 'Trillion'];
}

class StepEntity {
  StepEntity({this.title, this.content});

  final String title;
  final Widget content;
}
