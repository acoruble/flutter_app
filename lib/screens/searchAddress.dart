import 'package:flutter/material.dart';
import 'file:///D:/Documents/COURS/flutter_app/lib/repositories/address_repository.dart';
import 'package:flutter_app/models/address.dart';
import 'package:provider/provider.dart';

class SearchAddress extends StatefulWidget {

  final _editingController = TextEditingController();

  @override
  _SearchAddressState createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  List<Address> _addresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('titre de la page'),
      ),
      body: Container(
          padding: EdgeInsets.all(50),
          child: Column(children: <Widget>[
            _buildTextField(context),
            _buildListAddress(context),
          ])),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return TextField(
        controller: widget._editingController,
        decoration: InputDecoration(
          labelText: "Adresse de l'entreprise",
          prefixIcon: Icon(Icons.place),
        ),
        autofocus: true,
        onChanged: (value) async {
          if (value.length > 3) {
            AddressRepository addressRepository = Provider.of<AddressRepository>(context, listen: false);
            List<Address> addresses = await addressRepository.getAddress(value);
            setState(() {
              _addresses = addresses;
            });
          }
        });
  }

  Widget _buildListAddress(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          Address address = _addresses[index];
          return ListTile(
            title: Text(address.fullAddress ?? ''),
            onTap: () {
              Navigator.of(context).pop(address);
            },
          );
        },
        itemCount: _addresses.length,
      ),
    );
  }
}
