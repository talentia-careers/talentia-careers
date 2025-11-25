import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onExploreJobs;

  const HeroSection({super.key, required this.onExploreJobs});
  final String whatsappNumber = '923334711156';

  Future<void> _openWhatsApp() async {
    final message = Uri.encodeComponent('Hi! I found your job portal and would like to get in touch.');
    final whatsappUrl = 'https://wa.me/$whatsappNumber?text=$message';

    try {
      final Uri url = Uri.parse(whatsappUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        print('❌ Could not launch WhatsApp');
      }
    } catch (e) {
      print('❌ Error opening WhatsApp: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1400),
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 40 : 80,
      ),
      child: isMobile
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context, isTablet),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildImageSection(context, true),
        const SizedBox(height: 48),
        _buildContentSection(context, true),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: isTablet ? 1 : 3,
          child: _buildContentSection(context, false),
        ),
        SizedBox(width: isTablet ? 40 : 80),
        Expanded(
          flex: isTablet ? 1 : 2,
          child: _buildImageSection(context, false),
        ),
      ],
    );
  }

  Widget _buildContentSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Futuristic Badge
        _buildFuturisticBadge(isMobile),

        SizedBox(height: isMobile ? 24 : 32),

        // Main Heading with Animation Effect
        _buildMainHeading(isMobile),

        SizedBox(height: isMobile ? 16 : 20),

        // Gradient Subtitle
        _buildGradientSubtitle(isMobile),

        SizedBox(height: isMobile ? 24 : 32),

        // Description
        _buildDescription(isMobile),

        SizedBox(height: isMobile ? 32 : 48),

        // Modern Action Buttons
        _buildActionButtons(isMobile),

        SizedBox(height: isMobile ? 40 : 56),

        // Minimalist Stats
        _buildMinimalStats(isMobile),
      ],
    );
  }

  Widget _buildFuturisticBadge(bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1B17FF).withOpacity(0.1),
            const Color(0xFF255ff1).withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: const Color(0xFF1B17FF).withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1B17FF).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF114fed), Color(0xFF255ff1)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1B17FF).withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'OPEN OPPORTUNITIES',
            style: GoogleFonts.inter(
              color: const Color(0xFF114fed),
              fontWeight: FontWeight.w700,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainHeading(bool isMobile) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Color(0xFF1F2937),
          Color(0xFF4B5563),
        ],
      ).createShader(bounds),
      child: Text(
        'TALENTIA',
        style: GoogleFonts.spaceGrotesk(
          fontSize: isMobile ? 48 : 76,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          height: 0.95,
          letterSpacing: -2,
        ),
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
      ),
    );
  }

  Widget _buildGradientSubtitle(bool isMobile) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF114fed),
          Color(0xFF255ff1),

        ],
      ).createShader(bounds),
      child: Text(
        '"Connecting talent with opportunities"',
        style: GoogleFonts.inter(
          fontSize: isMobile ? 18 : 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1.4,
          letterSpacing: -0.5,
        ),
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
      ),
    );
  }

  Widget _buildDescription(bool isMobile) {
    return Text(
      'We are a dedicated recruitment agency focused on connecting exceptional talent with the right opportunities both locally and across the globe. Whether you’re an employer looking to hire top professionals or a candidate seeking your next career move, we bridge the gap with trusted, efficient, and tailored recruitment solutions.',
      style: GoogleFonts.inter(
        fontSize: isMobile ? 16 : 18,
        height: 1.8,
         color: const Color(0xFF343436),
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),
      textAlign: isMobile ? TextAlign.center : TextAlign.left,
    );
  }

  Widget _buildActionButtons(bool isMobile) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
      children: [
        _buildModernPrimaryButton('Explore Jobs', onExploreJobs, isMobile),
        _buildModernSecondaryButton('Contact Us', _openWhatsApp, isMobile),
      ],
    );
  }

  Widget _buildModernPrimaryButton(
      String text, VoidCallback onPressed, bool isMobile) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF114fed),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 32 : 40,
              vertical: isMobile ? 18 : 22,
            ),
            elevation: 0,
            shadowColor: const Color(0xFF1B17FF).withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 15 : 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.arrow_forward, size: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernSecondaryButton(
      String text, VoidCallback onPressed, bool isMobile) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              const Color(0xFF1B17FF).withOpacity(0.05),
              const Color(0xFF255ff1).withOpacity(0.05),
            ],
          ),
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF114fed),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 32 : 40,
              vertical: isMobile ? 18 : 22,
            ),
            side: BorderSide(
              width: 1.5,
              color: const Color(0xFF1B17FF).withOpacity(0.3),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.chat_bubble_outline,
                size: isMobile ? 18 : 20,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: isMobile ? 15 : 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMinimalStats(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Wrap(
        spacing: isMobile ? 32 : 56,
        runSpacing: 24,
        alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
        children: [
          _buildStatItem('50+', 'Active Jobs', isMobile),
          _buildStatItem('200+', 'Placements', isMobile),
          _buildStatItem('95%', 'Success Rate', isMobile),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, bool isMobile) {
    return Column(
      crossAxisAlignment:
      isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF114fed), Color(0xFF255ff1)],
          ).createShader(bounds),
          child: Text(
            value,
            style: GoogleFonts.spaceGrotesk(
              fontSize: isMobile ? 36 : 42,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            color: const Color(0xFF9CA3AF),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection(BuildContext context, bool isMobile) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: isMobile ? 320 : 480,
        maxHeight: isMobile ? 320 : 480,
      ),
      child: Stack(
        children: [
          // Animated background glow
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: const RadialGradient(
                  colors: [
                    Color(0xFF114fed),
                    Color(0xFF114fed),
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.5, 0.9],
                ),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),

          // Main gradient container
          Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF1B17FF).withOpacity(0.08),
                    const Color(0xFF255ff1).withOpacity(0.08),
                  ],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  'assets/images/careerPortalLogoImafe.jpeg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFF114fed), Color(0xFF255ff1)],
                          ).createShader(bounds),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.rocket_launch_outlined,
                                size: isMobile ? 100 : 140,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'TALENTIA',
                                style: GoogleFonts.spaceGrotesk(
                                  color: Colors.white,
                                  fontSize: isMobile ? 28 : 36,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}