let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Downloads/rapport_preliminaire/rapport-tfe-asygn
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +160 main.tex
badd +1 ~/Downloads/rapport_preliminaire/rapport-tfe-asygn
badd +1 gyroscope/A_fonct_meca/bode_dut_k.tikz
badd +41 gyroscope/A_fonct_meca/fonct_meca.tex
badd +11 style.tex
badd +5 nomenclature.tex
badd +18 Makefile
badd +1 rapport.sty
badd +1 main.aux
badd +1 main.bib
badd +20 gyroscope/B_exci_detect/exci_detect.tex
badd +1 introduction/introduction.tex
badd +9 chap1/chap1.tex
badd +6 chap2/chap2.tex
badd +0 gyroscope/A_fonct_meca/fonct_meca.tex
badd +9 chap1/gyroscope/gyroscope.tex
badd +17 chap1/elec_architecture/elec_architecture.tex
badd +9 chap1/effet_temperature/effet_temperature.tex
badd +7 chap1/control/control.tex
badd +73 chap1/elec_architecture/A_electronique/electronique.tex
badd +4 conclusion/conclusion.tex
badd +190 chap1/gyroscope/A_fonct_meca/fonct_meca.tex
badd +40 chap1/gyroscope/B_exci_detect/exci_detect.tex
badd +27 chap1/elec_architecture/B_architecture/architecture.tex
badd +18 chap1/elec_architecture/C_PLL/PLL.tex
badd +40 chap1/effet_temperature/A_temp_gyro/temp_gyro.tex
badd +50 chap1/effet_temperature/B_temp_elec/temp_elec.tex
badd +29 chap1/control/A_PLL_AGC/PLL_AGC.tex
badd +61 chap1/control/C_one_time_sweep/one_time_sweep.tex
badd +16 chap1/control/E_adaptive_control/adaptive_control.tex
badd +4 appendix/appendix.tex
badd +1 nomenclature.tex.aux
badd +0 nomenclature/nomenclature.tex
badd +29 chap1/control/E_adaptive_control/adaptive_control.tikz
badd +21 chap1/elec_architecture/B_architecture/open_loop_frequency.tikz
badd +2 chap1/elec_architecture/C_PLL/PLL.tikz
badd +0 chap1/elec_architecture/C_PLL/elect_phase.tikz
badd +43 Session.vim
badd +9 chap1/1-gyroscope/gyroscope.tex
badd +1 appendix/A-mathematics/A-mathematics.tex
badd +10 appendix/B-hinfiny/B-hinfiny.tex
badd +11 chap1/2-elec-architecture/C_PLL/elect_phase.tikz
badd +18 chap1/3-effet-temperature/A_temp_gyro/temp_gyro.tex
badd +50 chap1/4-control/C_one_time_sweep/one_time_sweep.tex
badd +45 chap1/3-effet-temperature/B_temp_elec/temp_elec.tex
badd +18 chap1/2-elec-architecture/C_PLL/PLL.tex
badd +173 chap1/1-gyroscope/A_fonct_meca/fonct_meca.tex
badd +26 chap1/1-gyroscope/A_fonct_meca/bode_dut_sys_overview.tikz
badd +18 chap1/3-effet-temperature/B_temp_elec/loss_mag_phase_drift_percentage_zoom.tikz
badd +14 chap1/2-elec-architecture/A_electronique/electronique.tex
badd +0 chap1/2-elec-architecture/A_electronique/charge_amplifier.tikz
badd +21 chap1/4-control/E_adaptive_control/adaptive_control.tex
badd +28 chap1/4-control/B_synthese_correcteurs/synthese_correcteurs.tex
badd +23 chap1/1-gyroscope/B_exci_detect/exci_detect.tex
badd +12 chap1/4-control/A_PLL_AGC/PLL_AGC.tex
badd +41 chap1/4-control/D_rejet_temperature/rejet_temperature.tex
badd +54 chap1/1-gyroscope/C_non_idealities/non_idealities.tex
badd +3298 main.log
argglobal
silent! argdel *
argadd main.tex
edit chap1/4-control/B_synthese_correcteurs/synthese_correcteurs.tex
set splitbelow splitright
set nosplitbelow
set nosplitright
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
let s:l = 17 - ((12 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 018|
lcd ~/Downloads/rapport_preliminaire/rapport-tfe-asygn
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
