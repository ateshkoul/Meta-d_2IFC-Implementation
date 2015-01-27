# Figure for Anova for meta-d files from meta_d_obs


# ----------------------------
#  Author : Atesh Koul
# Italian Institute of technology, Genoa
# ----------------------------


Data_meta_d <- read.table(file = "clipboard",sep='\t',header = FALSE)
front_meta_d <- colMeans(Data_meta_d[,seq(1,8)])
lat_meta_d <- colMeans(Data_meta_d[,seq(9,16)])
plot(x=seq(10,80,10),front_meta_d,type = 'l',ylab="Meta d'", xlab = "Time (in % of movement)",col="red",ylim=c(0,4))
lines(x=seq(10,80,10),lat_meta_d,col="blue")
legend(65,2.5,legend =c("Frontal","Lateral"), col=c("red","blue"), lwd=1, lty=c(1,1), merge=FALSE )
