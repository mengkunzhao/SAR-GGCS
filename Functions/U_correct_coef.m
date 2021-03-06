function c = U_correct_coef(p,q,N_mean)
% p = 5;
% q = 10;
% N_mean = 100;
beta = N_mean.*(q-1)./p;
lam1 = betarnd(p,q,1,10000);
lam1 = lam1./(1-lam1);
N_mean1 = beta.*lam1;
lam2 = betarnd(p,q,1,10000);
lam2 = lam2./(1-lam2);
N_mean2 = beta.*lam2;
N_mean_mean = mean([N_mean1 N_mean2]);
N_mean_min = min([N_mean1;N_mean2]);
N_mean_min_mean = mean(N_mean_min);
N1 = poissrnd(N_mean1,1,10000);
N2 = poissrnd(N_mean1,1,10000);
N_mean0 = mean([N1 N2]);
Nmin = min([N1;N2]);
Nmin_mean = mean(Nmin);
c = Nmin_mean*N_mean_min_mean/N_mean0/N_mean_mean;
% fprintf('To correct : y = y/a and the corrected coefficient a = 1/c  is %.4f \n',1/c);
