$inlineCom [ ]
$eolCom //

$stitle Example Model Definitions

Set
i       '17 transshipment centers'    / Slg, Brn, Mot, Btl, Mgl, Gnd, Bnt, Chr, Brt, Srl, Amj, Ctw, Ktm, Pkr, Bhw, Npj, Dhn /
j(i)    '17 transshipment centers'
m(i)    '7 supply centers'
n(i)    '10 distribution centers'
p       '2 products: diesel and petrol'         / die, pet /
r       '2 modes: truck and pipeline'           / trk, pip /
o(r)    'pipeline mode only'
s       '9 scenarios'                           / s1, s2, s3, s4, s5, s6, s7, s8, s9 /
k       'objective functions'       / cost, loss /;
j(i) = yes;
m(i) = yes;
m('Chr') = no;
m('Brt') = no;
m('Srl') = no;
m('Amj') = no;
m('Ctw') = no;
m('Ktm') = no;
m('Pkr') = no;
m('Bhw') = no;
m('Npj') = no;
m('Dhn') = no;
n(i) = yes;
n('Slg') = no;
n('Brn') = no;
n('Mot') = no;
n('Btl') = no;
n('Mgl') = no;
n('Gnd') = no;
n('Bnt') = no;
o(r) = yes;
o('trk') = no;

$set min -1
$set max +1

Parameter
*dir(k) 'direction of the objective functions 1 for max and -1 for min' / cost -1, revenue +1, loss -1 /
dir(k) 'direction of the objective functions 1 for max and -1 for min' / cost -1, loss -1 /;

* available supply in KL
Table A(p,i)
	Slg	Brn	Mot	Btl	Mgl	Gnd	Bnt
die	61700	72600	170900	25100	5700	21600	11000
pet	21500	30700	62200	6700	2600	4800	2400;

* demand share in %
Table alpha(p,i)
	Chr	Brt	Srl	Amj	Ctw	Ktm	Pkr	Bhw	Npj	Dhn
die	0.05	0.14	0.05	0.18	0.12	0.17	0.04	0.14	0.06	0.05
pet	0.06	0.13	0.05	0.11	0.11	0.31	0.06	0.1	0.04	0.03;

* scenario-based total network demand in KL
Table D(s,p)
	die	pet
s1	195000	69000
s2	188000	66000
s3	180000	63000
s4	188000	66000
s5	181000	64000
s6	174000	61000
s7	180000	63000
s8	174000	61000
s9	167000	59000;

Table U(p,i)
	Chr	Brt	Srl	Amj	Ctw	Ktm	Pkr	Bhw	Npj	Dhn
die	00000	07110	00000	20600	00000	08400	02280	00000	02280	01590
pet	00000	00560	00000	01930	00000	05310	00350	00000	00210	00070;

Table H(p,i,i)
	Slg	Chr	Mot	Amj	Ctw
die.Slg	000	216	000	000	000
die.Chr	216	000	000	000	000
die.Mot	000	000	000	360	000
die.Amj	000	000	360	000	360
die.Ctw	000	000	000	360	000
pet.Slg	000	072	000	000	000
pet.Chr	072	000	000	000	000
pet.Mot	000	000	000	144	000
pet.Amj	000	000	144	000	144
pet.Ctw	000	000	000	144	000;

Table F(i,i)
	Slg	Chr	Mot	Amj	Ctw
Slg	000	200	000	000	000
Chr	200	000	000	000	000
Mot	000	000	000	250	000
Amj	000	000	250	000	250
Ctw	000	000	000	250	000;

Table beta(p,i)
	Chr	Brt	Srl	Amj	Ctw	Ktm	Pkr	Bhw	Npj	Dhn
die	0.3	0.2	0.3	0.2	0.5	0.2	0.1	0.3	0.1	0.1
pet	0.3	0.2	0.3	0.2	0.5	0.2	0.1	0.3	0.1	0.1;

Parameter gamma(p) /
die 0.1
pet 0.1 /;

