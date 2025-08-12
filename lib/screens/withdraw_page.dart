import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mypage.dart';
import 'signup_page.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  String _selectedReason = '선택해주세요'; // 선택된 탈퇴 이유
  final List<String> _withdrawReasons = [
    '선택해주세요',
    '원하는 기능이 없거나 불편함',
    '개인정보 보호/보안 우려',
    '이용 중 불쾌한 경험이 있었음',
    '광고/알림이 너무 많음',
    '다른 서비스를 사용하기 위해서',
    '기타',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildStatusBar(),
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    _buildContent(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text(
            '9:41',
            style: TextStyle(
              fontSize: 18.9,
              fontWeight: FontWeight.w700,
              color: Color(0xFF444347),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset(
                'assets/images/1.png',
                width: 22,
                height: 14,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 4),
              Image.asset(
                'assets/images/2.png',
                width: 23,
                height: 16,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 4),
              Image.asset(
                'assets/images/3.png',
                width: 22,
                height: 10,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          const Center(
            child: Text(
              '회원탈퇴',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Color(0xFF333333),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 8,
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                  color: Color(0xFF333333),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 탈퇴 확인 메시지
        Text(
          '${UserData.name}님 정말 탈퇴하시겠어요?',
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF5F5F5F),
          ),
        ),
        const SizedBox(height: 20),
        
        // 탈퇴 이유 선택
        Text(
          '탈퇴하시려는 이유를 말씀해 주세요',
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w100,
            color: const Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 8),
        
        // 드롭다운
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF505050)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedReason,
              isExpanded: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              items: _withdrawReasons.map((String reason) {
                return DropdownMenuItem<String>(
                  value: reason,
                  child: Text(
                    reason,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: reason == '선택해주세요' 
                          ? const Color(0xFF8C8C8C) 
                          : const Color(0xFF8C8C8C),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedReason = newValue!;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
        
        // 버튼들
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // 탈퇴 처리 로직
                  if (_selectedReason != '선택해주세요') {
                    // 실제 탈퇴 처리 후 로그인 페이지로 이동
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  } else {
                    // 이유를 선택하지 않은 경우 알림
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('탈퇴 이유를 선택해주세요.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Container(
                  height: 43,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF98E0F8), Color(0xFF9CCEFF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '탈퇴하기',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 43,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFE5E5E5),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '취소',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF00C2FD),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 116,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 5),
              _buildNavItem('assets/images/menuHome.png', '홈', false),
              const SizedBox(width: 5),
              _buildNavItem('assets/images/menuAD.png', '광고 생성', false),
              const SizedBox(width: 5),
              _buildMicButton(),
              const SizedBox(width: 5),
              _buildNavItem('assets/images/menuAnalysis.png', '분석', false),
              const SizedBox(width: 5),
              _buildNavItem('assets/images/menuMypage.png', '마이페이지', true),
              const SizedBox(width: 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String imagePath, String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // 네비게이션 처리
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? const Color(0xFF20A6FE) : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMicButton() {
    return Container(
      width: 60,
      height: 60,
      child: Center(
        child: Image.asset(
          'assets/images/navMic.png',
          width: 60,
          height: 60,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
