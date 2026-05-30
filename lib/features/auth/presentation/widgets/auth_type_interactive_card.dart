import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waterrush/features/auth/presentation/widgets/auth_role_option_card.dart';

class AuthTypeInteractiveCard extends StatefulWidget {
  const AuthTypeInteractiveCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.route,
    super.key,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String route;

  @override
  State<AuthTypeInteractiveCard> createState() =>
      _AuthTypeInteractiveCardState();
}

class _AuthTypeInteractiveCardState extends State<AuthTypeInteractiveCard> {
  bool _isHovered = false;

  static const LinearGradient _activeGradient = LinearGradient(
    colors: <Color>[Color(0xFF0C48D9), Color(0xFF1FB3FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  void _setHovered(bool value) {
    if (_isHovered != value) {
      setState(() => _isHovered = value);
    }
  }

  void _handleSelect() {
    _setHovered(false);
    context.push(widget.route);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _setHovered(true),
      onPointerUp: (_) => _setHovered(false),
      onPointerCancel: (_) => _setHovered(false),
      child: AuthRoleOptionCard(
        title: widget.title,
        subtitle: widget.subtitle,
        icon: widget.icon,
        onTap: _handleSelect,
        gradient: _isHovered ? _activeGradient : null,
        backgroundColor: _isHovered ? null : const Color(0xFFF1F5FC),
        iconCircleColor:
            _isHovered ? const Color(0xFF2EA8FF) : const Color(0xFF2E90FF),
        iconColor: Colors.white,
        titleColor: _isHovered ? Colors.white : const Color(0xFF113A7A),
        subtitleColor:
            _isHovered ? const Color(0xFFE4F2FF) : const Color(0xFF5E7697),
        trailingCircleColor:
            _isHovered ? const Color(0xFFF3F9FF) : const Color(0xFFF8FBFF),
        trailingIconColor:
            _isHovered ? const Color(0xFF137CFF) : const Color(0xFF197FFF),
        border: _isHovered
            ? null
            : Border.all(color: const Color(0xFFDDE7F5), width: 1.w),
      ),
    );
  }
}