Parameter W(i) /
Chr	40000
Brt	5330
Srl	23000
Amj	17470
Ctw	102000
Ktm	760
Pkr	10760
Bhw	40000
Npj	760
Dhn	760 /;

Table Zi(s,p)
	die	pet
s1	0.09	0.09
s2	0.18	0.18
s3	0.03	0.03
s4	0.18	0.18
s5	0.36	0.36
s6	0.06	0.06
s7	0.03	0.03
s8	0.06	0.06
s9	0.01	0.01;

Table TC(r,i,i)
	Amj	Bhw	Bnt	Brn	Brt	Btl	Chr	Ctw	Dhn	Gnd	Ktm	Mgl	Mot	Npj	Pkr	Slg	Srl
trk.Amj	0	1900	5600	2600	2400	2000	2900	700	4700	3600	1900	3500	1000	3600	1800	3500	800
trk.Bhw	1900	0	4200	4000	4100	1600	4600	1500	3300	1900	2200	3100	2700	2200	2000	5200	2500
trk.Bnt	5600	4200	0	7600	7800	5300	8200	5200	1600	3500	5900	5700	6100	2300	5700	8600	6200
trk.Brn	2600	4000	7600	0	2600	2800	3300	3000	7000	5400	4200	4300	2000	5900	4100	3700	2300
trk.Brt	2400	4100	7800	2600	0	4100	1000	2900	6900	5800	4100	5600	3100	5800	4000	1600	1900
trk.Btl	2000	1600	5300	2800	4100	0	4600	2500	4700	3100	3600	2000	1700	3600	3400	4900	2500
trk.Chr	2900	4600	8200	3300	1000	4600	0	3300	7400	6300	4600	6000	3600	6200	4400	800	2300
trk.Ctw	700	1500	5200	3000	2900	2500	3300	0	4300	3200	1500	3900	1500	3100	1300	3900	1300
trk.Dhn	4700	3300	1600	7000	6900	4700	7400	4300	0	3000	5000	5200	5500	1500	4800	8000	5300
trk.Gnd	3600	1900	3500	5400	5800	3100	6300	3200	3000	0	3900	2700	4100	1700	3700	6600	4200
trk.Ktm	1900	2200	5900	4200	4100	3600	4600	1500	5000	3900	0	5000	2700	3900	2000	5200	2500
trk.Mgl	3500	3100	5700	4300	5600	2000	6000	3900	5200	2700	5000	0	3100	3900	4900	6300	3900
trk.Mot	1000	2700	6100	2000	3100	1700	3600	1500	5500	4100	2700	3100	0	4400	2600	3900	1500
trk.Npj	3600	2200	2300	5900	5800	3600	6200	3100	1500	1700	3900	3900	4400	0	3700	6800	4200
trk.Pkr	1800	2000	5700	4100	4000	3400	4400	1300	4800	3700	2000	4900	2600	3700	0	5000	2300
trk.Slg	3500	5200	8600	3700	1600	4900	800	3900	8000	6600	5200	6300	3900	6800	5000	0	2900
trk.Srl	800	2500	6200	2300	1900	2500	2300	1300	5300	4200	2500	3900	1500	4200	2300	2900	0
pip.Amj	0	100000	100000	100000	100000	100000	100000	0	100000	100000	100000	100000	0	100000	100000	100000	100000
pip.Bhw	100000	0	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000
pip.Bnt	100000	100000	0	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000
pip.Brn	100000	100000	100000	0	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000
pip.Brt	100000	100000	100000	100000	0	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000
pip.Btl	100000	100000	100000	100000	100000	0	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000
pip.Chr	100000	100000	100000	100000	100000	100000	0	100000	100000	100000	100000	100000	100000	100000	100000	0	100000
pip.Ctw	0	100000	100000	100000	100000	100000	100000	0	100000	100000	100000	100000	100000	100000	100000	100000	100000
pip.Dhn	100000	100000	100000	100000	100000	100000	100000	100000	0	100000	100000	100000	100000	100000	100000	100000	100000
pip.Gnd	100000	100000	100000	100000	100000	100000	100000	100000	100000	0	100000	100000	100000	100000	100000	100000	100000
pip.Ktm	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	0	100000	100000	100000	100000	100000	100000
pip.Mgl	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	0	100000	100000	100000	100000	100000
pip.Mot	0	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	0	100000	100000	100000	100000
pip.Npj	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	0	100000	100000	100000
pip.Pkr	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	0	100000	100000
pip.Slg	100000	100000	100000	100000	100000	100000	0	100000	100000	100000	100000	100000	100000	100000	100000	0	100000
pip.Srl	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	100000	0;

