import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FA),

      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            debugPrint('Back clicked');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Cart clicked');
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_bag_outlined),
                Positioned(
                  right: -8,
                  top: -8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Main content
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xFFDCEBFF),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'CAMPUS STORE',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Ready for checkout',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF17264A),
              ),
            ),

            const Text(
              'Review your items before placing your order.',
              style: TextStyle(fontSize: 13),
            ),

            const SizedBox(height: 16),

            // Delivery information
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deliver to Palma, Rachel M.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Matina, Davao City',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      debugPrint('Change delivery address clicked');
                    },
                    child: const Text('Change'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Order items
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Items',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('3 items'),
              ],
            ),

            const SizedBox(height: 10),

            // Product cards
            const CartItemCard(
              productName: 'Wireless Mouse',
              price: 'PHP 450.00',
              quantity: 1,
              icon: Icons.mouse_outlined,
            ),

            const SizedBox(height: 8),

            const CartItemCard(
              productName: 'USB-C Hub',
              price: 'PHP 850.00',
              quantity: 1,
              icon: Icons.usb,
            ),

            const SizedBox(height: 8),

            const CartItemCard(
              productName: 'Laptop Stand',
              price: 'PHP 700.00',
              quantity: 1,
              icon: Icons.laptop,
            ),

            const SizedBox(height: 12),

            // Discount banner
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFDCEBFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.local_offer, color: Colors.blue),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'STUDENT10 applied',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '10% discount on items',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.check_circle, color: Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Payment summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Payment Summary',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  summaryRow('Subtotal', 'PHP 2,000.00'),
                  summaryRow('Discount (10%)', '- PHP 200.00'),
                  summaryRow('Delivery Fee', 'PHP 50.00'),

                  const Divider(),

                  summaryRow(
                    'Total',
                    'PHP 1,850.00',
                    bold: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Place order button
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint(
                    'Place order clicked! Total: PHP 1850.00',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock, size: 17),
                    SizedBox(width: 8),
                    Text('Place Order'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Payment summary row
  static Widget summaryRow(
    String title,
    String amount, {
    bool bold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// Product card
class CartItemCard extends StatelessWidget {
  final String productName;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Product icon
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFDCEBFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 30,
            ),
          ),

          const SizedBox(width: 10),

          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),

                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 5),

                // Quantity buttons
                Row(
                  children: [
                    quantityButton(
                      Icons.remove,
                      () {
                        debugPrint('Decrease quantity: $productName');
                      },
                    ),

                    Container(
                      width: 38,
                      height: 24,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text('$quantity'),
                    ),

                    quantityButton(
                      Icons.add,
                      () {
                        debugPrint('Increase quantity: $productName');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Delete button
          IconButton(
            onPressed: () {
              debugPrint('Remove item: $productName');
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // Quantity button
  Widget quantityButton(
    IconData icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 28,
      height: 24,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: Colors.blue,
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
