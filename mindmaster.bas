   10 rem *************************
   20 rem ** version: 1.3        **
   30 rem ** written: 1991/12/02 **
   40 rem ** updated: 2019/08/26 **
   50 rem ** author:  kelly fox  **
   60 rem *************************
   70 color0,1:color4,1:k$="????????":graphic1,1:graphic0:bload"mindmaster.chr",b0,p8192
   80 dimc(13):fort=1to13:readc(t):nextt:fort=0to6:readd:o(t)=d:nextt:poke2604,25:scnclr:d=0
   90 color5,4:char1,13,10,"{rvon}1{rvof}  normal mode"
  100 color5,15:char1,13,12,"{rvon}2{rvof}  expert mode"
  110 color5,7:char1,13,14,"{rvon}c{rvof}  custom mode"
  120 color5,11:char1,13,16,"{rvon}q{rvof}  quit"
  130 ifc1>1thencolor5,2:char1,4,19,"press space for previous options"
  140 color5,6:char1,9,23,"version 1.3 2019/08/26":color5,14:char1,14,24,"by kelly fox"
  150 color5,o(d):char1,3,4,"UIUI{CBM-R}UI I{CBM-A}{SHIFT-*}{SHIFT-*}IUIUIU{SHIFT-*}{SHIFT-*}IU{SHIFT-*}{SHIFT-*}I{SHIFT-*}{CBM-R}{SHIFT-*}U{SHIFT-*}{SHIFT-*}{CBM-A}{SHIFT-*}I":d=d+1:ifd>6thend=0
  160 color5,o(d):char1,3,5,"{SHIFT--}{SHIFT--}{SHIFT--}{SHIFT--}{SHIFT--}{SHIFT--}JI{SHIFT--}{SHIFT--}  H{SHIFT--}{SHIFT--}{SHIFT--}{SHIFT--}{SHIFT--}  {SHIFT--}G    {SHIFT--} {SHIFT--}  {SHIFT--} H":d=d+1:ifd>6thend=0
  170 color5,o(d):char1,3,6,"{SHIFT--}JK{SHIFT--}{SHIFT--}{SHIFT--} J{CBM-W}{SHIFT--}  H{SHIFT--}JK{SHIFT--}{CBM-Q}{SHIFT-*}{SHIFT-*}{CBM-W}J{SHIFT-*}{SHIFT-*}I {SHIFT--} {CBM-Q}{SHIFT-*} {CBM-Q}{CBM-R}K":d=d+1:ifd>6thend=0
  180 color5,o(d):char1,3,7,"{SHIFT--}  {SHIFT--}{SHIFT--}{SHIFT--}  {SHIFT--}{SHIFT--}  H{SHIFT--}  {SHIFT--}{SHIFT--}  {SHIFT--}   H {SHIFT--} {SHIFT--}  {SHIFT--}JI":d=d+1:ifd>6thend=0
  190 color5,o(d):char1,3,8,"{CBM-Z}  {CBM-X}{CBM-E}{CBM-Z}  {CBM-X}{CBM-Z}{SHIFT-*}{SHIFT-*}K{CBM-Z}  {CBM-X}{CBM-Z}  {CBM-X}J{SHIFT-*}{SHIFT-*}K {CBM-E} J{SHIFT-*}{SHIFT-*}{CBM-Z} J":d=d+1:ifd>6thend=0
  200 getz$:ifz$=""then150
  210 ifz$=" "andc1>1thench=c1:goto410
  220 ifz$="1"thench=10:c1=10:r=4:cl=6:goto410
  230 ifz$="2"thench=12:c1=12:r=5:cl=8:goto410
  240 ifz$="c"then280
  250 ifz$="q"thenscnclr:poke2604,21:end
  260 goto200
  270 rem *** choose options ***
  280 print"{clr}{down}{lblu}{rvon}             choose options             {rvof}{down}{down}{down}"
  290 print"{cyn}how many guesses (2-20)";
  300 inputch:ifch<2orch>20thenprint"choose a number between 2 and 20.":goto290
  310 ch=int(ch):c1=ch
  320 print"{lblu}how many pegs per row (2-8)";
  330 inputr:ifr<2orr>8thenprint"choose a number between 2 and 8.":goto320
  340 r=int(r)
  350 print"{blu}how many possible colors (2-13)";
  360 inputcl:ifcl<2orcl>13thenprint"choose a number between 2 and 13.":goto350
  370 cl=int(cl)
  380 goto410
  390 data2,3,8,5,6,7,4,9,11,10,15,16,14,12,13,16,2,16,13,12
  400 rem *** main program ***
  410 scnclr
  420 rem *** generate solution ***
  430 fort=1tor
  440 x=int(rnd(0)*cl)+1:s(t)=c(x)
  450 nextt
  460 rem *** display ***
  470 q$="W":fort=2tor:q$=q$+"W":nextt
  480 t=len(q$):z$=right$(k$,t):color5,14:char1,0,0,"solution:"+z$
  490 color5,13:fort=1toch:char1,9,1+t,q$:nextt
  500 fort=1tocl:color5,c(t):char1,20,1+t,"Q":nextt
  505 rem *** guess ***
  510 y=1:gosub900
  520 color5,14:char1,20,0,"guess:":char1,26,0,"        ":d=0
  530 fort=1tor
  540 color5,o(d):char1,22,1+y,"_":d=d+1:ifd>6thend=0
  550 getz$:ifz$=""then540
  560 ifz$="{up}"then610
  570 ifz$="{down}"then640
  580 ifz$="{left}"andt>1thenchar1,24+t,0," ":t=t-1:goto550
  590 ifz$=" "theng(t)=c(y):color5,c(y):char1,25+t,0,"Q":goto670
  600 goto540
  610 char1,22,1+y," ":y=y-1
  620 ify<1theny=cl
  630 goto540
  640 char1,22,1+y," ":y=y+1
  650 ify>cltheny=1
  660 goto540
  670 nextt
  680 char1,22,1+y," ":fort=1tor:color5,g(t):char1,8+t,ch+1,"Q":nextt
  690 rem *** check position and color ***
  700 fort=1tor:js(t)=0:jg(t)=0:nextt:color5,12:x=0:fort=1tor:ifg(t)=s(t)thenchar1,x,ch+1,"Q":x=x+1:js(t)=1:jg(t)=1:sound1,3000,1
  710 nextt:ifx=rthen860
  720 rem *** check color only ***
  730 color5,2:fort=1tor:ifjg(t)=1then790
  740 k=1
  750 ifk=tthen780
  760 ifjs(k)=1then780
  770 ifg(t)=s(k)thenchar1,x,ch+1,"Q":x=x+1:jg(t)=1:js(k)=1:sound1,2700,1:goto790
  780 ifk<rthenk=k+1:goto750
  790 nextt:ch=ch-1:ifch=0then820
  800 goto520
  810 rem *** player loses ***
  820 fort=1tor:color5,s(t):char1,8+t,0,"Q":nextt:color5,2:char1,11,23,"*** you lose!! ***":char1,13,24,"(press space)"
  830 sound2,500,60:sound1,2000,30,1,20,50:sound1,1000,30
  840 goto880
  850 rem *** player wins ***
  860 fort=1tor:color5,s(t):char1,8+t,0,"Q":nextt:color5,2:char1,12,23,"*** you win! ***":char1,13,24,"(press space)"
  870 sound2,2000,3:sound1,3000,14:sound2,2000,3:sound1,3300,7:sound2,2000,20:sound1,4000,20
  880 getz$:ifz$=""then880
  890 scnclr:goto90
  900 rem *** instructions ***
  910 color5,12
  920 char1,20,16,"up/down to move"
  930 char1,20,17,"space to select"
  940 char1,20,18,"left to undo"
  950 return
