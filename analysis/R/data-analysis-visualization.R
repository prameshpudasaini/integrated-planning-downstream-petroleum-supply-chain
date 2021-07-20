rm(list=ls())

# read POS data
pos <- read.csv(file.choose(), header=T)

dim(pos)
names(pos)
summary(pos)

pdf("pos_plot1.pdf")
par(mfrow=c(1,1), mai=c(0.7,0.7,0.1,0.1), mgp=c(2,0.5,0))
plot(pos$tcost/1e6, pos$plcost/1e6,
     xlab="Transportation cost (million Rs.)", ylab="Product loss cost (million Rs.)",
     cex.axis=0.9, cex.lab=1, pch=19, cex=1.2)
with(subset(pos, solution=="POS1"), text(tcost/1e6, plcost/1e6, solution, cex= 0.8, pos=4))
with(subset(pos, solution=="POS20"), text(tcost/1e6, plcost/1e6, solution, cex= 0.8, pos=2))
with(subset(pos, solution=="POS5"), text(tcost/1e6, plcost/1e6, solution, cex= 0.8, pos=4))
with(subset(pos, solution=="POS11"), text(tcost/1e6, plcost/1e6, solution, cex= 0.8, pos=4))
with(subset(pos, solution=="POS17"), text(tcost/1e6, plcost/1e6, solution, cex= 0.8, pos=3))
dev.off()

######################################################################
######################################################################
######################################################################

posdmt <- read.csv(file.choose(), header=T)
posdmpl <- read.csv(file.choose(), header=T)

pdf("cum_prob.pdf")
par(mfrow=c(2,1), mai=c(0.7,0.7,0.3,0.1), mgp=c(2,0.5,0))
plot(posdmt$tcost/1e6, posdmt$cumprobt,
     main="a) Z1 minimization solutions for POS5",
     xlab="Transportation cost (million Rs.)", ylab="Probability",
     cex.axis=0.9, cex.main=1, font.main=2, cex.lab=0.9, pch=18, cex=2, las=1)
grid()
lines(posdmt$tcost/1e6, posdmt$cumprobt, lty=3, lwd=3)
abline(v=251363620/1e6, col=2, lwd=2)
text(251363620/1e6, 0.015, labels=expression("Z"[1]^POS5), pos=4, cex=0.9, font=2)
abline(v=242931980/1e6, col=4, lwd=2)
text(242931980/1e6, 0.015, labels=expression("Z"[1]^min), pos=4, cex=0.9, font=2)
with(subset(posdmt, scenario=="s1"), text(tcost/1e6, cumprobt, scenario, cex= 0.8, pos=1))
with(subset(posdmt, scenario=="s2"), text(tcost/1e6, cumprobt, scenario, cex= 0.8, pos=1))
with(subset(posdmt, scenario=="s3"), text(tcost/1e6, cumprobt, scenario, cex= 0.8, pos=1))
with(subset(posdmt, scenario=="s4"), text(tcost/1e6, cumprobt, scenario, cex= 0.8, pos=2))
with(subset(posdmt, scenario=="s5"), text(tcost/1e6, cumprobt, scenario, cex= 0.8, pos=2))
with(subset(posdmt, scenario=="s6"), text(tcost/1e6, cumprobt, scenario, cex= 0.8, pos=1))
with(subset(posdmt, scenario=="s7"), text(tcost/1e6, cumprobt, scenario, cex= 0.8, pos=2))
with(subset(posdmt, scenario=="s8"), text(tcost/1e6, cumprobt, scenario, cex= 0.8, pos=3))
with(subset(posdmt, scenario=="s9"), text(tcost/1e6, cumprobt, scenario, cex= 0.8, pos=3))
plot(posdmpl$plcost/1e6, posdmpl$cumprobpl,
     main="b) Z2 minimization solutions for POS5",
     xlab="Product loss cost (million Rs.)", ylab="Probability",
     cex.axis=0.9, cex.main=1, font.main=2, cex.lab=0.9, pch=18, cex=2, las=1)
