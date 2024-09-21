/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/game_week_point.svg
  SvgGenImage get gameWeekPoint => const SvgGenImage('assets/icons/game_week_point.svg');

  /// File path: assets/icons/game_week_rank.svg
  SvgGenImage get gameWeekRank => const SvgGenImage('assets/icons/game_week_rank.svg');

  /// File path: assets/icons/live_rank.svg
  SvgGenImage get liveRank => const SvgGenImage('assets/icons/live_rank.svg');

  /// File path: assets/icons/overall_points.svg
  SvgGenImage get overallPoints => const SvgGenImage('assets/icons/overall_points.svg');

  /// List of all assets
  List<SvgGenImage> get values => [gameWeekPoint, gameWeekRank, liveRank, overallPoints];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Player_image.png
  AssetGenImage get playerImage => const AssetGenImage('assets/images/Player_image.png');

  /// File path: assets/images/Playground.svg
  SvgGenImage get playground => const SvgGenImage('assets/images/Playground.svg');

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/avatar_image.png
  AssetGenImage get avatarImage => const AssetGenImage('assets/images/avatar_image.png');

  /// File path: assets/images/ball.svg
  SvgGenImage get ball => const SvgGenImage('assets/images/ball.svg');

  /// File path: assets/images/clipping _content.png
  AssetGenImage get clippingContent => const AssetGenImage('assets/images/clipping _content.png');

  /// File path: assets/images/fpl_id.png
  AssetGenImage get fplId => const AssetGenImage('assets/images/fpl_id.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/magic_wand.svg
  SvgGenImage get magicWand => const SvgGenImage('assets/images/magic_wand.svg');

  /// File path: assets/images/splash_screen.png
  AssetGenImage get splashScreenPng => const AssetGenImage('assets/images/splash_screen.png');

  /// File path: assets/images/splash_screen.svg
  SvgGenImage get splashScreenSvg => const SvgGenImage('assets/images/splash_screen.svg');

  /// List of all assets
  List<dynamic> get values => [
        playerImage,
        playground,
        appIcon,
        avatarImage,
        ball,
        clippingContent,
        fplId,
        logo,
        magicWand,
        splashScreenPng,
        splashScreenSvg
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar.json
  String get ar => 'assets/translations/ar.json';

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
