/*
############################################################
					wstring for HSP3
					(c) 2019 inonote
############################################################
�����̃��W���[���ɂ���
	�@HSP��UTF-16���������Ƃ��ł���悤�ɂȂ郂�W���[���ł��B
	C++�̕W�����C�u������ std::wstring �ɋ߂��Ȃ�悤�ɊJ��
	�������߁A���܂�g������͕ς��܂���B

������
	�Estd::wstring �ɋ߂��֐��A���߁B
	�E�k���������܂ޕ�������������Ƃ��\�B
	�E�����񑀍얽�߂�ANSI������ɂ��Ή��B(������UTF-16LE��
	�@�ϊ�����܂��B)

��_STRING_EXCEPTION�}�N���ɂ���
	�@_STRING_EXCEPTION�̒�`��ǉ����邱�ƂŁA�������̊m��
	�Ɏ��s�����Ƃ���A�������͈͊O�ɃA�N�Z�X���悤�Ƃ����Ƃ�
	��HSP�̃V�X�e���G���[�𔭐�������@�\���L���ɂȂ�܂��B
	
���֐��E���߈ꗗ
new_wstring var m, str s
	wstring ���쐬����B
	var	m	�i�[��
	str	s	����������(�ȗ����A�󕶎���)
	
wsbegin() 		������擪�̃|�C���^��Ԃ��
wsend()			�����񖖔��̎��̃|�C���^��Ԃ��B
wsfront()		-> wsbegin()
wsback()		�����񖖔��̃|�C���^��Ԃ��B
wssize()		������̒�����Ԃ��B
wslength()		-> wssize()
wsmaxsize()		�m�ۉ\�ȕ�����̒�����Ԃ��B
wscapacity()	�m�ۂ���Ă��郁�����̑傫����Ԃ��B
wsdata()		-> wsbegin()
wsc_str()		0�I�[�̕�����̃|�C���^��Ԃ��B
				(�����񑀍얽�߂��g�p����ƃ|�C���^�͖����ɂȂ�܂�)
wsempty()		�����񂪋󂩃`�F�b�N����B
				
wsresize int n, [int c]
	������̒�����ݒ肷��B
	int	n	������̒���
	int	c	�]�����̈�𖄂߂镶��(�ȗ���0)
	
wsreserve int res_arg
	���������w��ʊm�ۂ���B
	int	res_arg	�m�ۂ��镪
	
wsshrink_to_fit
	�������T�C�Y�𕶎���̒����܂Ő؂�l�߂�B
	
wsclear
	��������N���A����B
	(������̒�����0�ɂȂ邾���ł�)

wsinsert [int po2], *** __p, [int po], [int n]
	�������}������B
	int	po2	�}������ʒu(�ȗ����A������̖���)
	***	__p	- �}�����镶����ւ̃|�C���^ (wsinsert)
			- �}�����镶���񂪊i�[���ꂽ�ϐ� (wsinserv)
			- �}������ wstring (wsinserm)
			- �}������ANSI�����񂪊i�[���ꂽ�ϐ� (wsinserA)
	int	po	�}�����镶����̊J�n�ʒu(�ȗ���0)
	int	n	�}�����镶����̕�����(�ȗ���-1)

wsappend *** __p, [int po], [int n]
	�����ɕ������}������B
	***	__p	- �}�����镶����ւ̃|�C���^ (wsappend)
			- �}�����镶���񂪊i�[���ꂽ�ϐ� (wsappendv)
			- �}������ wstring (wsappendm)
			- �}������ANSI�����񂪊i�[���ꂽ�ϐ� (wsappendA)
	int	po	�}�����镶����̊J�n�ʒu(�ȗ���0)
	int	n	�}�����镶����̕�����(�ȗ���-1)

wserase int po, int n
	��������폜����B
	int	po	�폜���镶����̈ʒu(�ȗ���0)
	int	n	�폜���镶����̕�����(�ȗ���-1)
	
wsreplace int po1, int n1, *** __p, int po2, int n2
	������̈ꕔ��u��������B
	int	po1	�u��������ʒu
	int	n1	�u�������镶����
	***	__p	- �u�������镶����ւ̃|�C���^ (wsreplace)
			- �u�������镶���񂪊i�[���ꂽ�ϐ� (wsreplacev)
			- �u�������镶���񂪊i�[���ꂽ wstring (wsreplacem)
			- �u��������ANSI�����񂪊i�[���ꂽ�ϐ� (wsreplaceA)
	int	po2	�u�������镶����̈ʒu(�ȗ���0)
	int	n2	�u�������镶����̕�����(�ȗ���-1)

wsswap var m
	wstring ����������B
	var	m	�������� wstring

wscompare(*** __p)
	��������r����B
	***	__p	- ��r���镶����ւ̃|�C���^ (wscompare)
			- ��r���镶���񂪊i�[���ꂽ�ϐ� (wscomparev)
			- ��r���� wstring (wscomparem)
			- ��r����ANSI�����񂪊i�[���ꂽ�ϐ� (wscompareA)

	�ԋp�l	this >  __p	��
			this == __p	0
			this <  __p	��

wscopy *** __p
	��������R�s�[����B
	***	__p	- �R�s�[���wchar_t�^�ϐ��ւ̃|�C���^ (wscopy)
			- �R�s�[���wchar_t�^�ϐ� (wscopyv)

	���̖��߂��Ăяo���O�ɓK�؂ȑ傫���̃��������m�ۂ���K�v������܂��B

wsfind(*** __p, int po)
	���������������B
	***	__p	- �������镶����ւ̃|�C���^ (wsfind)
			- �������镶���񂪊i�[���ꂽ�ϐ� (wsfindv)
			- �������� wstring (wsfindm)
			- ��������ANSI�����񂪊i�[���ꂽ�ϐ� (wsfindA)
	int	po	�����J�n�ʒu(�ȗ���0)

	�ԋp�l	���������ꍇ�͕�����̈ʒu�A����ȊO��-1

wsrfind(*** __p, int po)
	������𖖔�����t�Ɍ�������B
	***	__p	- �������镶����ւ̃|�C���^ (wsrfind)
			- �������镶���񂪊i�[���ꂽ�ϐ� (wsrfindv)
			- �������� wstring (wsrfindm)
			- ��������ANSI�����񂪊i�[���ꂽ�ϐ� (wsrfindA)
	int	po	�����J�n�ʒu(�ȗ���-1)

	�ԋp�l	���������ꍇ�͕�����̈ʒu�A����ȊO��-1

wsfind_first_of(*** __p, int po)
	�������镶����̓��ǂꂩ1�������}�b�`����ꏊ��T���B
	***	__p	- �������镶����ւ̃|�C���^ (wsfind_first_of)
			- �������镶���񂪊i�[���ꂽ�ϐ� (wsfind_first_ofv)
			- �������� wstring (wsfind_first_ofm)
			- ��������ANSI�����񂪊i�[���ꂽ�ϐ� (wsfind_first_ofA)
	int	po	�����J�n�ʒu(�ȗ���0)

	�ԋp�l	���������ꍇ�͕�����̈ʒu�A����ȊO��-1
	
wsfind_first_not_of(*** __p, int po)
	�������镶����̓��������1�������}�b�`���Ȃ��ꏊ��T���B
	***	__p	- �������镶����ւ̃|�C���^ (wsfind_first_not_of)
			- �������镶���񂪊i�[���ꂽ�ϐ� (wsfind_first_not_ofv)
			- �������� wstring (wsfind_first_not_ofm)
			- ��������ANSI�����񂪊i�[���ꂽ�ϐ� (wsfind_first_not_ofA)
	int	po	�����J�n�ʒu(�ȗ���0)

	�ԋp�l	���������ꍇ�͕�����̈ʒu�A����ȊO��-1
	
wsfind_last_of(*** __p, int po)
	�������镶����̓��ǂꂩ1�������}�b�`����ꏊ�𖖔�����t�ɒT���B
	***	__p	- �������镶����ւ̃|�C���^ (wsfind_last_of)
			- �������镶���񂪊i�[���ꂽ�ϐ� (wsfind_last_ofv)
			- �������� wstring (wsfind_last_ofm)
			- ��������ANSI�����񂪊i�[���ꂽ�ϐ� (wsfind_last_ofA)
	int	po	�����J�n�ʒu(�ȗ���-1)

	�ԋp�l	���������ꍇ�͕�����̈ʒu�A����ȊO��-1
	
wsfind_last_not_of(*** __p, int po)
	�������镶����̓��������1�������}�b�`���Ȃ��ꏊ�𖖔�����t�ɒT���B
	***	__p	- �������镶����ւ̃|�C���^ (wsfind_last_not_of)
			- �������镶���񂪊i�[���ꂽ�ϐ� (wsfind_last_not_ofv)
			- �������� wstring (wsfind_last_not_ofm)
			- ��������ANSI�����񂪊i�[���ꂽ�ϐ� (wsfind_last_not_ofA)
	int	po	�����J�n�ʒu(�ȗ���-1)

	�ԋp�l	���������ꍇ�͕�����̈ʒu�A����ȊO��-1

wssubstr var m, int po, int n
	����������o���B
	var	m	���o������������i�[���� wstring
	int	po	���o���ʒu(�ȗ���0)
	int	n	���o��������(�ȗ���-1)
*/

	
#ifndef _WSTRING_AS_
#define global _WSTRING_AS_
#module wstring m_pData,m_uSize,m_uCap,m_pCStrData
	#define _STRING_SIZE					2
	#define _STRING_MASK					0x0000FFFF
	#define _STRING_MAXSIZE					0x7FFFFFFF
	#define _STRING_EXCEPTION
	#define ctype _STRING_SUCCESS(%1)		((%1&1)^1)
	#define ctype _STRING_RETDATA(%1)		((%1>>1)&0x7FFFFFFF)
	#define ctype _STRING_MAKERET(%1,%2)	(%1|(%1<<1))
	#define _STRING_OK						0
	#define _STRING_FAILED					1

	#defcfunc local _STRING_MIN int a, int b
		if ((a&0x7FFFFFFF) > (b&0x7FFFFFFF)){
			if (b&0x800000000):return a: else: return b
		}else{
			if (a&0x800000000):return b: else: return a
		}
	
	#uselib "msvcrt.dll"
	#cfunc _wscmalloc "malloc" int
	#cfunc _wscrealloc "realloc" int,int
	#func _wscfree "free" int
	#func _wscmemset "memset" int,int,int
	#func _wscmemcpy "memcpy" int,int,int
	#func _wscmemmove "memmove" int,int,int
	#cfunc _wscmemcmp "memcmp" int,int,int
	#cfunc _wscwcslen "wcslen" int
	#uselib "kernel32.dll"
	#func _wscMultiByteToWideChar "MultiByteToWideChar" int,int,sptr,int,sptr,int
	
	#modinit
		m_pData = 0
		m_uSize = 0
		m_uCap = 0
		m_pCStrData = 0
		return
	#modterm
		if (m_pData){
			_wscfree m_pData
			m_pData = 0
		}
		_wsfree_cstrmem thismod
		return
	#modfunc local _sgetdata array d /*[private]*/
		dim d, 4
		d = m_pData, m_uSize, m_uCap, m_pCStrData
		return
	#modfunc local _ssetdata array d /*[private]*/
		m_pData = d(0)
		m_uSize = d(1)
		m_uCap = d(2)
		m_pCStrData = d(3)
		return
	#deffunc local _wsatou str _s, var d, local len /*[private]*/
		_wscMultiByteToWideChar 0, 0, _s, -1, 0, 0
		len = stat
		sdim d, len * 2
		_wscMultiByteToWideChar 0, 0, _s, -1, varptr(d), len
		return len
	#modfunc local _salloc int n, int stf, local p, local _n /*[private]*/
		if (_STRING_MAXSIZE<n*_STRING_SIZE){
			return _STRING_FAILED
		}
		_n = n
		if (_n == 0): _n = 1
		if (m_pData==0){
			m_pData = _wscmalloc(_n*_STRING_SIZE)
			if (m_pData==0){
#ifdef _STRING_EXCEPTION
				dupptr unused,0,4:unused=0
#endif // _STRING_EXCEPTION
				return _STRING_FAILED
			}
			m_uCap = _n
		}else:if ((_n>m_uCap) || (_n<m_uSize && (stf==1)) || (stf==2)){
			p = _wscrealloc(m_pData, _n*_STRING_SIZE)
			if (p){
				m_pData = p
				m_uCap = _n
			}else{
#ifdef _STRING_EXCEPTION
				dupptr unused,0,4:unused=0
#endif // _STRING_EXCEPTION
				return _STRING_FAILED
			}
		}
		return _STRING_OK
	#define wsfront wsbegin
	#modcfunc wsbegin
		return m_pData
	#modcfunc wsback
		return m_pData+m_uSize*_STRING_SIZE-_STRING_SIZE
	#modcfunc wsend
		return m_pData+m_uSize*_STRING_SIZE
	#modcfunc wsat int po, local _c
		dupptr _c, m_pData + po * _STRING_SIZE, 4, 4
		return _c&_STRING_MASK
	#modcfunc wssize
		return m_uSize
	#modcfunc wslength
		return m_uSize
	#modcfunc wsmaxsize
		return _STRING_MAXSIZE
	#define global wsresize(%1,%2,%3=0) _wsresize %1,%2,%3
	#modfunc _wsresize int n, int c, local p
		_salloc thismod, n, 0
		if (_STRING_SUCCESS(stat)){
			if (m_uSize<n){
				repeat n - m_uSize
					dupptr p, m_pData + (m_uSize  + cnt) * _STRING_SIZE, 4, 4
					wpoke p, 0, c
				loop
				if (c): m_uSize = n
			}else: m_uSize = n
			_wsfree_cstrmem thismod
			return _STRING_OK
		}
		return _STRING_FAILED
	#modcfunc wscapacity
		return m_uCap
	#modfunc wsreserve int res_arg
		_salloc thismod, res_arg, 0
		return
	#modfunc wsshrink_to_fit
		_salloc thismod, m_uSize, 2
		return
	#modfunc wsclear
		m_uSize = 0
		_wsfree_cstrmem thismod
		return
	#define global ctype wsempty(%1) (wssize(%1)==0)
	#define global wsinsert(%1,%2=-1,%3,%4=0,%5=-1) _wsinsert %1,%2,%3,%4,%5,0
	#define global wsinsertv(%1,%2=-1,%3,%4=0,%5=-1) _wsinsert %1,%2,varptr(%3),%4,%5,0
	#define global wsinsertm(%1,%2=-1,%3,%4=0,%5=-1) _wsinsert %1,%2,varptr(%3),%4,%5,varsize(%3)
	#define global wsappend(%1,%2,%3=0,%4=-1) _wsinsert %1,-1,%2,%3,%4,0
	#define global wsappendv(%1,%2,%3=0,%4=-1) _wsinsert %1,-1,varptr(%2),%3,%4,0
	#define global wsappendm(%1,%2,%3=0,%4=-1) _wsinsert %1,-1,varptr(%2),%3,%4,varsize(%2)
	#modfunc _wsinsert int po2, int __p, int po, int n, int o, local _p, local _po2, local len, local _m
		if (__p==0 || po<0 || n<-1): return
		_p=__p
		_po2 = po2
		if (_po2==-1): _po2 = m_uSize
		_po2 = limit(_po2, 0, m_uSize)
		if (o){
			dupptr _m, __p, o, 5
			len = wssize(_m) - po
			_p = wsdata(_m)
		}else: len = _wscwcslen(_p) - po
		if (n!=-1): len = n
		_salloc thismod, len + m_uSize, 0
		if (_STRING_SUCCESS(stat)){
			if (_po2 != m_uSize){
				_wscmemmove m_pData + (_po2 + len) * _STRING_SIZE, m_pData + _po2 * _STRING_SIZE, (m_uSize - _po2) * _STRING_SIZE
			}
			_wscmemcpy m_pData + _po2 * _STRING_SIZE, _p + po * _STRING_SIZE, len * _STRING_SIZE
		}
		m_uSize += len
		if (o){
			dim _m
		}
		
		_wsfree_cstrmem thismod
		return
	#define global wsinsertA(%1,%2=-1,%3,%4=0,%5=-1) _wsinsertA %1,%2,%3,%4,%5
	#define global wsappendA(%1,%2,%3=0,%4=-1) _wsinsertA %1,-1,%2,%3,%4
	#modfunc _wsinsertA int po2, str _s, int po, int n, local wbuf, local len
		_wsatou _s, wbuf
		_wsinsert thismod, po2, varptr(wbuf), po, n, 0
		sdim wbuf, 0
		return
	#define global wserase(%1,%2=0,%3=-1) _wserase %1,%2,%3
	#modfunc _wserase int po, int n, local len
		if (po > m_uSize || po < 0 || n > m_uSize || n < -1){
#ifdef _STRING_EXCEPTION
			dupptr unused,0,4:unused=0
#endif // _STRING_EXCEPTION
			return _STRING_FAILED
		}
		if (po == 0 && n == -1){
			m_uSize = 0
		}else{
			len = _STRING_MIN(n, m_uSize - po)
			m_uSize -= len
			_wscmemmove m_pData + po * _STRING_SIZE, m_pData + (po + len) * _STRING_SIZE, (m_uSize - po) * _STRING_SIZE
		}
		_wsfree_cstrmem thismod
		return _STRING_OK
	#define global wsreplace(%1,%2,%3,%4,%5=0,%6=-1) _wsreplace %1,%2,%3,%4,%5,%6,0
	#define global wsreplacev(%1,%2,%3,%4,%5=0,%6=-1) _wsreplace %1,%2,%3,varptr(%4),%5,%6,0
	#define global wsreplacem(%1,%2,%3,%4,%5=0,%6=-1) _wsreplace %1,%2,%3,varptr(%4),%5,%6,varsize(%4)
	#modfunc _wsreplace int po1, int n1, int __p, int po2, int n2, int o
		_wserase thismod, po1, n1
		_wsinsert thismod, po1, __p, po2, n2, o
		return
	#define global wsreplaceA(%1,%2,%3,%4,%5=0,%6=-1) _wsreplaceA %1,%2,%3,%4,%5,%6
	#modfunc _wsreplaceA int po1, int n1, str _s, int po2, int n2
		_wserase thismod, po1, n1
		_wsinsertA thismod, po1, _s, po2, n2
		return
	#modfunc wsswap var m, local modd1, local modd2
		_sgetdata thismod, modd1
		_sgetdata m, modd2
		_ssetdata thismod, modd2
		_ssetdata m, modd1
		return
	#modcfunc wsdata
		return m_pData
	#modcfunc wsc_str
		if (m_pCStrData): return m_pCStrData
		m_pCStrData = _wscmalloc(m_uSize*_STRING_SIZE+_STRING_SIZE)
		if (m_pCStrData==0): return
		_wscmemset m_pCStrData + m_uSize*_STRING_SIZE, 0, _STRING_SIZE
		if (m_uSize): _wscmemcpy m_pCStrData, m_pData, m_uSize*_STRING_SIZE
		return m_pCStrData
	#modfunc local _wsfree_cstrmem /*[private]*/
		if (m_pCStrData){
			_wscfree m_pCStrData
			m_pCStrData = 0
		}
		return
	#define global ctype wscompare(%1,%2) _wscompare(%1,%2,0)
	#define global ctype wscomparev(%1,%2) _wscompare(%1,varptr(%2),0)
	#define global ctype wscomparem(%1,%2) _wscompare(%1,varptr(%2),varsize(%2))
	#modcfunc _wscompare int __p, int o, local _p, local len, local _m, local ans
		if (o){
			dupptr _m, __p, o, 5
			_p = wsdata(_m)
			len = wssize(_m)
		}else{
			_p = __p
			len = _wscwcslen(__p)
		}
		ans = _wscmemcmp(m_pData, _p, _STRING_MIN(m_uSize, len) * _STRING_SIZE)
		if (ans != 0): return ans
		if (m_uSize < len): return -1
		if (m_uSize > len): return 1
		return 0
	#modcfunc wscompareA str _s, local wbuf, local len, local ans
		_wsatou _s, wbuf
		ans = _wscompare(thismod, varptr(wBuf), 0)
		sdim wbuf, 0
		return ans
	#define global wscopy(%1,%2,%3,%4=0) _wscopy %1,%2,%3,%4
	#define global wscopyv(%1,%2,%3,%4=0) _wscopy %1,varptr(%2),%3,%4
	#modfunc _wscopy int __p, int n, int po
		if (po > m_uSize || po < 0){
#ifdef _STRING_EXCEPTION
			dupptr unused,0,4:unused=0
#endif // _STRING_EXCEPTION
			return _STRING_FAILED
		}
		_wscmemcpy __p, m_pData + po * _STRING_SIZE, _STRING_MIN(n, m_uSize - po) * _STRING_SIZE
		return  _STRING_OK
	#define global ctype wsfind(%1,%2,%3=0) _wsfind(%1,%2,%3,0)
	#define global ctype wsfindv(%1,%2,%3=0) _wsfind(%1,varptr(%2),%3,0)
	#define global ctype wsfindm(%1,%2,%3=0) _wsfind(%1,varptr(%2),%3,varsize(%2))
	#modcfunc _wsfind int __p, int po, int o, local _m, local _p, local len, local ret
		ret = -1
		if (o){
			dupptr _m, __p, o, 5
			_p = wsdata(_m)
			len = wssize(_m)
		}else{
			_p = __p
			len = _wscwcslen(__p)
		}
		if (m_uSize - len < 0): return ret
		repeat m_uSize - len + 1, po
			if (_wscmemcmp(m_pData + cnt * _STRING_SIZE, _p, len * _STRING_SIZE) == 0){
				ret = cnt
				break
			}
		loop
		return ret
	#define global ctype wsfindA(%1,%2,%3=0) _wsfindA(%1,%2,%3)
	#modcfunc _wsfindA str _s, int po, local wbuf, local ret
		_wsatou _s, wbuf
		ret = _wsfind(thismod, varptr(wbuf), po, 0)
		sdim wbuf, 0
		return ret
	#define global ctype wsrfind(%1,%2,%3=-1) _wsrfind(%1,%2,%3,0)
	#define global ctype wsrfindv(%1,%2,%3=-1) _wsrfind(%1,varptr(%2),%3,0)
	#define global ctype wsrfindm(%1,%2,%3=-1) _wsrfind(%1,varptr(%2),%3,varsize(%2))
	#modcfunc _wsrfind int __p, int po, int o, local _po, local _m, local _p, local len, local ret
		ret = -1
		if (o){
			dupptr _m, __p, o, 5
			_p = wsdata(_m)
			len = wssize(_m)
		}else{
			_p = __p
			len = _wscwcslen(__p)
		}
		if (m_uSize - len < 0): return ret
		_po = po
		if (_po == -1): _po = m_uSize - 1
		repeat m_uSize - len + 1,m_uSize - _po - 1
			if (_wscmemcmp(m_pData + (m_uSize - cnt - 1) * _STRING_SIZE, _p, len * _STRING_SIZE) == 0){
				ret = m_uSize - cnt - 1
				break
			}
		loop
		return ret
	#define global ctype wsrfindA(%1,%2,%3=-1) _wsrfindA(%1,%2,%3)
	#modcfunc _wsrfindA str _s, int po, local wbuf, local ret
		_wsatou _s, wbuf
		ret = _wsrfind(thismod, varptr(wbuf), po, 0)
		sdim wbuf, 0
		return ret
	#define global ctype wsfind_first_of(%1,%2,%3=0) _wsfind_first_of(%1,%2,%3,0,0)
	#define global ctype wsfind_first_ofv(%1,%2,%3=0) _wsfind_first_of(%1,varptr(%2),%3,0,0)
	#define global ctype wsfind_first_ofm(%1,%2,%3=0) _wsfind_first_of(%1,varptr(%2),%3,varsize(%2),0)
	#define global ctype wsfind_first_not_of(%1,%2,%3=0) _wsfind_first_of(%1,%2,%3,0,1)
	#define global ctype wsfind_first_not_ofv(%1,%2,%3=0) _wsfind_first_of(%1,varptr(%2),%3,0,1)
	#define global ctype wsfind_first_not_ofm(%1,%2,%3=0) _wsfind_first_of(%1,varptr(%2),%3,varsize(%2),1)
	#modcfunc _wsfind_first_of int __p, int po, int o, int op, local _m, local _c1, local _c2, local _p, local len, local ret, local _f
		ret = -1
		if (o){
			dupptr _m, __p, o, 5
			_p = wsdata(_m)
			len = wssize(_m)
		}else{
			_p = __p
			len = _wscwcslen(__p)
		}
		repeat m_uSize, po
			dupptr _c1, m_pData + cnt * _STRING_SIZE, 4, 4
			_f = 1
			repeat len
				dupptr _c2, _p + cnt * _STRING_SIZE, 4, 4
				if ((_c1&_STRING_MASK) == (_c2&_STRING_MASK)){
					if (op==0){
						ret = 0
						break
					}else: _f = 0
				}
			loop
			if (ret==0 || op & _f): ret = cnt: break
		loop
		return ret
	#define global ctype wsfind_first_ofA(%1,%2,%3=0) _wsfind_first_ofA(%1,%2,%3,0)
	#define global ctype wsfind_first_not_ofA(%1,%2,%3=0) _wsfind_first_ofA(%1,%2,%3,1)
	#modcfunc _wsfind_first_ofA str _s, int po, int op, local wbuf, local ret
		_wsatou _s, wbuf
		ret = _wsfind_first_of(thismod, varptr(wbuf), po, 0, op)
		sdim wbuf, 0
		return ret
	#define global ctype wsfind_last_of(%1,%2,%3=-1) _wsfind_last_of(%1,%2,%3,0,0)
	#define global ctype wsfind_last_ofv(%1,%2,%3=-1) _wsfind_last_of(%1,varptr(%2),%3,0,0)
	#define global ctype wsfind_last_ofm(%1,%2,%3=-1) _wsfind_last_of(%1,varptr(%2),%3,varsize(%2),0)
	#define global ctype wsfind_last_not_of(%1,%2,%3=-1) _wsfind_last_of(%1,%2,%3,0,1)
	#define global ctype wsfind_last_not_ofv(%1,%2,%3=-1) _wsfind_last_of(%1,varptr(%2),%3,0,1)
	#define global ctype wsfind_last_not_ofm(%1,%2,%3=-1) _wsfind_last_of(%1,varptr(%2),%3,varsize(%2),1)
	#modcfunc _wsfind_last_of int __p, int po, int o, int op, local _po, local _m, local _c1, local _c2, local _p, local len, local ret, local _f
		ret = -1
		if (o){
			dupptr _m, __p, o, 5
			_p = wsdata(_m)
			len = wssize(_m)
		}else{
			_p = __p
			len = _wscwcslen(__p)
		}
		_po = po
		if (_po == -1): _po = m_uSize - 1
		repeat m_uSize, m_uSize - _po - 1
			dupptr _c1, m_pData + (m_uSize - cnt - 1) * _STRING_SIZE, 4, 4
			_f = 1
			repeat len
				dupptr _c2, _p + cnt * _STRING_SIZE, 4, 4
				if ((_c1&_STRING_MASK) == (_c2&_STRING_MASK)){
					if (op==0){
						ret = 0
						break
					}else: _f = 0
				}
			loop
			if (ret==0 || op & _f): ret = m_uSize - cnt - 1: break
		loop
		return ret
	#define global ctype wsfind_last_ofA(%1,%2,%3=-1) _wsfind_last_ofA(%1,%2,%3,0)
	#define global ctype wsfind_last_not_ofA(%1,%2,%3=-1) _wsfind_last_ofA(%1,%2,%3,1)
	#modcfunc _wsfind_last_ofA str _s, int po, int op, local wbuf, local ret
		_wsatou _s, wbuf
		ret = _wsfind_last_of(thismod, varptr(wbuf), po, 0, op)
		sdim wbuf, 0
		return ret
	#define global wssubstr(%1,%2,%3=0,%4=-1) _wssubstr %1,%2,%3,%4
	#modfunc _wssubstr var m, int po, int n, local len
		if (po > m_uSize || po < 0){
#ifdef _STRING_EXCEPTION
			dupptr unused,0,4:unused=0
#endif // _STRING_EXCEPTION
			return _STRING_FAILED
		}
		if (varuse(m)==0 || vartype(m)!=5){
			_new_wstring m, ""
		}
		_salloc m, len
		_wscmemcpy wsdata(m), m_pData + po * _STRING_SIZE, _STRING_MIN(n, m_uSize - po) * _STRING_SIZE
		return _STRING_OK
	#define global del_wstring(%1) delmod %1
	#define global new_wstring(%1,%2="") _new_wstring %1,%2
	#deffunc _new_wstring var m, str s
		newmod m, wstring
		if (s!=""){
			wsappendA m, s
		}
		_salloc m, 2, 0
		return
#global
#endif // _WSTRING_AS_