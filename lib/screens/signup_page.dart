import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_page.dart';

// 전역 변수로 사용자 정보 저장
class UserData {
  static String name = '';
  static String phone = '';
  static String birthDate = '';
  static String email = '';
  static String businessName = '';
  static String businessNumber = '';
  static String businessType = '';
  static String address = '';
  static String businessPhone = '';
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  // 각 필드의 에러 상태를 추적
  bool _nameError = false;
  bool _phoneError = false;
  bool _businessPhoneError = false;
  bool _businessNameError = false;
  bool _businessNumberError = false; // 사업자등록번호 에러 상태
  bool _businessTypeError = false;
  bool _addressError = false;
  bool _showErrors = false; // 에러 표시 여부
  bool _termsError = false; // 이용약관 에러 상태

  // 각 필드의 컨트롤러
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _businessPhoneController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessNumberController = TextEditingController(); // 사업자등록번호 컨트롤러
  final TextEditingController _businessTypeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool _agreedToTerms = false;
  
  @override
  void initState() {
    super.initState();
    
    // 각 컨트롤러에 리스너 추가하여 실시간으로 에러 상태 업데이트
    _nameController.addListener(() {
      if (_showErrors && _nameController.text.isNotEmpty && _nameError) {
        setState(() {
          _nameError = false;
        });
      }
    });
    
    _phoneController.addListener(() {
      if (_showErrors && _phoneController.text.isNotEmpty && _phoneError) {
        setState(() {
          _phoneError = false;
        });
      }
    });
    
    _businessNameController.addListener(() {
      if (_showErrors && _businessNameController.text.isNotEmpty && _businessNameError) {
        setState(() {
          _businessNameError = false;
        });
      }
    });
    
    _businessNumberController.addListener(() {
      if (_showErrors && _businessNumberController.text.isNotEmpty && _businessNumberError) {
        setState(() {
          _businessNumberError = false;
        });
      }
    });
    
    _businessPhoneController.addListener(() {
      if (_showErrors && _businessPhoneController.text.isNotEmpty && _businessPhoneError) {
        setState(() {
          _businessPhoneError = false;
        });
      }
    });
    
    _businessTypeController.addListener(() {
      if (_showErrors && _businessTypeController.text.isNotEmpty && _businessTypeError) {
        setState(() {
          _businessTypeError = false;
        });
      }
    });
    
    _addressController.addListener(() {
      if (_showErrors && _addressController.text.isNotEmpty && _addressError) {
        setState(() {
          _addressError = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _businessPhoneController.dispose();
    _businessNameController.dispose();
    _businessNumberController.dispose();
    _businessTypeController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  // 에러 상태 업데이트
  void _updateErrorStates() {
    setState(() {
      _nameError = _nameController.text.isEmpty;
      _phoneError = _phoneController.text.isEmpty;
      _businessPhoneError = _businessPhoneController.text.isEmpty;
      _businessNameError = _businessNameController.text.isEmpty;
      _businessTypeError = _businessTypeController.text.isEmpty;
      _addressError = _addressController.text.isEmpty;
      _showErrors = true;
    });
  }

  // 에러 상태 초기화
  void _clearErrorStates() {
    setState(() {
      _nameError = false;
      _phoneError = false;
      _businessPhoneError = false;
      _businessNameError = false;
      _businessTypeError = false;
      _addressError = false;
      _showErrors = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상단 상태바 영역
                Container(
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
                ),
                const SizedBox(height: 20),
                
                // MyBiz 로고 및 설명
                Center(
                  child: Column(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFF00AEFF), Color(0xFF0084FF)],
                        ).createShader(bounds),
                        child: Text(
                          'MyBiz',
                          style: GoogleFonts.roboto(
                            fontSize: 52,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'MyBiz 서비스 이용을 위한 정보를 입력해주세요',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFB1B0B5),
                          letterSpacing: -0.9,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                
                // 입력 필드들 (순서 변경: 이름-개인 전화번호-상호명-사업자등록번호-가게전화번호-업종-주소)
                _buildInputField(
                  label: '이름',
                  controller: _nameController,
                  hint: '이름을 입력해주세요',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이름을 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                _buildInputField(
                  label: '개인 전화번호',
                  controller: _phoneController,
                  hint: '01012345678',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '전화번호를 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                _buildInputField(
                  label: '상호명',
                  controller: _businessNameController,
                  hint: '상호명을 입력해주세요',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '상호명을 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                _buildInputField(
                  label: '사업자등록번호',
                  controller: _businessNumberController,
                  hint: '1234567890',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '사업자등록번호를 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                _buildInputField(
                  label: '가게 전화번호',
                  controller: _businessPhoneController,
                  hint: '가게 전화번호를 입력해주세요',
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '가게 전화번호를 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                _buildInputField(
                  label: '업종',
                  controller: _businessTypeController,
                  hint: ' ',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '업종을 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                
                _buildInputField(
                  label: '주소',
                  controller: _addressController,
                  hint: ' ',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '주소를 입력해주세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                
                // 이용약관 동의
                _buildTermsAgreement(),
                const SizedBox(height: 15),
                
                // MyBiz 시작하기 버튼
                _buildStartButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
  }) {
    // 각 필드의 에러 상태 확인
    bool hasError = false;
    if (label == '이름') hasError = _showErrors && _nameError;
    else if (label == '개인 전화번호') hasError = _showErrors && _phoneError;
    else if (label == '상호명') hasError = _showErrors && _businessNameError;
    else if (label == '사업자등록번호') hasError = _showErrors && _businessNumberError;
    else if (label == '가게 전화번호') hasError = _showErrors && _businessPhoneError;
    else if (label == '업종') hasError = _showErrors && _businessTypeError;
    else if (label == '주소') hasError = _showErrors && _addressError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: hasError ? Colors.red : const Color(0xFF999999),
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: hasError ? Colors.red : const Color(0xFFE5E5E5),
              width: hasError ? 2 : 1,
            ),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            // validator 제거하여 경고 문구가 나오지 않도록 함
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              hintText: hint,
              hintStyle: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFB1B0B5), // 힌트 색상은 항상 회색으로 유지
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsAgreement() {
    return Row(
      children: [
        Checkbox(
          value: _agreedToTerms,
          onChanged: (value) {
            setState(() {
              _agreedToTerms = value ?? false;
              // 체크하면 에러 상태 해제
              if (_agreedToTerms) {
                _termsError = false;
              }
            });
          },
          activeColor: const Color(0xFF00AEFF),
          side: _showErrors && _termsError 
            ? const BorderSide(color: Colors.red, width: 2)
            : const BorderSide(color: Color(0xFF00AEFF), width: 1),
        ),
        Expanded(
          child: Text(
            '이용약관 및 개인정보처리방침에 동의합니다.',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: _showErrors && _termsError ? Colors.red : const Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStartButton() {
    return GestureDetector(
      onTap: () {
        // 각 필드의 에러 상태 확인 및 설정
        setState(() {
          _showErrors = true;
          _nameError = _nameController.text.isEmpty;
          _phoneError = _phoneController.text.isEmpty;
          _businessNameError = _businessNameController.text.isEmpty;
          _businessNumberError = _businessNumberController.text.isEmpty;
          _businessPhoneError = _businessPhoneController.text.isEmpty;
          _businessTypeError = _businessTypeController.text.isEmpty;
          _addressError = _addressController.text.isEmpty;
          _termsError = !_agreedToTerms;
        });

        // 에러가 있는 경우 적절한 메시지 표시
        if (_nameError || _phoneError || _businessNameError || _businessNumberError ||
            _businessPhoneError || _businessTypeError || _addressError || _termsError) {
          
          String errorMessage = '';
          // 입력되지 않은 정보가 있으면 "입력되지 않은 정보가 있습니다" 우선 표시
          if (_nameError || _phoneError || _businessNameError || 
              _businessPhoneError || _businessTypeError || _addressError) {
            errorMessage = '입력되지 않은 정보가 있습니다.';
          } else if (!_agreedToTerms) {
            // 모든 정보가 입력되었는데 약관만 체크되지 않은 경우
            errorMessage = '이용약관에 동의해주세요.';
          }
          
          // 에러 메시지 표시 (간단한 SnackBar 사용)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
          return;
        }

        // 모든 필드가 입력되었고 약관에 동의한 경우에만 메인 페이지로 이동
        // 사용자 데이터 저장
        UserData.name = _nameController.text;
        UserData.phone = _phoneController.text;
        UserData.businessName = _businessNameController.text;
        UserData.businessNumber = _businessNumberController.text;
        UserData.businessType = _businessTypeController.text;
        UserData.address = _addressController.text;
        UserData.businessPhone = _businessPhoneController.text;
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      },
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF00AEFF), Color(0xFF0088CC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Text(
            'MyBiz 시작하기',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
} 