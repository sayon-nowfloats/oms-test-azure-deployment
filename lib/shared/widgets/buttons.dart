import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

enum AppButtonType { primary, secondary, tertiary }

enum AppButtonShape { rectangle, roundedRectangle, circle }

typedef AppButtonBuilder = Widget Function(
    {Color? text, Color? background, Color? border});

class AppButton extends StatelessWidget {
  const AppButton({
    required this.child,
    this.type = AppButtonType.primary,
    this.shape = AppButtonShape.roundedRectangle,
    this.padding,
    this.onPressed,
    this.minWidth = 150,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final AppButtonType type;
  final AppButtonShape shape;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double minWidth;

  bool get enabled => onPressed != null;

  @override
  Widget build(BuildContext context) {
    if (shape == AppButtonShape.rectangle) {
      return ConstrainedBox(
        constraints: BoxConstraints(minWidth: minWidth),
        child: AppRectangularButton(
          padding: padding,
          type: type,
          onPressed: onPressed,
          child: child,
        ),
      );
    } else if (shape == AppButtonShape.roundedRectangle) {
      return ConstrainedBox(
        constraints: BoxConstraints(minWidth: minWidth),
        child: AppRoundedButton(
          padding: padding,
          type: type,
          onPressed: onPressed,
          child: child,
        ),
      );
    }
    assert(false);
    return const SizedBox.shrink();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(FlagProperty('enabled', value: enabled, ifFalse: 'disabled'))
      ..add(EnumProperty<AppButtonType>('type', type))
      ..add(EnumProperty<AppButtonShape>('shape', shape));
  }
}

class _LongButton extends StatelessWidget {
  const _LongButton({
    Key? key,
    required this.child,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.borderRadius,
    required this.padding,
  }) : super(key: key);

  final Widget child;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: 2,
              )
            : null,
        color: backgroundColor,
      ),
      child: Padding(
        padding: padding,
        child: Center(
          widthFactor: 1,
          heightFactor: 1,
          child: DefaultTextStyle.merge(
            style:
                AppTextTheme.of(context).paragraph.copyWith(color: textColor),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    Key? key,
    required this.image,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  final String image;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: 2,
              )
            : null,
        color: backgroundColor,
      ),
      child: Image.asset(image, color: textColor),
    );
  }
}

