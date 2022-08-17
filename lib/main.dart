import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Beehive Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    // appMgr.invokeMethod('getPlatformVersion').then((value) => print('flutter received ${value}'));
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            height: 68,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TextButton(onPressed: () {}, child: Text('剪切板'));
                return MouseRegion(
                  onEnter: (enter) {
                    debugPrint('mouse enter');
                  },
                  onExit: (onExit) {
                    debugPrint('mouse onExit');
                  },
                  onHover: (hover) {
                    debugPrint('mouse hover');
                  },
                  child: TextButton(onPressed: () {}, child: Text('剪切板')),
                );
              },
            ),
          ),
          Expanded(
            // child: ListView.builder(
            //   itemCount: 5,
            //   itemBuilder: (context, index) {
            //     return TextButton(
            //       onHover: (hovered) {
            //         debugPrint('$hovered $index');
            //       },
            //       onPressed: () {},
            //       style: ButtonStyle(
            //         foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            //           if (states.contains(MaterialState.hovered)) return Colors.yellow;
            //           if (states.contains(MaterialState.focused)) return Colors.red;
            //           if (states.contains(MaterialState.scrolledUnder)) return Colors.green;
            //           if (states.contains(MaterialState.hovered)) return Colors.yellow;
            //           if (states.contains(MaterialState.hovered)) return Colors.yellow;
            //           if (states.contains(MaterialState.hovered)) return Colors.yellow;
            //
            //           return Colors.blue;
            //         }),
            //       ),
            //       child: const Text(
            //         'Text Button ',
            //         style: TextStyle(fontSize: 24),
            //       ),
            //     );
            //   },
            // ),

            child: SizedBox(),
          ),
          Container(
            height: 102,
            color: Colors.white,
            child: MacosIconButton(
              icon: const Icon(
                Icons.confirmation_num_sharp,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(7),
              onPressed: () {},
            ),
          )
        ],
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

///

enum DiagnosticsTreeStyle {
  /// A style that does not display the tree, for release mode.
  none,

  /// Sparse style for displaying trees.
  ///
  /// See also:
  ///
  ///  * [RenderObject], which uses this style.
  sparse,

  /// Connects a node to its parent with a dashed line.
  ///
  /// See also:
  ///
  ///  * [RenderSliverMultiBoxAdaptor], which uses this style to distinguish
  ///    offstage children from onstage children.
  offstage,

  /// Slightly more compact version of the [sparse] style.
  ///
  /// See also:
  ///
  ///  * [Element], which uses this style.
  dense,

  /// Style that enables transitioning from nodes of one style to children of
  /// another.
  ///
  /// See also:
  ///
  ///  * [RenderParagraph], which uses this style to display a [TextSpan] child
  ///    in a way that is compatible with the [DiagnosticsTreeStyle.sparse]
  ///    style of the [RenderObject] tree.
  transition,

  /// Style for displaying content describing an error.
  ///
  /// See also:
  ///
  ///  * [FlutterError], which uses this style for the root node in a tree
  ///    describing an error.
  error,

  /// Render the tree just using whitespace without connecting parents to
  /// children using lines.
  ///
  /// See also:
  ///
  ///  * [SliverGeometry], which uses this style.
  whitespace,

  /// Render the tree without indenting children at all.
  ///
  /// See also:
  ///
  ///  * [DiagnosticsStackTrace], which uses this style.
  flat,

  /// Render the tree on a single line without showing children.
  singleLine,

  /// Render the tree using a style appropriate for properties that are part
  /// of an error message.
  ///
  /// The name is placed on one line with the value and properties placed on
  /// the following line.
  ///
  /// See also:
  ///
  ///  * [singleLine], which displays the same information but keeps the
  ///    property and value on the same line.
  errorProperty,

  /// Render only the immediate properties of a node instead of the full tree.
  ///
  /// See also:
  ///
  ///  * [DebugOverflowIndicatorMixin], which uses this style to display just
  ///    the immediate children of a node.
  shallow,

  /// Render only the children of a node truncating before the tree becomes too
  /// large.
  truncateChildren,
}

///

class DiagnosticPropertiesBuilder {
  /// Creates a [DiagnosticPropertiesBuilder] with [properties] initialize to
  /// an empty array.
  DiagnosticPropertiesBuilder() : properties = <DiagnosticsNode>[];

  /// Creates a [DiagnosticPropertiesBuilder] with a given [properties].
  DiagnosticPropertiesBuilder.fromProperties(this.properties);

  /// Add a property to the list of properties.
  void add(DiagnosticsNode property) {
    assert(() {
      properties.add(property);
      return true;
    }());
  }

  /// List of properties accumulated so far.
  final List<DiagnosticsNode> properties;

  /// Default style to use for the [DiagnosticsNode] if no style is specified.
  DiagnosticsTreeStyle defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.sparse;

  /// Description to show if the node has no displayed properties or children.
  String? emptyBodyDescription;
}