Table LC(p,r,i,i)
		Slg	Brn	Mot	Btl	Mgl	Gnd	Bnt	Chr	Brt	Srl	Amj	Ctw	Ktm	Pkr	Bhw	Npj	Dhn
die.trk.Slg	1000	1000	1000	1000	1000	1000	1000	0	0	10	0	0	290	230	0	0	0
die.trk.Brn	1000	1000	1000	1000	1000	1000	1000	370	240	380	290	360	660	600	350	300	290
die.trk.Mot	1000	1000	1000	1000	1000	1000	1000	160	30	170	80	150	450	390	140	90	80
die.trk.Btl	1000	1000	1000	1000	1000	1000	1000	50	0	60	0	50	350	290	30	0	0
die.trk.Mgl	1000	1000	1000	1000	1000	1000	1000	80	0	80	0	70	370	310	50	10	0
die.trk.Gnd	1000	1000	1000	1000	1000	1000	1000	110	0	120	30	110	410	350	90	50	40
die.trk.Bnt	1000	1000	1000	1000	1000	1000	1000	280	150	290	200	270	570	510	260	210	200
die.trk.Chr	1000	1000	1000	1000	1000	1000	1000	0	0	10	0	0	290	230	0	0	0
die.trk.Brt	1000	1000	1000	1000	1000	1000	1000	130	0	140	50	120	420	360	110	60	50
die.trk.Srl	1000	1000	1000	1000	1000	1000	1000	0	0	0	0	0	290	230	0	0	0
die.trk.Amj	1000	1000	1000	1000	1000	1000	1000	80	0	90	0	80	380	320	60	20	10
die.trk.Ctw	1000	1000	1000	1000	1000	1000	1000	10	0	20	0	0	300	240	0	0	0
die.trk.Ktm	1000	1000	1000	1000	1000	1000	1000	0	0	0	0	0	0	0	0	0	0
die.trk.Pkr	1000	1000	1000	1000	1000	1000	1000	0	0	0	0	0	60	0	0	0	0
die.trk.Bhw	1000	1000	1000	1000	1000	1000	1000	20	0	30	0	20	320	260	0	0	0
die.trk.Npj	1000	1000	1000	1000	1000	1000	1000	70	0	80	0	60	360	300	50	0	0
die.trk.Dhn	1000	1000	1000	1000	1000	1000	1000	80	0	80	0	70	370	310	50	10	0
pet.trk.Slg	1000	1000	1000	1000	1000	1000	1000	0	0	120	0	90	540	550	20	0	180
pet.trk.Brn	1000	1000	1000	1000	1000	1000	1000	320	290	430	300	410	850	860	340	230	490
pet.trk.Mot	1000	1000	1000	1000	1000	1000	1000	90	70	210	80	190	630	640	120	10	270
pet.trk.Btl	1000	1000	1000	1000	1000	1000	1000	50	20	160	40	140	580	600	70	0	220
pet.trk.Mgl	1000	1000	1000	1000	1000	1000	1000	140	120	260	130	230	680	690	160	60	320
pet.trk.Gnd	1000	1000	1000	1000	1000	1000	1000	210	190	330	200	300	750	760	230	130	390
pet.trk.Bnt	1000	1000	1000	1000	1000	1000	1000	270	250	390	260	360	810	820	290	190	440
pet.trk.Chr	1000	1000	1000	1000	1000	1000	1000	0	0	120	0	90	540	550	20	0	180
pet.trk.Brt	1000	1000	1000	1000	1000	1000	1000	20	0	140	10	120	560	570	50	0	200
pet.trk.Srl	1000	1000	1000	1000	1000	1000	1000	0	0	0	0	0	420	430	0	0	60
pet.trk.Amj	1000	1000	1000	1000	1000	1000	1000	10	0	130	0	110	550	560	40	0	190
pet.trk.Ctw	1000	1000	1000	1000	1000	1000	1000	0	0	20	0	0	440	460	0	0	80
pet.trk.Ktm	1000	1000	1000	1000	1000	1000	1000	0	0	0	0	0	0	10	0	0	0
pet.trk.Pkr	1000	1000	1000	1000	1000	1000	1000	0	0	0	0	0	0	0	0	0	0
pet.trk.Bhw	1000	1000	1000	1000	1000	1000	1000	0	0	90	0	70	510	530	0	0	150
pet.trk.Npj	1000	1000	1000	1000	1000	1000	1000	80	60	200	70	180	620	630	110	0	260
pet.trk.Dhn	1000	1000	1000	1000	1000	1000	1000	0	0	0	0	0	360	370	0	0	0
die.pip.Slg	1000	1000	1000	1000	1000	1000	1000	0	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Brn	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Mot	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	0	1000	1000	1000	1000	1000	1000
die.pip.Btl	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Mgl	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Gnd	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Bnt	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Chr	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Brt	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Srl	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Amj	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	0	1000	1000	1000	1000	1000
die.pip.Ctw	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Ktm	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Pkr	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Bhw	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Npj	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
die.pip.Dhn	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Slg	1000	1000	1000	1000	1000	1000	1000	0	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Brn	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Mot	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	0	1000	1000	1000	1000	1000	1000
pet.pip.Btl	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Mgl	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Gnd	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Bnt	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Chr	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Brt	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Srl	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Amj	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	0	1000	1000	1000	1000	1000
pet.pip.Ctw	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Ktm	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Pkr	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Bhw	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Npj	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000
pet.pip.Dhn	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000	1000;

