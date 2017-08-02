let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Downloads/documents/rapport-tfe-asygn
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +50 main.tex
badd +3036 main.log
badd +12 frontmatter/abstract_fr.tex
badd +2 appendix/appendix.tex
badd +374 configuration/style.tex
badd +63 configuration/comon_packages.tex
badd +4 appendix/A-mathematics/A-mathematics.tex
badd +4 frontmatter/listoflistings.tex
badd +4 introduction/introduction.tex
badd +8 frontmatter/listoffigures.tex
badd +1 frontmatter
badd +30 frontmatter/nomenclature.tex
badd +2 frontmatter/tableofcontents.tex
badd +1 configuration/variables.tex
badd +33 configuration/bibliography.tex
badd +43 plan.tex
badd +7 frontmatter/remerciements.tex
badd +1 nomenclature.tex.aux
badd +3 frontmatter/abstract_en.tex
badd +26 configuration/nomenclature.tex
badd +37 titlepage/titlepage.tex
badd +1 ~/Downloads/documents/rapport-tfe-asygn
badd +41 main.bib
badd +7 readme.md
badd +5 Makefile
badd +1 configuration
badd +1 content.tex
badd +3 configuration/mainmatter.tex
badd +5 configuration/frontmatter.tex
badd +0 chap1/1-gyroscope/gyroscope.tex
badd +10 chap1/chap1.tex
badd +6 chap1/1-sectiontest/1-sectiontest.tex
badd +33 chap1/1-sectiontest/1-subsection/subsectionname.tex
badd +5 chap1/1-sectiontest/main.tex
badd +18 chap1/1-sectiontest/1-equations/main.tex
badd +49 chap1/1-sectiontest/2-figures/exci_detect.tex
badd +4 chap1/2-sectiontest/main.tex
badd +1 chap1/2-sectiontest/1-codesources/main.tex
badd +30 chap1/2-sectiontest/2-listes/main.tex
badd +7 chap2/chap1.tex
badd +6 chap2/1-sectiontest/main.tex
badd +39 chap2/1-sectiontest/1-tableaux/main.tex
badd +15 chap2/1-sectiontest/2-references/main.tex
badd +1 chap1/1-sectiontest/1-equations
badd +10 chap1/1-sectiontest/2-figures/main.tex
badd +6 chap2/2-sectiontest/main.tex
badd +8 chap2/2-sectiontest/1-paragraph/main.tex
badd +3 chap2/2-sectiontest/2-divers/main.tex
badd +2 configuration/custom_packages.tex
argglobal
silent! argdel *
argadd main.tex
edit readme.md
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
let s:l = 10 - ((9 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10
normal! 0
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