///
///
class MacosIconButton extends StatefulWidget {
  /// Builds a macOS-style icon button
  const MacosIconButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.disabledColor,
    this.hoverColor,
    this.onPressed,
    this.pressedOpacity = 0.4,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.alignment = Alignment.center,
    this.semanticLabel,
    this.boxConstraints = const BoxConstraints(
      minHeight: 20,
      minWidth: 20,
      maxWidth: 30,
      maxHeight: 30,
    ),
    this.padding,
    this.mouseCursor = SystemMouseCursors.basic,
  }) : assert(pressedOpacity == null || (pressedOpacity >= 0.0 && pressedOpacity <= 1.0));

  /// The widget to use as the icon.
  ///
  /// Typically an [Icon] widget.
  final Widget icon;

  /// The background color of this [MacosIconButton].
  ///
  /// Defaults to [CupertinoColors.activeBlue]. Set to [Colors.transparent] for
  /// a transparent background color.
  final Color? backgroundColor;

  /// The color of the button's background when the button is disabled.
  final Color? disabledColor;

  /// The color of the button's background when the mouse hovers over it.
  ///
  /// Set to Colors.transparent to disable the hover effect.
  final Color? hoverColor;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The opacity that the button will fade to when it is pressed.
  /// The button will have an opacity of 1.0 when it is not pressed.
  ///
  /// This defaults to 0.4. If null, opacity will not change on pressed if using
  /// your own custom effects is desired.
  final double? pressedOpacity;

  /// The shape to make the button.
  ///
  /// Defaults to `BoxShape.rectangle`.
  final BoxShape shape;

  /// The border radius for the button.
  ///
  /// This should only be set if setting [shape] to `BoxShape.rectangle`.
  ///
  /// Defaults to `BorderRadius.circular(7.0)`.
  final BorderRadius? borderRadius;

  ///The alignment of the button's icon.
  ///
  /// Typically buttons are sized to be just big enough to contain the child and its
  /// [padding]. If the button's size is constrained to a fixed size, for example by
  /// enclosing it with a [SizedBox], this property defines how the child is aligned
  /// within the available space.
  ///
  /// Always defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// The box constraints for the button.
  ///
  /// Defaults to
  /// ```dart
  /// const BoxConstraints(
  ///   minHeight: 20,
  ///   minWidth: 20,
  ///   maxWidth: 30,
  ///   maxHeight: 30,
  /// ),
  ///```
  final BoxConstraints boxConstraints;

  /// The internal padding for the button's [icon].
  ///
  /// Defaults to `EdgeInsets.all(8)`.
  final EdgeInsetsGeometry? padding;

  /// The semantic label used by screen readers.
  final String? semanticLabel;

  /// The mouse cursor to use when hovering over this widget.
  final MouseCursor? mouseCursor;

  /// Whether the button is enabled or disabled. Buttons are disabled by default. To
  /// enable a button, set its [onPressed] property to a non-null value.
  bool get enabled => onPressed != null;

  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(ColorProperty('backgroundColor', backgroundColor));
  //   properties.add(ColorProperty('disabledColor', disabledColor));
  //   properties.add(ColorProperty('hoverColor', hoverColor));
  //   properties.add(DoubleProperty('pressedOpacity', pressedOpacity));
  //   properties.add(DiagnosticsProperty('alignment', alignment));
  //   properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding));
  //   properties.add(StringProperty('semanticLabel', semanticLabel));
  // }

  @override
  MacosIconButtonState createState() => MacosIconButtonState();
}

class MacosIconButtonState extends State<MacosIconButton> with SingleTickerProviderStateMixin {
  // Eyeballed values. Feel free to tweak.
  static const Duration kFadeOutDuration = Duration(milliseconds: 10);
  static const Duration kFadeInDuration = Duration(milliseconds: 100);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController.drive(CurveTween(curve: const Interval(0.0, 0.25))).drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(MacosIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity ?? 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @visibleForTesting
  bool buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!buttonHeldDown) {
      buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (buttonHeldDown) {
      buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (buttonHeldDown) {
      buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) return;
    final bool wasHeldDown = buttonHeldDown;
    final TickerFuture ticker = buttonHeldDown
        ? _animationController.animateTo(1.0, duration: kFadeOutDuration)
        : _animationController.animateTo(0.0, duration: kFadeInDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;
    final theme = Theme.of(context);

    final Color backgroundColor = widget.backgroundColor ?? theme.backgroundColor;

    final Color hoverColor = widget.hoverColor ?? theme.hoverColor;

    final Color? disabledColor;

    if (widget.disabledColor != null) {
      disabledColor = widget.disabledColor;
    } else {
      disabledColor = theme.disabledColor;
    }

    final padding = widget.padding ?? const EdgeInsets.all(8);

    return MouseRegion(
      cursor: widget.mouseCursor!,
      onEnter: (e) {
        setState(() => _isHovered = true);
      },
      onExit: (e) {
        setState(() => _isHovered = false);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: enabled ? _handleTapDown : null,
        onTapUp: enabled ? _handleTapUp : null,
        onTapCancel: enabled ? _handleTapCancel : null,
        onTap: widget.onPressed,
        child: Semantics(
          label: widget.semanticLabel,
          button: true,
          child: ConstrainedBox(
            constraints: widget.boxConstraints,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: widget.shape,
                  // ignore: prefer_if_null_operators
                  borderRadius: widget.borderRadius != null
                      ? widget.borderRadius
                      : widget.shape == BoxShape.rectangle
                          ? BorderRadius.circular(7.0)
                          : null,
                  color: !enabled
                      ? disabledColor
                      : _isHovered
                          ? hoverColor
                          : backgroundColor,
                ),
                child: Padding(
                  padding: padding,
                  child: Align(
                    alignment: widget.alignment,
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: widget.icon,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
