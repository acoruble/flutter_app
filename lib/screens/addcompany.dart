import 'package:flutter/material.dart';
import 'package:flutter_app/models/address.dart';
import 'package:flutter_app/models/company.dart';
import 'package:flutter_app/stores/company_store.dart';
import 'package:provider/provider.dart';

class AddCompany extends StatelessWidget {
  final _textFieldController = TextEditingController();
  final _addressFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Address _address = Address();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titre de la page'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  icon: Icon(Icons.business),
                  labelText: 'Entrer le nom de l\'entreprise',
                  border: InputBorder.none,
                  hintText: 'Entrer le nom de l\'entreprise',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entrer le nom de l\'entreprise';
                  }
                  return null;
                },
              ),
              TextFormField(
                onTap: () async {
                  _address = await Navigator.of(context)
                      .pushNamed('searchaddress') as Address;
                  _addressFieldController.text = _address.fullAddress;
                },
                focusNode: FocusNode(),
                enableInteractiveSelection: false,
                controller: _addressFieldController,
                decoration: InputDecoration(
                  icon: Icon(Icons.add_location),
                  labelText: 'Entrer l\'addresse de l\'entreprise',
                  border: InputBorder.none,
                  hintText: 'Entrer l\'addresse de l\'entreprise',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Entrer l\'addresse de l\'entreprise';
                  }
                  return null;
                },
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    String name = _textFieldController.text;
                    Company company = Company (
                      name: name,
                      address: _address);
                    Provider.of<CompanyStore>(context, listen: false).add(company);
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  'Ajouter',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
