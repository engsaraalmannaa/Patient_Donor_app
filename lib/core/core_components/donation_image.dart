import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DonationImage extends StatefulWidget {
  final String imageUrl;
  const DonationImage({super.key, required this.imageUrl});

  @override
  State<DonationImage> createState() => _DonationImageState();
}

class _DonationImageState extends State<DonationImage> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_isLoading)
          SizedBox(
            height: 50.vmin,
            width: 60.vmin,
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        Image.network(
          widget.imageUrl,
          height: 50.vmin,
          width: 60.vmin,
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              // خلص تحميل الصورة
              if (_isLoading) {
                Future.microtask(() {
                  setState(() => _isLoading = false);
                });
              }
              return child;
            }
            return const SizedBox(); // ما نرجع شي لأن اللودر مبين أصلاً
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.broken_image, size: 20.vmin, color: Colors.grey);
          },
        ),
      ],
    );
  }
}
