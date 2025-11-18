import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constant/app_colors.dart';
import 'package:fruits_app/features/checkout/presentation/model/addreess_model.dart';

import 'addreess_widgets/add_address_dialog.dart';
import 'addreess_widgets/address_item.dart';

class AddressSelector extends StatefulWidget {
  const AddressSelector({super.key});

  @override
  State<AddressSelector> createState() => _AddressSelectorState();
}

class _AddressSelectorState extends State<AddressSelector> {
  List<Address> addresses = [
    Address(
      id: 1,
      label: 'Address 1',
      name: 'John Doe',
      phone: '+000-11-1234567',
      address:
          'Room # 1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates',
      selected: true,
    ),
  ];

  void _showAddAddressDialog() {
    showDialog(
      context: context,
      builder: (context) => AddAddressDialog(
        onSave: (label, name, phone, address) {
          setState(() {
            if(label.isEmpty && name.isEmpty && phone.isEmpty ){
              return;
            }
            addresses.add(
              Address(
                id: addresses.length + 1,
                label: label.isEmpty
                    ? 'Address ${addresses.length + 1}'
                    : label,
                name: name,
                phone: phone,
                address: address,
                selected: false,
              ),
            );
          });
        },
      ),
    );
  }

  void _selectAddress(int id) {
    setState(() {
      for (var address in addresses) {
        address.selected = address.id == id;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Delivery Address',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: _showAddAddressDialog,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Add New Address',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Icon(Icons.add, color: AppColors.darkGray, size: 28),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: AddressItem(
                    address: address,
                    isSelected: address.selected,
                    onTap: () => _selectAddress(address.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
