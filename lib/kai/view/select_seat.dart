import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectSeat extends StatefulWidget {
  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  bool isDropdownOpened = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kursi',
          style:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: 250,
              margin: const EdgeInsets.only(left: 0, top: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xF9FAFBFB),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 0.5,
                    offset: const Offset(0.5, 0.5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Penumpang 1 | Eko1 - 3A ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    isDropdownOpened
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 5,
                  ),
                  itemCount: 25, // Replace with the appropriate item count
                  itemBuilder: (context, index) {
                    if (index % 5 == 3 || index % 5 == 4) {
                      return SizedBox(
                          width:
                              10); // Spacing between the 3 grid and the 2 grid
                    } else {
                      return GestureDetector(
                        onTap: () {
                          // Logic when a seat is selected
                        },
                        child: Container(
                          width:
                              25.0, // Adjust the width as desired (e.g., 25.0)
                          height:
                              25.0, // Adjust the height as desired (e.g., 25.0)
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black38,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
