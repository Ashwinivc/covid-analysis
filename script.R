rm(list = ls()) # remove all variables stored previously
library(Hmisc) # import



data  <- read.csv("C:/Users/ashwi/Desktop/covid analysis R project/COVID19_line_list_data.csv")

describe(data)   # Hmisc command

#cleaned up death column
data$death_dummy <- as.integer(data$death != 0)

# death rate
sum(data$death_dummy)/nrow(data)

#age (According to media older people dies of COvid )

dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy == 0)

mean(dead$age ,na.rm = TRUE)
mean(alive$age ,na.rm = TRUE)

#is this statistically significant?

t.test(alive$age, dead$age , alternative = "two.sided" ,conf.level = 0.99)
# normally if p value < 0.05 , we reject null hypothesis
#here p_value ~ 0 , we reject the null hypothesis
#conclude that this is statistically significant

#Gender
#claim: Gender has no effect

Men = subset(data, gender == "male")
Women = subset(data, gender == "female")

mean(Men$death_dummy,na.rm = TRUE)
mean(Women$death_dummy ,na.rm = TRUE)

# is this statistically significant?

t.test(Men$death_dummy, Women$death_dummy , alternative = "two.sided" ,conf.level = 0.99)
# 99% confidence : men have fatality rate ranging from 0.7 % to 8.8%
#p- value = 0.002 <0.05 , so this is statistically significant.



