import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      margin: const EdgeInsets.only(top: 48),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: isMobile ? 32 : 48,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Column(
          children: [
            if (!isMobile)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildAboutSection(),
                  ),
                  const SizedBox(width: 64),
                  Expanded(
                    child: _buildQuickLinks(),
                  ),
                  const SizedBox(width: 64),
                  Expanded(
                    child: _buildContactInfo(),
                  ),
                ],
              ),
            if (isMobile) ...[
              _buildAboutSection(),
              const SizedBox(height: 32),
              _buildQuickLinks(),
              const SizedBox(height: 32),
              _buildContactInfo(),
            ],
            SizedBox(height: isMobile ? 32 : 48),
            Divider(color: Colors.grey[700]),
            const SizedBox(height: 24),
            _buildCopyright(isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF114fed), Color(0xFF255ff1)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.work_outline,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'JobPortal',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Connecting talented individuals with amazing opportunities. Your next career move starts here.',
          style: GoogleFonts.inter(
            fontSize: 14,
            height: 1.6,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Home'),
        _buildFooterLink('Job Openings'),
        _buildFooterLink('About'),
        _buildFooterLink('Contact'),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in Touch',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(Icons.email_outlined, 'email@example.com'),
        _buildContactItem(Icons.phone_outlined, '+1 (555) 123-4567'),
        _buildContactItem(Icons.location_on_outlined, 'Your City, Country'),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: Colors.grey[400],
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: Colors.grey[400],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCopyright(bool isMobile) {
    return Text(
      '© 2024 JobPortal. All rights reserved.',
      style: GoogleFonts.inter(
        fontSize: 13,
        color: Colors.grey[500],
      ),
      textAlign: isMobile ? TextAlign.center : TextAlign.left,
    );
  }
}