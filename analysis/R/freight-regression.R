##################################################
## Regression Models for Freight Rate - 83 Data ##
##################################################

rm(list=ls())
cat("\f")

dataA <- read.table(file.choose(), header=T, sep="\t")
attach(dataA)

dim(dataA)
names(dataA)
summary(dataA)

par(mfrow=c(1,2))
plot(KM[Route=="external"], Cost[Route=="external"], main="Freight Rate vs Distance",
     sub="Route", xlab="Distance (km)", ylab="Freight Rate (NRs)", col=2)
points(KM[Route=="internal"], Cost[Route=="internal"], col=4)
plot(KM[Terrain=="plain"], Cost[Terrain=="plain"], main="Freight Rate vs Distance",
     sub="Terrain", xlab="Distance (km)", ylab="Freight Rate (NRs)", col=2)
points(KM[Terrain=="hill"], Cost[Terrain=="hill"], col=4)

boxplot(KM~Route)
boxplot(KM~Terrain)

par(mfrow=c(2,2))

ma1 <- lm(Cost ~ KM + Route + Terrain)
summary(ma1) # Rsq = 0.982; RSE = 186.8; all coefficients significant
plot(ma1)

ma2 <- lm(Cost ~ KM + Route)
summary(ma2) # Rsq = 0.9796; RSE = 197.9; all coefficients significant
plot(ma2)
anova(ma2, ma1) # accept Ho

ma3 <- lm(Cost ~ KM + Terrain)
summary(ma3) # Rsq = 0.9755; RSE = 344.1; all coefficients not significant
plot(ma3)
anova(ma3, ma1) # reject Ho

ma4 <- lm(Cost ~ KM)
summary(ma4) # Rsq = 0.973; RSE = 226.3; all coefficients highly significant
plot(ma4)
anova(ma4, ma1) # reject Ho
anova(ma4,)

ma5 <- lm(Cost ~ KM + I(sqrt(KM)))
summary(ma5) # Rsq = 0.973; RSE = 226.3; all coefficients highly significant
plot(ma5)
anova(ma4, ma1) # reject Ho
