import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/kirimterima_controller.dart';
import 'package:gopay_task/models/contact_model.dart';

class TabviewUndang extends StatefulWidget {
  const TabviewUndang({super.key});

  @override
  State<TabviewUndang> createState() => _TabviewUndangState();
}

class _TabviewUndangState extends State<TabviewUndang> {
  // Menggunakan GetX untuk mengakses controller
  final KirimTerimaController controller = Get.find<KirimTerimaController>();
  late List<ContactModel> contacts;

  @override
  void initState() {
    super.initState();
    contacts = ContactData.getSampleContacts();
  }

  void _inviteContact(int index) {
    setState(() {
      contacts[index] = contacts[index].copyWith(isInvited: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0XFFFDFDFD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ajak teman download GoPay dapet saldo!',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 3),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF626E7A),
                      letterSpacing: -0.1,
                    ),
                    children: [
                      const TextSpan(
                        text:
                            'Kamu bisa dapetin GoPay saldo sebesar 150.000 untuk 15 teman yang upgrade ke GoPay Plus. ',
                      ),
                      TextSpan(
                        text: 'Syarat & Ketentuan',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF0A7F16),
                          letterSpacing: -0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          
          // Gunakan Obx untuk memperbarui UI saat filtered contacts berubah
          Obx(() {
            // Menampilkan pesan jika hasil pencarian kosong
            if (controller.filteredContacts.isEmpty && controller.searchText.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Icon(Icons.search_off, size: 48, color: Color(0xFF626E7A)),
                    const SizedBox(height: 10),
                    Text(
                      'Kontak tidak ditemukan',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF626E7A),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Coba dengan nama atau nomor lain',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF626E7A),
                      ),
                    ),
                  ],
                ),
              );
            }
            
            final displayedContacts = controller.searchText.value.isEmpty ? 
                                     contacts : controller.filteredContacts;
            
            return Column(
              children: List.generate(
                displayedContacts.length,
                (index) {
                  final contact = displayedContacts[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Color(0xFFFFFFFF), Color(0xFFEDEDED)],
                                  stops: [0.5, 1.0],
                                ),
                                borderRadius: BorderRadius.circular(45),
                                border: Border.all(
                                  color: const Color(0xFFEDEDED),
                                  width: 1,
                                ),
                              ),
                              child: const Icon(Icons.add, size: 14),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact.name,
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                Text(
                                  contact.phoneNumber,
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: const Color(0xFF626E7A),
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            controller.searchText.value.isEmpty
                              ? _buildInviteButton(index, contact)
                              : _buildInviteButtonWithController(index, contact),
                          ],
                        ),
                      ),
                      // Tampilkan divider kecuali untuk item terakhir
                      if (index < displayedContacts.length - 1)
                        Padding(
                          padding: const EdgeInsets.only(left: 72),
                          child: Divider(
                            color: const Color(0xFFEEEFF3),
                            thickness: 1,
                          ),
                        ),
                    ],
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildInviteButton(int index, ContactModel contact) {
    if (contact.isInvited) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEFF3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          'Terundang',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => _inviteContact(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFEEFFED)],
              stops: [0.1, 0.3],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            'Undang',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0XFF0A7F16),
              letterSpacing: -0.3,
            ),
          ),
        ),
      );
    }
  }
  
  Widget _buildInviteButtonWithController(int index, ContactModel contact) {
    if (contact.isInvited) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEFF3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          'Terundang',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () => controller.inviteContact(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFEEFFED)],
              stops: [0.1, 0.3],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            'Undang',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0XFF0A7F16),
              letterSpacing: -0.3,
            ),
          ),
        ),
      );
    }
  }
}