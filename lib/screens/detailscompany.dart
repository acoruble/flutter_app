import 'package:flutter/material.dart';
import 'package:flutter_app/models/company.dart';
import 'package:flutter_app/stores/company_store.dart';
import 'package:provider/provider.dart';

class DetailsCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final Company company = args['company'];
    print(company);
    return Scaffold(
      appBar: AppBar(
        title: Text(company.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<CompanyStore>(context, listen: false).remove(company.id);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(company.name),
          Text(company.address.fullAddress),
        ],
      ),
    );
  }
}
