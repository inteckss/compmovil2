import 'package:flutter/material.dart';

class OptimizedImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? placeholderColor;
  final IconData placeholderIcon;
  final double placeholderIconSize;
  final BorderRadius? borderRadius;

  const OptimizedImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderColor,
    this.placeholderIcon = Icons.image,
    this.placeholderIconSize = 50,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: placeholderColor ?? Colors.grey[300],
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.hardEdge,
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? Image.network(
              imageUrl!,
              width: width,
              height: height,
              fit: fit,
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: frame != null
                      ? child
                      : Center(
                          child: Icon(
                            placeholderIcon,
                            size: placeholderIconSize,
                            color: Colors.grey[600],
                          ),
                        ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: placeholderIconSize,
                        color: Colors.red[400],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Error al cargar imagen',
                        style: TextStyle(
                          color: Colors.red[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Icon(
                placeholderIcon,
                size: placeholderIconSize,
                color: Colors.grey[600],
              ),
            ),
    );
  }
}