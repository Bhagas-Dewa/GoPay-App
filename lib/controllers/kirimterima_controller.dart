import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gopay_task/models/contact_model.dart';

class KirimTerimaController extends GetxController {
  final scrollController = ScrollController();
  var isScrolled = false.obs;
  

  final searchController = TextEditingController();
  var searchText = ''.obs;
  var filteredContacts = <ContactModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
    
    filteredContacts.value = ContactData.getSampleContacts();
    
    searchController.addListener(() {
      searchText.value = searchController.text;
      filterContacts();
    });
  }
  
  void filterContacts() {
    if (searchText.value.isEmpty) {
      filteredContacts.value = ContactData.getSampleContacts();
    } else {
      final normalizedQuery = _normalizeString(searchText.value);
      final allContacts = ContactData.getSampleContacts();

      filteredContacts.value = allContacts.where((contact) {

        final normalizedName = _normalizeString(contact.name);
        final normalizedPhone = _normalizeString(contact.phoneNumber);
        
        return normalizedName.contains(normalizedQuery) || 
               normalizedPhone.contains(normalizedQuery);
      }).toList();
    }
  }
  
  String _normalizeString(String input) {
    final trimmed = input.trim();
    final lowercase = trimmed.toLowerCase();
    final normalized = lowercase.replaceAll(RegExp(r'[\s\-\+\(\)]'), '');
    return normalized;
  }
  
  void inviteContact(int index) {
    filteredContacts[index] = filteredContacts[index].copyWith(isInvited: true);
    
    final contact = filteredContacts[index];
    final allContacts = ContactData.getSampleContacts();
    
    for (int i = 0; i < allContacts.length; i++) {
      if (_normalizeString(allContacts[i].name) == _normalizeString(contact.name) &&
          _normalizeString(allContacts[i].phoneNumber) == _normalizeString(contact.phoneNumber)) {
        final updatedOriginalContacts = List<ContactModel>.from(allContacts);
        updatedOriginalContacts[i] = updatedOriginalContacts[i].copyWith(isInvited: true);
        
        if (searchText.value.isEmpty) {
          filteredContacts.value = updatedOriginalContacts;
        } else {
          filterContacts(); // Re-filter dengan daftar yang diperbarui
        }
        break;
      }
    }
  }

  void _onScroll() {
    isScrolled.value = scrollController.offset > 0;
  }

  @override
  void onClose() {
    scrollController.dispose();
    searchController.dispose();
    super.onClose();
  }
}