/*
############################################################
					wstring for HSP3
					(c) 2019 inonote
############################################################
●このモジュールについて
	　HSPでUTF-16を扱うことができるようになるモジュールです。
	C++の標準ライブラリの std::wstring に近くなるように開発
	したため、あまり使い勝手は変わりません。

●特徴
	・std::wstring に近い関数、命令。
	・ヌル文字を含む文字列を扱うことが可能。
	・文字列操作命令はANSI文字列にも対応。(内部でUTF-16LEに
	　変換されます。)

●_STRING_EXCEPTIONマクロについて
	　_STRING_EXCEPTIONの定義を追加することで、メモリの確保
	に失敗したときや、メモリ範囲外にアクセスしようとしたとき
	にHSPのシステムエラーを発生させる機能が有効になります。
	
●関数・命令一覧
new_wstring var m, str s
	wstring を作成する。
	var	m	格納先
	str	s	初期文字列(省略時、空文字列)
	
wsbegin() 		文字列先頭のポインタを返す｡
wsend()			文字列末尾の次のポインタを返す。
wsfront()		-> wsbegin()
wsback()		文字列末尾のポインタを返す。
wssize()		文字列の長さを返す。
wslength()		-> wssize()
wsmaxsize()		確保可能な文字列の長さを返す。
wscapacity()	確保されているメモリの大きさを返す。
wsdata()		-> wsbegin()
wsc_str()		0終端の文字列のポインタを返す。
				(文字列操作命令を使用するとポインタは無効になります)
wsempty()		文字列が空かチェックする。
				
wsresize int n, [int c]
	文字列の長さを設定する。
	int	n	文字列の長さ
	int	c	余った領域を埋める文字(省略時0)
	
wsreserve int res_arg
	メモリを指定量確保する。
	int	res_arg	確保する分
	
wsshrink_to_fit
	メモリサイズを文字列の長さまで切り詰める。
	
wsclear
	文字列をクリアする。
	(文字列の長さが0になるだけです)

wsinsert [int po2], *** __p, [int po], [int n]
	文字列を挿入する。
	int	po2	挿入する位置(省略時、文字列の末尾)
	***	__p	- 挿入する文字列へのポインタ (wsinsert)
			- 挿入する文字列が格納された変数 (wsinserv)
			- 挿入する wstring (wsinserm)
			- 挿入するANSI文字列が格納された変数 (wsinserA)
	int	po	挿入する文字列の開始位置(省略時0)
	int	n	挿入する文字列の文字数(省略時-1)

wsappend *** __p, [int po], [int n]
	末尾に文字列を挿入する。
	***	__p	- 挿入する文字列へのポインタ (wsappend)
			- 挿入する文字列が格納された変数 (wsappendv)
			- 挿入する wstring (wsappendm)
			- 挿入するANSI文字列が格納された変数 (wsappendA)
	int	po	挿入する文字列の開始位置(省略時0)
	int	n	挿入する文字列の文字数(省略時-1)

wserase int po, int n
	文字列を削除する。
	int	po	削除する文字列の位置(省略時0)
	int	n	削除する文字列の文字数(省略時-1)
	
wsreplace int po1, int n1, *** __p, int po2, int n2
	文字列の一部を置き換える。
	int	po1	置き換える位置
	int	n1	置き換える文字数
	***	__p	- 置き換える文字列へのポインタ (wsreplace)
			- 置き換える文字列が格納された変数 (wsreplacev)
			- 置き換える文字列が格納された wstring (wsreplacem)
			- 置き換えるANSI文字列が格納された変数 (wsreplaceA)
	int	po2	置き換える文字列の位置(省略時0)
	int	n2	置き換える文字列の文字数(省略時-1)

wsswap var m
	wstring を交換する。
	var	m	交換する wstring

wscompare(*** __p)
	文字列を比較する。
	***	__p	- 比較する文字列へのポインタ (wscompare)
			- 比較する文字列が格納された変数 (wscomparev)
			- 比較する wstring (wscomparem)
			- 比較するANSI文字列が格納された変数 (wscompareA)

	返却値	this >  __p	正
			this == __p	0
			this <  __p	負

wscopy *** __p
	文字列をコピーする。
	***	__p	- コピー先のwchar_t型変数へのポインタ (wscopy)
			- コピー先のwchar_t型変数 (wscopyv)

	この命令を呼び出す前に適切な大きさのメモリを確保する必要があります。

wsfind(*** __p, int po)
	文字列を検索する。
	***	__p	- 検索する文字列へのポインタ (wsfind)
			- 検索する文字列が格納された変数 (wsfindv)
			- 検索する wstring (wsfindm)
			- 検索するANSI文字列が格納された変数 (wsfindA)
	int	po	検索開始位置(省略時0)

	返却値	見つかった場合は文字列の位置、それ以外は-1

wsrfind(*** __p, int po)
	文字列を末尾から逆に検索する。
	***	__p	- 検索する文字列へのポインタ (wsrfind)
			- 検索する文字列が格納された変数 (wsrfindv)
			- 検索する wstring (wsrfindm)
			- 検索するANSI文字列が格納された変数 (wsrfindA)
	int	po	検索開始位置(省略時-1)

	返却値	見つかった場合は文字列の位置、それ以外は-1

wsfind_first_of(*** __p, int po)
	検索する文字列の内どれか1文字がマッチする場所を探す。
	***	__p	- 検索する文字列へのポインタ (wsfind_first_of)
			- 検索する文字列が格納された変数 (wsfind_first_ofv)
			- 検索する wstring (wsfind_first_ofm)
			- 検索するANSI文字列が格納された変数 (wsfind_first_ofA)
	int	po	検索開始位置(省略時0)

	返却値	見つかった場合は文字列の位置、それ以外は-1
	
wsfind_first_not_of(*** __p, int po)
	検索する文字列の内いずれの1文字もマッチしない場所を探す。
	***	__p	- 検索する文字列へのポインタ (wsfind_first_not_of)
			- 検索する文字列が格納された変数 (wsfind_first_not_ofv)
			- 検索する wstring (wsfind_first_not_ofm)
			- 検索するANSI文字列が格納された変数 (wsfind_first_not_ofA)
	int	po	検索開始位置(省略時0)

	返却値	見つかった場合は文字列の位置、それ以外は-1
	
wsfind_last_of(*** __p, int po)
	検索する文字列の内どれか1文字がマッチする場所を末尾から逆に探す。
	***	__p	- 検索する文字列へのポインタ (wsfind_last_of)
			- 検索する文字列が格納された変数 (wsfind_last_ofv)
			- 検索する wstring (wsfind_last_ofm)
			- 検索するANSI文字列が格納された変数 (wsfind_last_ofA)
	int	po	検索開始位置(省略時-1)

	返却値	見つかった場合は文字列の位置、それ以外は-1
	
wsfind_last_not_of(*** __p, int po)
	検索する文字列の内いずれの1文字もマッチしない場所を末尾から逆に探す。
	***	__p	- 検索する文字列へのポインタ (wsfind_last_not_of)
			- 検索する文字列が格納された変数 (wsfind_last_not_ofv)
			- 検索する wstring (wsfind_last_not_ofm)
			- 検索するANSI文字列が格納された変数 (wsfind_last_not_ofA)
	int	po	検索開始位置(省略時-1)

	返却値	見つかった場合は文字列の位置、それ以外は-1

wssubstr var m, int po, int n
	文字列を取り出す。
	var	m	取り出した文字列を格納する wstring
	int	po	取り出す位置(省略時0)
	int	n	取り出す文字数(省略時-1)
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