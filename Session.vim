let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Downloads/documents/rapport-tfe-asygn
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +20 main.tex
badd +2467 main.log
badd +12 frontmatter/abstract_fr.tex
badd +2 appendix/appendix.tex
badd +80 configuration/style.tex
badd +13 configuration/comon_packages.tex
badd +4 appendix/A-mathematics/A-mathematics.tex
badd +4 frontmatter/listoflistings.tex
badd +4 introduction/introduction.tex
badd +8 frontmatter/listoffigures.tex
badd +1 frontmatter
badd +30 frontmatter/nomenclature.tex
badd +2 frontmatter/tableofcontents.tex
badd +55 configuration/variables.tex
badd +18 configuration/bibliography.tex
badd +32 plan.tex
badd +7 frontmatter/remerciements.tex
badd +1 nomenclature.tex.aux
badd +3 frontmatter/abstract_en.tex
badd +27 configuration/nomenclature.tex
badd +37 titlepage/titlepage.tex
badd +1 ~/Downloads/documents/rapport-tfe-asygn
badd +4 main.bib
badd +7 readme.md
argglobal
silent! argdel *
argadd main.tex
edit configuration/style.tex
set splitbelow splitright
wincmd t
set winminheight=1 winminwidth=1 winheight=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 350 - ((55 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
350
normal! 029|
lcd ~/Downloads/documents/rapport-tfe-asygn
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
