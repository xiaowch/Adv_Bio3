#####################################
######Test on Bootstrap Medians######
######Author: N HU, Ph.D ############
######Date: Oct 6, 2022 #############
#####################################
set.seed(1149)
nsims<- 2000
ndraws<- 200

fev1<- read.csv('C:/Users/nhu/OneDrive - Florida International University/PHC_Avd_Bio3/fev1.csv', header=T)
fev1[1:11,]

T_Y1<- subset(fev1, T == 1)$Y1
T_Y0<- subset(fev1, T == 1)$Y0

T_Y1; T_Y0

Y1_boot_median<- rep(NA, nsims)
Y0_boot_median<- rep(NA, nsims)


for (i in 1:nsims){
Y1_boot<- sample(T_Y1, ndraws, replace=T)
Y0_boot<- sample(T_Y0, ndraws, replace=T)
Y1_boot_median[i]<- median(Y1_boot)
Y0_boot_median[i]<- median(Y0_boot)
}

hist(Y1_boot_median)
hist(Y0_boot_median)

ttest(Y1_boot_median, Y0_boot_median)

density(Y1_boot_median)
density(Y0_boot_median)




