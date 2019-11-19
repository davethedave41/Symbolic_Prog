combine1([],[],X).
combine1([Ha|Ta],[Hb|Tb],[Ha|[Hb,X]) :- combine1(Ta,Tb,X).