Parameter
objvf1          'value of objective function 1'
objvf2          'value of objective function 2';
         
Variable
z(k) 'objective function variables';

Positive variable
X(s,p,r,i,i), V(s,p,i);

Equation
obj1
obj2
c1(s,p,i)
c2(s,p,i)
c3(s,p,i)
c4(s,p,r,i,i)
c5(s,p)
c6(s,p,i)
c7(s,p,i)
c8(s,i)
c9(s,p,r,i,i)
c10(s,p,i);

obj1..              sum((s,p,r,i,j)$(not sameas (i,j)), Zi(s,p)*TC(r,i,j)*X(s,p,r,i,j)/1000) =e= z('cost');
obj2..              sum((s,p,r,i,j)$(not sameas (i,j)), Zi(s,p)*LC(p,r,i,j)*X(s,p,r,i,j)/100) =e= z('loss');

c1(s,p,m)..         sum((r,j)$(not sameas (m,j)), (X(s,p,r,m,j) - X(s,p,r,j,m))) =l= A(p,m);
c2(s,p,n)..         sum((r,i)$(not sameas (i,n)), (X(s,p,r,i,n) - X(s,p,r,n,i))) =g= alpha(p,n)*D(s,p);
c3(s,p,n)..         sum((r,i)$(not sameas (i,n)), (X(s,p,r,i,n) - X(s,p,r,n,i))) =l= alpha(p,n)*D(s,p) + U(p,n) + V(s,p,n);
c4(s,p,o,i,j)..     X(s,p,o,i,j)$(not sameas (i,j)) =l= H(p,i,j)*F(i,j);
c5(s,p)..           sum(n, U(p,n) + V(s,p,n)) =g= D(s,p);
c6(s,p,n)..         U(p,n) + V(s,p,n) =g= beta(p,n)*alpha(p,n)*D(s,p);
c7(s,p,n)..         U(p,n) + V(s,p,n) =g= gamma(p)*(sum((r,i), X(s,p,r,i,n)));
c8(s,n)..           sum(p, V(s,p,n)) =l= W(n);
c9(s,p,r,i,j)..     X(s,p,r,i,j)$(not sameas (i,j)) =g= 0;
c10(s,p,n)..        V(s,p,n) =g= 0;