grid()
lines(posdmpl$plcost/1e6, posdmpl$cumprobpl, lty=3, lwd=3)
abline(v=27751729/1e6, col=2, lwd=2)
text(27751729/1e6, 0.015, labels=expression("Z"[2]^POS5), pos=4, cex=0.9, font=2)
with(subset(posdmpl, scenario=="s1"), text(plcost/1e6, cumprobpl, scenario, cex= 0.8, pos=1))
with(subset(posdmpl, scenario=="s2"), text(plcost/1e6, cumprobpl, scenario, cex= 0.8, pos=1))
with(subset(posdmpl, scenario=="s3"), text(plcost/1e6, cumprobpl, scenario, cex= 0.8, pos=1))
with(subset(posdmpl, scenario=="s4"), text(plcost/1e6, cumprobpl, scenario, cex= 0.8, pos=2))
with(subset(posdmpl, scenario=="s5"), text(plcost/1e6, cumprobpl, scenario, cex= 0.8, pos=2))
with(subset(posdmpl, scenario=="s6"), text(plcost/1e6, cumprobpl, scenario, cex= 0.8, pos=3))
with(subset(posdmpl, scenario=="s7"), text(plcost/1e6, cumprobpl, scenario, cex= 0.8, pos=4))
with(subset(posdmpl, scenario=="s8"), text(plcost/1e6, cumprobpl, scenario, cex= 0.8, pos=1))
with(subset(posdmpl, scenario=="s9"), text(plcost/1e6, cumprobpl, scenario, cex= 0.8, pos=3))
dev.off()

######################################################################
######################################################################
######################################################################

scdie <- read.csv(file.choose(), header=T)
scpet <- read.csv(file.choose(), header=T)
names(scdie)

pdf("storage_prob.pdf")
par(mfrow=c(2,1), mai=c(0.7,0.6,0.3,0.1), mgp=c(2,0.5,0))
plot(scdie$v/1e3, scdie$cumprob,
     main="a) Additional storage capacities of diesel for POS5",
     xlab="Storage Capacity (KL)", ylab="Probability",
     cex.axis=0.9, cex.main=1, font.main=2, cex.lab=0.9, pch=18, cex=2, las=1)
grid()
lines(scdie$v/1e3, scdie$cumprob, lty=3, lwd=3)
abline(v=185270/1e3, col=2, lwd=2)
with(subset(scdie, scenario=="s1"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=3))
with(subset(scdie, scenario=="s2"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=1))
with(subset(scdie, scenario=="s3"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=1))
with(subset(scdie, scenario=="s4"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=2))
with(subset(scdie, scenario=="s5"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=2))
with(subset(scdie, scenario=="s6"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=2))
with(subset(scdie, scenario=="s7"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=2))
with(subset(scdie, scenario=="s8"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=4))
with(subset(scdie, scenario=="s9"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=1))
plot(scpet$v/1e3, scpet$cumprob,
     main="b) Additional storage capacities of petrol for POS5",
     xlab="Storage Capacity (KL)", ylab="Probability",
     cex.axis=0.9, cex.main=1, font.main=2, cex.lab=0.9, pch=18, cex=2, las=1)
grid()
lines(scpet$v/1e3, scpet$cumprob, lty=3, lwd=3)
abline(v=55570/1e3, col=2, lwd=2)
with(subset(scpet, scenario=="s1"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=1))
with(subset(scpet, scenario=="s2"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=1))
with(subset(scpet, scenario=="s3"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=4))
with(subset(scpet, scenario=="s4"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=2))
with(subset(scpet, scenario=="s5"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=2))
with(subset(scpet, scenario=="s6"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=1))
with(subset(scpet, scenario=="s7"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=3))
with(subset(scpet, scenario=="s8"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=3))
with(subset(scpet, scenario=="s9"), text(v/1e3, cumprob, scenario, cex= 0.8, pos=3))
dev.off()

185270 
55570

summary(scdie$v)
summary(scpet$v)

######################################################################
######################################################################
######################################################################

vdata <- read.csv(file.choose(), header=T)

dim(vdata)
names(vdata)
summary(vdata)
class(vdata$to)
summary(vdata$to)

tapply(vdata$V, list(vdata$solution, vdata$scenario, vdata$product, vdata$to), 
       max)
tapply(vdata$V, list(vdata$solution, vdata$scenario, vdata$product, vdata$to), 
       min)
max(vdata$V[vdata$solution=="POS1" & vdata$scenario=="s3" & vdata$to=="Brt" 
             & vdata$product=="die"])
tapply(vdata$V, list(vdata$scenario, vdata$product, vdata$to), min)

