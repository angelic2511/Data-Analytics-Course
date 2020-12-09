setwd("/Users/angel/Desktop/SPRING 2020/IE 4399F - DATA ANALYTICS")

# INPUT AND PREPARE CEREALS DATA
cereal <- read.csv("cereals.csv",
                   stringsAsFactors = TRUE,
                   header=TRUE)

# identify records with missing Sugar Values
# if output is integer(0), there are no records with empty values
which(is.na(cereal$sugars))
# if output is greater than zero, remove empty records
# For instance, assume record 58 has missing Sugar value
# therefore run the function cereal <- cereal[-58,]
# Extract rating, sugar conten and fiber content from dataset
dat <- data.frame(Rating = cereal$rating,
                  Sugars = cereal$sugars,
                  Fiber = cereal$fiber)

# THREE-VARIABLE SCATTERPLOT
install.packages("scatterplot3d")
library(scatterplot3d)

# Color by Rating
rg <- colorRampPalette(c("red","green"))(length(cereal$fiber))
sp <- scatterplot3d(z=sort(cereal$rating),
                    y=cereal$sugars,
                    x=cereal$fiber,
                    color=rg,
                    pch=16,
                    xlab="Fiber",
                    ylab="Sugars",
                    zlab="Rating",
                    main="3D Scatterplot")

