RealMadrid <- c( "Cristiano","Benzoma", "James", "Bale")
realmadrid <- c("Ramos", "Navas", "Marcelo", "Carbajal")
RealMadrid <- c( "Cristiano","Benzoma", "James", "Bale");realmadrid <- c("Ramos", "Navas", "Marcelo", "Carbajal")
RealMadrid <- RealMadrid[RealMadrid != "James"]
RealMadrid <- c(RealMadrid, "Asencio")
RealMadriNames <- RealMadrid
RealMadridAges <- c(32,29,28,21)
RealMadrid <- data.frame(Name = RealMadriNames, Age = RealMadridAges)
RealMadrid$Height <- c(1.85,1.87,1.89,1.89)
names(RealMadrid)
dummy <- names(RealMadrid)
dummy[1]
RealMadrid$Birthday <- as.Date(c("1985-05-02","1987-12-19","1989-07-16","1996-01-21"))
RealMadrid$LeagueGoals <- c(41,15,15,3)

RealMadrid$CupGoals <- c(6,6,6,3)

RealMadrid$ChampionsGoal <- c(7,5,1,3)

RealMadrid$TotalGoals <- RealMadrid$LeagueGoals + RealMadrid$CupGoals + RealMadrid$ChampionsGoal

summary(RealMadrid$TotalGoals)

boxplot(RealMadrid$TotalGoals)

mean(RealMadrid$TotalGoals)

sd(RealMadrid$ChampionsGoal)

attach(RealMadrid)
summary(TotalGoals)

o <- summary(TotalGoals)

o[1]
