import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/hero_section.dart';
import '../widgets/jobs_section.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/footer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _jobsSectionKey = GlobalKey();

  void _scrollToJobs() {
    final context = _jobsSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Custom App Bar
          const CustomAppBar(),

          // Hero Section (About Me)
          SliverToBoxAdapter(
            child: HeroSection(onExploreJobs: _scrollToJobs),
          ),

          // Jobs Section
          SliverToBoxAdapter(
            child: Container(
              key: _jobsSectionKey,
              child: const JobsSection(),
            ),
          ),

          // Footer
          const SliverToBoxAdapter(
            child: FooterWidget(),
          ),
        ],
      ),
    );
  }
}