class AppCircleButton extends StatelessWidget {
  const AppCircleButton({
    Key? key,
    required this.image,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  final String image;
  final AppButtonType type;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    Widget builder({Color? text, Color? background, Color? border}) {
      return _CircleButton(
        textColor: text,
        backgroundColor: background,
        borderColor: border,
        image: image,
      );
    }

    if (onPressed != null) {
      if (type == AppButtonType.primary) {
        return _ButtonColors(
          textColor: AppColors.white,
          backgroundColor: AppColors.blue500,
          borderColor: AppColors.blue500,
          hoverTextColor: AppColors.white,
          hoverBackgroundColor: AppColors.blue500,
          hoverBorderColor: AppColors.blue500,
          pressedTextColor: AppColors.white,
          pressedBackgroundColor: AppColors.black,
          pressedBorderColor: AppColors.black,
          onPressed: onPressed,
          builder: builder,
        );
      } else if (type == AppButtonType.secondary) {
        return _ButtonColors(
          textColor: AppColors.gray600,
          backgroundColor: Colors.transparent,
          borderColor: AppColors.gray200,
          hoverTextColor: AppColors.blue500,
          hoverBackgroundColor: AppColors.white,
          hoverBorderColor: AppColors.blue500,
          pressedTextColor: AppColors.white,
          pressedBackgroundColor: AppColors.black,
          pressedBorderColor: AppColors.black,
          onPressed: onPressed,
          builder: builder,
        );
      } else if (type == AppButtonType.tertiary) {
        return _ButtonColors(
          textColor: AppColors.black,
          backgroundColor: Colors.transparent,
          borderColor: AppColors.black,
          hoverTextColor: AppColors.black,
          hoverBackgroundColor: AppColors.blue500,
          hoverBorderColor: AppColors.white,
          pressedTextColor: AppColors.black,
          pressedBackgroundColor: AppColors.white,
          pressedBorderColor: AppColors.white,
          onPressed: onPressed,
          builder: builder,
        );
      }
      assert(false);
      return const SizedBox.shrink();
    } else {
      return builder(
        text: AppColors.gray200,
        background: AppColors.white,
        border: AppColors.gray200,
      );
    }
  }
}

class AppRoundedButton extends StatelessWidget {
  const AppRoundedButton({
    Key? key,
    required this.child,
    required this.type,
    this.padding,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final AppButtonType type;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return _AppButton(
      borderRadius: BorderRadius.circular(8),
      type: type,
      onPressed: onPressed,
      padding: padding,
      child: child,
    );
  }
}

class AppRectangularButton extends StatelessWidget {
  const AppRectangularButton({
    Key? key,
    required this.child,
    required this.type,
    this.padding,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final AppButtonType type;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return _AppButton(
      borderRadius: BorderRadius.zero,
      type: type,
      onPressed: onPressed,
      padding: padding,
      child: child,
    );
  }
}

class _AppButton extends StatelessWidget {
  const _AppButton({
    Key? key,
    required this.child,
    required this.type,
    this.padding,
    required this.onPressed,
    required this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final AppButtonType type;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget builder({Color? text, Color? background, Color? border}) {
      return _LongButton(
        textColor: text,
        borderColor: border,
        backgroundColor: background,
        borderRadius: borderRadius,
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
        child: child,
      );
    }

    if (type == AppButtonType.primary) {
      return _ButtonColors(
        textColor: AppColors.white,
        backgroundColor: AppColors.blue3,
        borderColor: AppColors.blue3,
        hoverTextColor: AppColors.white,
        hoverBackgroundColor: AppColors.blue4,
        hoverBorderColor: AppColors.blue3,
        pressedTextColor: AppColors.white,
        pressedBackgroundColor: AppColors.black,
        pressedBorderColor: AppColors.black,
        onPressed: onPressed,
        builder: builder,
      );
    } else if (type == AppButtonType.secondary) {
      return _ButtonColors(
        textColor: AppColors.blue500,
        backgroundColor: AppColors.white,
        borderColor: AppColors.blue500,
        hoverTextColor: AppColors.white,
        hoverBackgroundColor: AppColors.blue500,
        hoverBorderColor: AppColors.blue500,
        pressedTextColor: AppColors.white,
        pressedBackgroundColor: AppColors.blue500,
        pressedBorderColor: AppColors.black,
        onPressed: onPressed,
        builder: builder,
      );
    } else if (type == AppButtonType.tertiary) {
      return _ButtonColors(
        textColor: AppColors.black,
        backgroundColor: AppColors.white,
        borderColor: AppColors.black,
        hoverTextColor: AppColors.black,
        hoverBackgroundColor: AppColors.gray200,
        hoverBorderColor: AppColors.black,
        pressedTextColor: AppColors.black,
        pressedBackgroundColor: AppColors.gray200,
        pressedBorderColor: AppColors.black,
        onPressed: onPressed,
        builder: builder,
      );
    }
    assert(false);
    return const SizedBox.shrink();
  }
}

class _ButtonColors extends StatefulWidget {
  const _ButtonColors({
    required this.builder,
    required this.onPressed,
    Key? key,
    required this.textColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.hoverTextColor,
    required this.hoverBackgroundColor,
    required this.hoverBorderColor,
    required this.pressedTextColor,
    required this.pressedBackgroundColor,
    required this.pressedBorderColor,
  }) : super(key: key);

  final Widget Function({Color? text, Color? background, Color? border})
      builder;
  final VoidCallback? onPressed;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color hoverTextColor;
  final Color hoverBackgroundColor;
  final Color hoverBorderColor;
  final Color pressedTextColor;
  final Color pressedBackgroundColor;
  final Color pressedBorderColor;

  bool get enabled => onPressed != null;

  @override
  _ButtonColorState createState() => _ButtonColorState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(FlagProperty('enabled', value: enabled, ifFalse: 'disabled'))
      ..add(ColorProperty('textColor', textColor))
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('borderColor', borderColor))
      ..add(ColorProperty('hoverTextColor', hoverTextColor))
      ..add(ColorProperty('hoverBackgroundColor', hoverBackgroundColor))
      ..add(ColorProperty('hoverBorderColor', hoverBorderColor))
      ..add(ColorProperty('pressedTextColor', pressedTextColor))
      ..add(ColorProperty('pressedBackgroundColor', pressedBackgroundColor))
      ..add(ColorProperty('pressedBorderColor', pressedBorderColor));
  }
}

class _ButtonColorState extends State<_ButtonColors>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> _backgroundAnimation;
  late Animation<Color?> _borderAnimation;
  late Animation<Color?> _textAnimation;

  late AnimationController _animationController;

  bool __buttonHeldDown = false;

  bool get _buttonHeldDown => __buttonHeldDown;

