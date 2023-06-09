#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��x�cmain.sh mR�k�@��x��V)�T�]�R==�?h��4�$���0�d���DDT���,HO� XD��_�����e���a&�o����y<�=�$�%�L����qaӤL: a��!���� n���U��*Q:iO�f�т���!��H
E��E�e9&YYB��w�7T��!��cM< 9W�*��F�J����� ��װ�0sܲ���J��w�w�4S���Ur�r���m:��Dy����D��U��R��B�w�d���N��́jNo�@��@0���N�j�.��`8ⅽ���]��C��T$�,��.�a�`�\!��mX`��=Ϭ�ܷ�}���[{G;ۏ��v�O��s�����c�8.�	"V��k��0U�N'��7g������ɷzr1=�uu�s�����O?~x�#�X_��G��~���;�z�v��?.�|�<{;���N��6uk��0l`��v2t�^`V�4�ǵ�[�}U�9�����l�����-R�9�_|��&  