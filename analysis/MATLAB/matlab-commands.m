netCostMatrix = csvread('ncm.csv');

tic, script; toc

csvwrite('dist.csv',bb);
