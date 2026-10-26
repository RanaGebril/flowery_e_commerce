import 'dart:math' as math;
import 'package:easy_localization/easy_localization.dart';
import 'package:flowery_e_commerce/core/constants/app_icons.dart';
import 'package:flowery_e_commerce/core/di/di.dart';
import 'package:flowery_e_commerce/core/responsive/size_helper.dart';
import 'package:flowery_e_commerce/core/routes/routes_names.dart';
import 'package:flowery_e_commerce/core/storage/session_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // One-shot intro sequence (logo -> name -> tagline -> loader).
  late final AnimationController _intro;
  // Endless loops (background bubbles, glow pulse, loading dots).
  late final AnimationController _loop;
  // Exit transition before navigating.
  late final AnimationController _exit;

  late final Animation<double> _logoScale;
  late final Animation<double> _logoFade;
  late final Animation<double> _logoRotate;
  late final Animation<double> _ringExpand;

  late final Animation<double> _nameFade;
  late final Animation<Offset> _nameSlide;

  late final Animation<double> _taglineFade;
  late final Animation<Offset> _taglineSlide;

  late final Animation<double> _loaderFade;

  late final Animation<double> _exitFade;
  late final Animation<double> _exitScale;

  static const _flowerCount = 12;
  late final List<_Flower> _flowers;

  @override
  void initState() {
    super.initState();

    final random = math.Random(7);
    _flowers = List.generate(_flowerCount, (_) => _Flower.random(random));

    _intro = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    _loop = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
    _exit = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    Animation<double> interval(double begin, double end, Curve curve) =>
        CurvedAnimation(parent: _intro, curve: Interval(begin, end, curve: curve));

    // Logo: pops in with a bounce and a small rotation.
    _logoScale = Tween<double>(begin: 0.0, end: 1.0)
        .animate(interval(0.0, 0.45, Curves.elasticOut));
    _logoFade = interval(0.0, 0.2, Curves.easeIn);
    _logoRotate = Tween<double>(begin: -0.35, end: 0.0)
        .animate(interval(0.0, 0.5, Curves.easeOutCubic));
    _ringExpand = interval(0.1, 0.7, Curves.easeOut);

    // App name: slides up and fades in.
    _nameFade = interval(0.4, 0.65, Curves.easeIn);
    _nameSlide = Tween<Offset>(begin: const Offset(0, 0.6), end: Offset.zero)
        .animate(interval(0.4, 0.65, Curves.easeOutCubic));

    // Tagline: slightly after the name.
    _taglineFade = interval(0.55, 0.8, Curves.easeIn);
    _taglineSlide = Tween<Offset>(begin: const Offset(0, 0.8), end: Offset.zero)
        .animate(interval(0.55, 0.8, Curves.easeOutCubic));

    _loaderFade = interval(0.75, 1.0, Curves.easeIn);

    _exitFade = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: _exit, curve: Curves.easeIn));
    _exitScale = Tween<double>(begin: 1, end: 1.08)
        .animate(CurvedAnimation(parent: _exit, curve: Curves.easeIn));

    _intro.forward();
    _navigate();
  }

  Future<void> _navigate() async {
    // Wait for the intro AND the session check, whichever takes longer.
    final results = await Future.wait([
      getIt<SessionStorage>().getToken(),
      Future.delayed(const Duration(milliseconds: 2800)),
    ]);

    if (!mounted) return;
    await _exit.forward();
    if (!mounted) return;

    final token = results.first as String?;
    if (token != null && token.isNotEmpty) {
      context.goNamed(RoutesNames.home);
    } else {
      context.goNamed(RoutesNames.login);
    }
  }

  @override
  void dispose() {
    _intro.dispose();
    _loop.dispose();
    _exit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final logoSize = context.setWidth(140);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: FadeTransition(
        opacity: _exitFade,
        child: ScaleTransition(
          scale: _exitScale,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1) Floating, spinning flowers in the background.
              AnimatedBuilder(
                animation: _loop,
                builder: (_, __) => CustomPaint(
                  painter: _FlowersPainter(
                    progress: _loop.value,
                    flowers: _flowers,
                    colors: [
                      colorScheme.primary,
                      colorScheme.secondary,
                      colorScheme.primary.withAlpha(170),
                    ],
                    centerColor: colorScheme.tertiary,
                  ),
                ),
              ),

              // 2) Main content.
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo with expanding ring + pulsing glow.
                    SizedBox(
                      width: logoSize * 2,
                      height: logoSize * 2,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Expanding ring (plays once with the intro).
                          AnimatedBuilder(
                            animation: _ringExpand,
                            builder: (_, __) {
                              final t = _ringExpand.value;
                              return Opacity(
                                opacity: (1 - t).clamp(0.0, 1.0),
                                child: Container(
                                  width: logoSize * (0.8 + t * 1.2),
                                  height: logoSize * (0.8 + t * 1.2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: colorScheme.primary
                                          .withAlpha(140),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          // Soft glow that keeps pulsing.
                          AnimatedBuilder(
                            animation: _loop,
                            builder: (_, __) {
                              final pulse =
                                  0.5 + 0.5 * math.sin(_loop.value * 2 * math.pi * 3);
                              return FadeTransition(
                                opacity: _logoFade,
                                child: Container(
                                  width: logoSize * (1.05 + pulse * 0.15),
                                  height: logoSize * (1.05 + pulse * 0.15),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorScheme.primary
                                        .withAlpha((25 + pulse * 25).toInt()),
                                  ),
                                ),
                              );
                            },
                          ),
                          // The logo itself.
                          FadeTransition(
                            opacity: _logoFade,
                            child: RotationTransition(
                              turns: _logoRotate,
                              child: ScaleTransition(
                                scale: _logoScale,
                                child: SvgPicture.asset(
                                  AppIcons.logo, // change to your real path
                                  width: logoSize,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // App name.
                    SlideTransition(
                      position: _nameSlide,
                      child: FadeTransition(
                        opacity: _nameFade,
                        child: Text(
                          'Flowery',
                          style: textTheme.headlineLarge?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.setHeight(8)),

                    // Tagline (optional, delete if you don't want it).
                    SlideTransition(
                      position: _taglineSlide,
                      child: FadeTransition(
                        opacity: _taglineFade,
                        child: Text(
                          'splashTagline'.tr(),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withAlpha(150),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 3) Bouncing loading dots at the bottom.
              Positioned(
                bottom: context.setHeight(60),
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: _loaderFade,
                  child: AnimatedBuilder(
                    animation: _loop,
                    builder: (_, __) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (i) {
                        // Each dot is offset in phase so they bounce in a wave.
                        final phase = (_loop.value * 6 - i * 0.25) % 1.0;
                        final bounce = math.sin(phase * math.pi).abs();
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 10,
                          height: 10,
                          transform: Matrix4.translationValues(0, -10 * bounce, 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorScheme.primary
                                .withAlpha((110 + 145 * bounce).toInt()),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Data for one floating flower in the background.
class _Flower {
  final double x; // 0..1 horizontal position
  final double size; // flower radius in logical pixels
  final double speed; // full rises per cycle (integer so the loop is seamless)
  final double phase; // 0..1 starting offset
  final double drift; // horizontal sway amplitude
  final int spins; // full rotations per rise (negative = counter-clockwise)
  final int petals; // 5..8
  final int colorIndex;

  _Flower(this.x, this.size, this.speed, this.phase, this.drift, this.spins,
      this.petals, this.colorIndex);

  factory _Flower.random(math.Random r) => _Flower(
    r.nextDouble(),
    10 + r.nextDouble() * 16,
    1 + r.nextInt(2).toDouble(),
    r.nextDouble(),
    10 + r.nextDouble() * 22,
    r.nextBool() ? 1 : -1,
    5 + r.nextInt(4),
    r.nextInt(3),
  );
}

class _FlowersPainter extends CustomPainter {
  final double progress;
  final List<_Flower> flowers;
  final List<Color> colors;
  final Color centerColor;

  _FlowersPainter({
    required this.progress,
    required this.flowers,
    required this.colors,
    required this.centerColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final f in flowers) {
      final t = (progress * f.speed + f.phase) % 1.0;
      final dy = size.height * (1.1 - t * 1.2); // rises bottom -> top
      final dx = size.width * f.x + math.sin(t * 2 * math.pi) * f.drift;
      // Fade in at the bottom, fade out at the top.
      final fade = math.sin(t * math.pi).clamp(0.0, 1.0);
      final rotation = t * 2 * math.pi * f.spins;

      canvas.save();
      canvas.translate(dx, dy);
      canvas.rotate(rotation);

      final petalPaint = Paint()
        ..color = colors[f.colorIndex % colors.length]
            .withAlpha((90 * fade).toInt());
      for (var i = 0; i < f.petals; i++) {
        canvas.save();
        canvas.rotate(i * 2 * math.pi / f.petals);
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(0, -f.size * 0.55),
            width: f.size * 0.6,
            height: f.size * 0.95,
          ),
          petalPaint,
        );
        canvas.restore();
      }

      // Flower center.
      canvas.drawCircle(
        Offset.zero,
        f.size * 0.22,
        Paint()..color = centerColor.withAlpha((140 * fade).toInt()),
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_FlowersPainter old) => old.progress != progress;
}