# Box plot of Storage capacity for POS1, POS17, and POS 20 under scenario 1 (most optimistic)
par(mfrow=c(1,3))
boxplot(vdata$V[vdata$solution=="POS1" & vdata$scenario=="s1"]~vdata$to[vdata$solution=="POS1" & vdata$scenario=="s1"], 
        cex.axis=0.9, las=3, xlab="Distribution centers", 
        ylab="Storage capacity (POS1,s1)")
boxplot(vdata$V[vdata$solution=="POS17" & vdata$scenario=="s1"]~vdata$to[vdata$solution=="POS17" & vdata$scenario=="s1"], 
        cex.axis=0.9, las=3, xlab="Distribution centers", 
        ylab="Storage capacity (POS17,s1)")
boxplot(vdata$V[vdata$solution=="POS20" & vdata$scenario=="s1"]~vdata$to[vdata$solution=="POS20" & vdata$scenario=="s1"], 
        cex.axis=0.9, las=3, xlab="Distribution centers", 
        ylab="Storage capacity (POS20,s1)")


# plot in 3 x 2 matrix
pdf("pos_plot3x2.pdf")
par(mfrow=c(3,2))
boxplot(1/1000*vdata$V[vdata$product=="die" 
                & vdata$solution=="POS1"]~vdata$to[vdata$product=="die" 
                                                   & vdata$solution=="POS1"], 
        main="POS1 & die", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="pet" 
                & vdata$solution=="POS1"]~vdata$to[vdata$product=="pet" 
                                                   & vdata$solution=="POS1"], 
        main="POS1 & pet", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)

boxplot(1/1000*vdata$V[vdata$product=="die" 
                       & vdata$solution=="POS20"]~vdata$to[vdata$product=="die" 
                                                          & vdata$solution=="POS20"], 
        main="POS20 & die", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="pet" 
                & vdata$solution=="POS20"]~vdata$to[vdata$product=="pet" 
                                                   & vdata$solution=="POS20"], 
        main="POS20 & pet", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)

boxplot(1/1000*vdata$V[vdata$product=="die" 
                       & vdata$solution=="POS17"]~vdata$to[vdata$product=="die" 
                                                           & vdata$solution=="POS17"], 
        main="POS17 & die", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="pet" 
                       & vdata$solution=="POS17"]~vdata$to[vdata$product=="pet" 
                                                           & vdata$solution=="POS17"], 
        main="POS17 & pet", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
dev.off()


# plot in 2 x 3 matrix
pdf("pos_plot2x3.pdf")
par(mfrow=c(2,3))
boxplot(1/1000*vdata$V[vdata$product=="die" 
                       & vdata$solution=="POS1"]~vdata$to[vdata$product=="die" 
                                                          & vdata$solution=="POS1"], 
        main="POS1 & die", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="die" 
                       & vdata$solution=="POS20"]~vdata$to[vdata$product=="die" 
                                                           & vdata$solution=="POS20"], 
        main="POS20 & die", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="die" 
                       & vdata$solution=="POS17"]~vdata$to[vdata$product=="die" 
                                                           & vdata$solution=="POS17"], 
        main="POS17 & die", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)

boxplot(1/1000*vdata$V[vdata$product=="pet" 
                       & vdata$solution=="POS1"]~vdata$to[vdata$product=="pet" 
                                                          & vdata$solution=="POS1"], 
        main="POS1 & pet", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="pet" 
                       & vdata$solution=="POS20"]~vdata$to[vdata$product=="pet" 
                                                           & vdata$solution=="POS20"], 
        main="POS20 & pet", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="pet" 
                       & vdata$solution=="POS17"]~vdata$to[vdata$product=="pet" 
                                                           & vdata$solution=="POS17"], 
        main="POS17 & pet", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
dev.off()


# subsetting data for POS 17
v1 <- subset(vdata, solution=="POS1")
v20 <- subset(vdata, solution=="POS20")
v17 <- subset(vdata, solution=="POS17")
# row bind the subsetted data
vsub <- rbind(v1, v20, v17)
View(vsub)
dim(vsub)
names(vsub)
levels(vsub$solution) # displays all POS levels
# apply factor() to variable again after subsetting
vsub$solution <- factor(vsub$solution)
levels(vsub$solution) # displays only desired POS levels
# individual box plot view
par(mfrow=c(1,1))
boxplot(1/1000*vsub$V[vsub$product=="die"]~vsub$to[vsub$product=="die"]*vsub$solution[vsub$product=="die"],
        las=3, cex.axis=0.9)
