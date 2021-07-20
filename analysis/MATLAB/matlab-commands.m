format bank

netCostMatrix = csvread('ncm183.csv');

tic, script_1; toc

csvwrite('del183_1.csv',bb);

sum(bb,'all')/2