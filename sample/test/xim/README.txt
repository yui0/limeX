���̃f�B���N�g���[�́A���{����̓v���O���~���O
(http://home.catv.ne.jp/pp/ginoue/im/index.html)
�ɂ������T���v���v���O������ Linux RedHat 7.1(���Ԃ�)���
���삷��悤�ɏC�������������̂ł��B

��ȏC���́Asetlocale()�̂��ƂɁAXSetLocaleModifiers("")���Ăяo��
�悤�ɂ����_�ł��B �܂��AMakefile���p�ӂ��܂����B

�g�����́A make��Akinput2���N�����AXIM���g�p�ł���悤�ɂ������ƁA
���ϐ� LANG��XMODIFIERS��ݒ肵�A

  % setenv LANG ja_JP.ujis
  % setenv XMODIFIERS "@im=kinput2"

�e�v���O�������N�����Ă��������B

  % ./xim1

Shift+SPACE����͂���� kinput2�œ��{�ꂪ���͂ł���悤��
�Ȃ�͂��ł��B

2002/12/05(Thu) ���� �G (nari@humblesoft.com)