boxplot(1/1000*vsub$V[vsub$product=="die"]~vsub$solution[vsub$product=="die"]*vsub$to[vsub$product=="die"],
        las=3, cex.axis=0.9)
# paired box plot view
pdf("v_boxplot.pdf")
par(mfrow=c(2,1))
boxplot(1/1000*vsub$V[vsub$product=="die"]~vsub$solution[vsub$product=="die"]*vsub$to[vsub$product=="die"],
        main="POS1, POS17 & POS20 for diesel", xlab="",
        ylab="Storage capacity (ML)",
        las=3, cex.axis=0.7, font.main=1, cex.main=0.9, axes=T, outcex=0.5)
boxplot(1/1000*vsub$V[vsub$product=="pet"]~vsub$solution[vsub$product=="pet"]*vsub$to[vsub$product=="pet"],
        main="POS1, POS17 & POS20 for petrol", xlab="",
        ylab="Storage capacity (ML)",
        las=3, cex.axis=0.7, font.main=1, cex.main=0.9, axes=T, outcex=0.5)
dev.off()


# subsetting data for POS5
v1 <- subset(vdata, solution=="POS1")
v20 <- subset(vdata, solution=="POS20")
v5 <- subset(vdata, solution=="POS5")
# row bind the subsetted data
vsub5 <- rbind(v1, v20, v5)
levels(vsub5$solution) # displays all POS levels
# apply factor() to variable again after subsetting
vsub5$solution <- factor(vsub5$solution)
levels(vsub5$solution) # displays only desired POS levels
pdf("v_boxplot.pdf")
par(mfrow=c(2,1))
boxplot(1/1000*vsub5$V[vsub5$product=="die"]~vsub5$solution[vsub5$product=="die"]*vsub5$to[vsub5$product=="die"],
        main="POS1, POS17 & POS20 for diesel", xlab="",
        ylab="Storage capacity (ML)",
        las=3, cex.axis=0.7, font.main=1, cex.main=0.9, axes=T, outcex=0.5)
boxplot(1/1000*vsub5$V[vsub5$product=="pet"]~vsub5$solution[vsub5$product=="pet"]*vsub5$to[vsub5$product=="pet"],
        main="POS1, POS17 & POS20 for petrol", xlab="",
        ylab="Storage capacity (ML)",
        las=3, cex.axis=0.7, font.main=1, cex.main=0.9, axes=T, outcex=0.5)
dev.off()


# POS5 and 2x3 plot
pdf("storage_capacities.pdf")
par(mfrow=c(2,3), mai=c(0.4,0.4,0.25,0.1), mgp=c(2,0.5,0))
boxplot(1/1000*vdata$V[vdata$product=="die" 
                       & vdata$solution=="POS1"]~vdata$to[vdata$product=="die" 
                                                          & vdata$solution=="POS1"], 
        main="POS1 & die", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="die" 
                       & vdata$solution=="POS20"]~vdata$to[vdata$product=="die" 
                                                           & vdata$solution=="POS20"], 
        main="POS20 & die", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="die" 
                       & vdata$solution=="POS5"]~vdata$to[vdata$product=="die" 
                                                           & vdata$solution=="POS5"], 
        main="POS15 & die", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)

boxplot(1/1000*vdata$V[vdata$product=="pet" 
                       & vdata$solution=="POS1"]~vdata$to[vdata$product=="pet" 
                                                          & vdata$solution=="POS1"], 
        main="POS1 & pet", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="pet" 
                       & vdata$solution=="POS20"]~vdata$to[vdata$product=="pet" 
                                                           & vdata$solution=="POS20"], 
        main="POS20 & pet", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
boxplot(1/1000*vdata$V[vdata$product=="pet" 
                       & vdata$solution=="POS5"]~vdata$to[vdata$product=="pet" 
                                                           & vdata$solution=="POS5"], 
        main="POS5 & pet", xlab="Distribution centers", ylab="Storage capacity (ML)", 
        las=3, cex.axis=0.9, font.main=1, cex.main=1, axes=T, outpch=16)
dev.off()


######################################################################
######################################################################
######################################################################

xdata <- read.csv(file.choose(), header=T)
summary(xdata$from)
summary(xdata$to)
