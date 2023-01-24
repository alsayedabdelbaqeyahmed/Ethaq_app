import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// loading indicator ========>>>
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(
            color ?? Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

// error body ========>>>
class ErrorBody extends StatelessWidget {
  const ErrorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('some_thing_went_wrong').tr(),
    );
  }
}

// empty body ========>>>
class EmptyBody extends StatelessWidget {
  const EmptyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'no_data_found'.tr(),
      ),
    );
  }
}

// asset svg image ========>>>
class AssetSvgImage extends StatelessWidget {
  const AssetSvgImage(
    this.assetName, {
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);
  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      color: color,
    );
  }
}

// image placeholder ========>>>
class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

// network image error ====>>>
class NetworkImageError extends StatelessWidget {
  const NetworkImageError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
