import 'package:flutter/material.dart';
import 'package:flutter_app/stores/company_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CompanyStore companyStore = Provider.of<CompanyStore>(context);
    return Container(
      child: Observer(
        builder: (context) => ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(companyStore.companies[index].name ?? ''),
              leading: Icon(Icons.business),
              subtitle:
                  Text(companyStore.companies[index].address.fullAddress ?? ''),
              onTap: () async {
                await Navigator.of(context).pushNamed('detailscompany',
                    arguments: {'company': companyStore.companies[index]});
              },
            );
          },
          itemCount: companyStore.companies.length,
        ),
      ),
    );
  }
}