Model example / all /;

$sTitle eps-constraint Method
Set
   k1(k)  'the first element of k'
   km1(k) 'all but the first elements of k'
   kk(k)  'active objective function in constraint allobj';

k1(k)$(ord(k) = 1) = yes;
km1(k)  = yes;
km1(k1) =  no;

Parameter
   rhs(k)    'right hand side of the constrained obj functions in eps-constraint'
   maxobj(k) 'maximum value from the payoff table'
   minobj(k) 'minimum value from the payoff table'
   numk(k)   'ordinal value of k starting with 1';

Scalar
   iter         'total number of iterations'
   infeas       'total number of infeasibilities'
   elapsed_time 'elapsed time for payoff and e-sonstraint'
   start        'start time'
   finish       'finish time';

Variable
   a_objval 'auxiliary variable for the objective function'
   obj      'auxiliary variable during the construction of the payoff table'
   sl(k)    'slack or surplus variables for the eps-constraints';

Positive Variable sl;

Equation
   con_obj(k) 'constrained objective functions'
   augm_obj   'augmented objective function to avoid weakly efficient solutions'
   allobj     'all the objective functions in one expression';

con_obj(km1).. z(km1) - dir(km1)*sl(km1) =e= rhs(km1);

* We optimize the first objective function and put the others as constraints
* the second term is for avoiding weakly efficient points

augm_obj..
   a_objval =e= sum(k1,dir(k1)*z(k1))
         + 1e-3*sum(km1,power(10,-(numk(km1) - 1))*sl(km1)/(maxobj(km1) - minobj(km1)));

allobj.. sum(kk, dir(kk)*z(kk)) =e= obj;

Model
   mod_payoff    / example, allobj            /
   mod_epsmethod / example, con_obj, augm_obj /;

Parameter payoff(k,k) 'payoff tables entries';

Alias (k,kp);

option optCr = 0, limRow = 0, limCol = 0, solPrint = off, solveLink = %solveLink.LoadLibrary%;

* Generate payoff table applying lexicographic optimization
loop(kp,
   kk(kp) = yes;
   repeat
      solve mod_payoff using mip maximizing obj;
      payoff(kp,kk) = z.l(kk);
      z.fx(kk) = z.l(kk); // freeze the value of the last objective optimized
      kk(k++1) = kk(k);   // cycle through the objective functions
   until kk(kp);
   kk(kp) = no;
*  release the fixed values of the objective functions for the new iteration
   z.up(k) =  inf;
   z.lo(k) = -inf;
);
if(mod_payoff.modelStat <> %modelStat.optimal% and
   mod_payoff.modelStat <> %modelStat.integer Solution%,
   abort 'no optimal solution for mod_payoff';);

File fx / results.txt /;
put  fx ' PAYOFF TABLE'/;
loop(kp,
   loop(k, put payoff(kp,k):12:2;);
   put /;
);

minobj(k) = smin(kp,payoff(kp,k));
maxobj(k) = smax(kp,payoff(kp,k));

* gridpoints are calculated as the range (difference between max and min) of
* the 2nd objective function from the payoff table
$if not set gridpoints $set gridpoints 19
Set
   g         'grid points' / g0*g%gridpoints% /
   grid(k,g) 'grid';

