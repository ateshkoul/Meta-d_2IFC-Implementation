
# anova with frontale
meta_d_frontal <- read.table(file = "clipboard", sep = "\t", header=FALSE)
View(meta_d_frontal)
library('reshape2')
meta_d_frontal_long_frmt <- melt(meta_d_frontal, id.vars = c("V1","V10"))
meta_d_frontal_long_frmt$V1 <- factor(meta_d_frontal_long_frmt$V1)
meta_d_frontal_long_frmt$variable <- factor(meta_d_frontal_long_frmt$variable)
fit <- aov(value~variable+Error(V1/(variable)),data=meta_d_frontal_long_frmt)
summary(fit)

# meta-d' frontale vs laterale two way repeated measures anova
# also applicable for all ratio/diff calculations

meta_d_frontal <- read.table(file = "clipboard", sep = "\t", header=FALSE)
meta_d_frontal_long_frmt <- melt(meta_d_frontal, id.vars = c("V1","V6"))
meta_d_frontal_long_frmt$V1 <- factor(meta_d_frontal_long_frmt$V1)
meta_d_frontal_long_frmt$variable <- factor(meta_d_frontal_long_frmt$variable)
meta_d_frontal_long_frmt$V6 <- factor(meta_d_frontal_long_frmt$V6)
fit <- aov(value~V10*variable+Error(V1/(V10*variable)),data=meta_d_frontal_long_frmt)
summary(fit)


require(nlme)         ## for lme()
require(multcomp)  ## for multiple comparison stuff
Lme.mod <- lme(value~V6 + variable,data=meta_d_frontal_long_frmt, random = ~1 | V1/(V6))
anova(fitlme <- lme(value~V6*variable, random=list(V1=pdBlocked(list(~1, pdIdent(~V6-1), pdIdent(~variable-1)))),  method="ML", data=meta_d_frontal_long_frmt))

anova(fitlme <- lme(value~V10*variable, random=list(V1=pdBlocked(list(~1, pdCompSymm(~V10-1), pdCompSymm(~variable-1)))),  method="ML", data=meta_d_frontal_long_frmt))


anova(fitlme <- lme(value ~ V10*variable, random=list(V1=pdBlocked(list(~1, pdIdent(~V10-1), pdIdent(~variable-1)))),
          method="ML", data=meta_d_frontal_long_frmt))


posthoc <- glht(fitlme, linfct = mcp(variable = "Tukey"))
summary(posthoc)