  set _buttonHeldDown(bool pressing) {
    if (pressing != __buttonHeldDown) {
      __buttonHeldDown = pressing;
      _animate(pressing ? 1 : 0.25);
    }
  }

  bool __buttonHovering = false;

  bool get _buttonHovering => __buttonHovering;

  set _buttonHovering(bool hovering) {
    if (hovering != __buttonHovering) {
      __buttonHovering = hovering;
      _animate(hovering ? 0.25 : 0);
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..addListener(() => setState(() {}));
    _setAnimations();
  }

  @override
  void reassemble() {
    _setAnimations();
    super.reassemble();
  }

  void _setAnimations() {
    final curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    );

    _backgroundAnimation = TweenSequence(
      [
        TweenSequenceItem(
          tween: ColorTween(
            begin: widget.backgroundColor,
            end: widget.hoverBackgroundColor,
          ),
          weight: 25,
        ),
        TweenSequenceItem(
          tween: ColorTween(
            begin: widget.hoverBackgroundColor,
            end: widget.pressedBackgroundColor,
          ),
          weight: 25,
        ),
      ],
    ).animate(curve);

    _borderAnimation = TweenSequence(
      [
        TweenSequenceItem(
          tween: ColorTween(
            begin: widget.borderColor,
            end: widget.hoverBorderColor,
          ),
          weight: 25,
        ),
        TweenSequenceItem(
          tween: ColorTween(
            begin: widget.hoverBorderColor,
            end: widget.pressedBorderColor,
          ),
          weight: 25,
        ),
      ],
    ).animate(curve);
    _textAnimation = TweenSequence(
      [
        TweenSequenceItem(
          tween: ColorTween(
            begin: widget.textColor,
            end: widget.hoverTextColor,
          ),
          weight: 25,
        ),
        TweenSequenceItem(
          tween: ColorTween(
            begin: widget.hoverTextColor,
            end: widget.pressedTextColor,
          ),
          weight: 25,
        ),
      ],
    ).animate(curve);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _animate(double value) {
    if (!_animationController.isAnimating) {
      final bool wasHeldDown = _buttonHeldDown;
      final bool wasHovering = _buttonHovering;
      _animationController.animateTo(value).then((_) {
        if (mounted &&
            (wasHeldDown != _buttonHeldDown ||
                wasHovering != _buttonHovering)) {
          _animate(0);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.onPressed == null,
      child: Opacity(
        opacity: widget.onPressed != null ? 1 : 0.5,
        child: MouseRegion(
          onEnter: (_) => _buttonHovering = true,
          onExit: (_) => _buttonHovering = false,
          cursor: SystemMouseCursors.click,
          child: InkWell(
            //behavior: HitTestBehavior.opaque,
            onTapDown: (_) => _buttonHeldDown = true,
            onTapUp: (_) => _buttonHeldDown = false,
            onTapCancel: () => _buttonHeldDown = false,
            onTap: Feedback.wrapForTap(widget.onPressed, context),
            child: Semantics(
              button: true,
              child: widget.builder(
                text: _textAnimation.value,
                background: _backgroundAnimation.value,
                border: _borderAnimation.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    Key? key,
    this.color,
    this.onPressed,
    this.icon,
  }) : super(key: key);
  final Color? color;
  final Icon? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: icon ??
          const Icon(
            Icons.arrow_back_sharp,
            size: 30,
          ),
      color: color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}

class AppOutlinedIconButton extends StatefulWidget {
  const AppOutlinedIconButton({
    Key? key,
    this.icon,
    required this.textWidget,
  }) : super(key: key);

  final Icon? icon;
  final Text textWidget;

  @override
  State<AppOutlinedIconButton> createState() => _AppOutlinedIconButtonState();
}

class _AppOutlinedIconButtonState extends State<AppOutlinedIconButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1, color: Colors.black),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 8,
          )),
      child: DefaultTextStyle.merge(
        style:
            AppTextTheme.of(context).paragraph.copyWith(color: AppColors.black),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        child: Row(
          children: [if (widget.icon != null) widget.icon!, widget.textWidget],
        ),
      ),
    );
  }
}

class RoundMaterialIconButton extends StatelessWidget {
  const RoundMaterialIconButton(
      {Key? key,
      this.contentPadding,
      this.color = AppColors.grayWhite,
      required this.icon,
      this.onTap})
      : super(key: key);

  final EdgeInsetsGeometry? contentPadding;
  final VoidCallback? onTap;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: contentPadding ?? const EdgeInsets.all(6),
            child: icon,
          ),
        ),
      ),
    );
  }
}