Parameter
   gridrhs(k,g) 'RHS of eps-constraint at grid point'
   maxg(k)      'maximum point in grid for objective'
   posg(k)      'grid position of objective'
   firstOffMax  'some counters'
   lastZero     'some counters'
*  numk(k) 'ordinal value of k starting with 1'
   numg(g)      'ordinal value of g starting with 0'
   step(k)      'step of grid points in objective functions'
   jump(k)      'jumps in the grid points traversing';

lastZero = 1;
loop(km1,
   numk(km1) = lastZero;
   lastZero  = lastZero + 1;
);
numg(g) = ord(g) - 1;

grid(km1,g) = yes; // Here we could define different grid intervals for different objectives
maxg(km1)   = smax(grid(km1,g), numg(g));
step(km1)   = (maxobj(km1) - minobj(km1))/maxg(km1);
*step(k) = 1;
gridrhs(grid(km1,g))$(dir(km1) = -1) = maxobj(km1) - numg(g)/maxg(km1)*(maxobj(km1) - minobj(km1));
gridrhs(grid(km1,g))$(dir(km1) =  1) = minobj(km1) + numg(g)/maxg(km1)*(maxobj(km1) - minobj(km1));

put / ' Grid points' /;
loop(g,
   loop(km1, put gridrhs(km1,g):12:2;);
   put /;
);
put / 'Efficient solutions' /;

* Walk the grid points and take shortcuts if the model becomes infeasible or
* if the calculated slack variables are greater than the step size
posg(km1) = 0;
iter   = 0;
infeas = 0;
start  = jnow;

repeat
   rhs(km1) = sum(grid(km1,g)$(numg(g) = posg(km1)), gridrhs(km1,g));
   solve mod_epsmethod maximizing a_objval using mip;
   iter = iter + 1;
   if(mod_epsmethod.modelStat<>%modelStat.optimal% and
      mod_epsmethod.modelStat<>%modelStat.integer Solution%,
      infeas = infeas + 1; // not optimal is in this case infeasible
      put iter:5:0, '  infeasible' /;
      lastZero = 0;
      loop(km1$(posg(km1)  > 0 and lastZero = 0), lastZero = numk(km1));
      posg(km1)$(numk(km1) <= lastZero) = maxg(km1); // skip all solves for more demanding values of rhs(km1)
   else
      put iter:5:0;
      loop(k, put z.l(k):12:2;);
      jump(km1) = 1;
*     find the first off max (obj function that hasn't reach the final grid point).
*     If this obj.fun is k then assign jump for the 1..k-th objective functions
*     The jump is calculated for the innermost objective function (km=1)
      jump(km1)$(numk(km1) = 1) = 1 + floor(sl.L(km1)/step(km1));
      loop(km1$(jump(km1)  > 1), put '   jump';);
      put /;
      put ' ':5 'X' /
      loop((s,p,r,i,j)$(abs(X.l(s,p,r,i,j))>1e-6), put ' ':7 s.tl p.tl r.tl i.tl j.tl X.l(s,p,r,i,j) /);
      put ' ':5 'V' /
      loop((s,p,n)$(abs(V.l(s,p,n))>1e-6), put ' ':7 s.tl p.tl n.tl V.l(s,p,n) /);
   );
*  Proceed forward in the grid
   firstOffMax = 0;
   loop(km1$(posg(km1) < maxg(km1) and firstOffMax = 0),
      posg(km1)   = min((posg(km1) + jump(km1)),maxg(km1));
      firstOffMax = numk(km1);
   );
   posg(km1)$(numk(km1) < firstOffMax) = 0;
   abort$(iter > 1000) 'more than 1000 iterations, something seems to go wrong';
until sum(km1$(posg(km1) = maxg(km1)),1) = card(km1) and firstOffMax = 0;

finish = jnow;
elapsed_time = (finish - start)*60*60*24;

put /;
put 'Infeasibilities = ', infeas:5:0 /;
put 'Elapsed time: ',elapsed_time:10:2, ' seconds' /;