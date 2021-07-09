# create vector
x <- c(3.5, 1.3, 6.6, 1.3, 1, .6)
# get mean and sd
c(round(mean(x), 2), round(sd(x), 2))
# create standardized distance for each observation
standardized.x <- (x - mean(x))/sd(x)
# view vector of standardized values
round(standardized.x, 2)

# create and view components of regression lines
# we have two variables X and Y
X <- runif(100, -10, 10)
Y <- 0.8 + (2/5)*X
# plot relationship (with a line)
plot(X, Y, type="l", xlim = c(-10, 10), ylim = c(-5,5))
pdf("regressionExample.pdf")
par(mar=c(5,5,1,1))
plot(X, Y, type="l", xlim = c(-10, 10), ylim = c(-5,5), cex.axis=1.5, cex.lab=2)
segments(3, 2, 8, 2, col="red", lwd=2)
segments(8, 2, 8, 4, col="red", lwd=2)
mtext(text="Y-intercept = 0.8",side = 1, line=-4, col="red", cex=2)
mtext(text="Slope = 0.4",side = 3, line=-7, col="red", cex=2)
segments(-20, my.pred, 1.2, my.pred, col="red", lwd=2, lty=2)
dev.off()

# bivariate regression by hand
regressMat <- as.data.frame(matrix(c(3.8, 3.5, 3.0, 3.3, 3.5, 4.0, 2.8, 2.3, 2.4, 1.8, 2.7, 2.7), nrow=6, byrow = T))
colnames(regressMat) <- c("X", "Y")  
sum(regressMat$Y)
sum(regressMat$X)
mean(regressMat$Y)
mean(regressMat$X)
sum((regressMat$Y -
       mean(regressMat$Y))
    *(regressMat$X-
        mean(regressMat$X)))
sum((regressMat$X-
       mean(regressMat$X))^2)
# check regression
lm(Y~X, data=regressMat)