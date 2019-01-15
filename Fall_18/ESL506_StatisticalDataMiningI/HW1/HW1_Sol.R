setwd('/Users/abhishekkumar/Documents/MS_UB/Fall_18/ESL506_StatisticalDataMiningI/HW1/student')
library(ggplot2)

d1=read.table("student-mat.csv",sep=";",header=TRUE)
d2=read.table("student-por.csv",sep=";",header=TRUE)
d3=merge(d1,d2, all = TRUE)
print(nrow(d3)) # 382 students

################################################################################################
## ***SCHOOL 
##Inference : Students at GP perform better in portuguese while perform similarly in Maths
################################################################################################

ggplot(d3, aes(x = school, y = G1.y))+ geom_boxplot()+ labs(title("Boxplot"), 
                                                            x = "School", y = "Grades in Portuguese")
ggplot(d3, aes(x = school, y = G1.x))+ geom_boxplot()+ labs(title("Boxplot"), x = "School", y = "Grades in Math")

################################################################################################
## SEX (can remove)
##Inference : Female students performed well in portuguese but not in maths
################################################################################################

ggplot(d3, aes(x = G1.x))+ geom_density(aes(colour = as.factor(d3$sex)))

ggplot(d3, aes(x = sex, y = G1.x))+ geom_boxplot()+ labs(title = "First Period Grade", x = "Sex", y = "Grades in Math")

ggplot(d3, aes(x = sex, y = G1.y))+ geom_boxplot()+ labs(title = "First Period Grade", x = "Sex", y = "Grades in Portuguese")

by(d3$G1, d3$sex, summary)


################################################################################################
## *AGE
##Inference : There are very few students whose age is >= 20 and seems to be outliers
################################################################################################

ggplot(aes(x = age, y = G1.x), data = d3) + geom_point()
ggplot(aes(x = age, y = G1.x), data = d3) + geom_point()

ggplot(d3, aes(x = age, y = G1.x))+ geom_boxplot(aes(colour = as.factor(age)),alpha = 0.5)
ggplot(d3, aes(x = age, y = G1.x))+ geom_boxplot(aes(colour = as.factor(age)),alpha = 0.5)

ggplot(d3, aes(x = age, color = school,fill = school)) + geom_histogram() + 
  scale_y_continuous(breaks = seq(0, 300, 50)) + scale_x_continuous(breaks = seq(0, 22, 1))
by(d3$G1.x, d3$age, summary)
by(d3$G1.x, d3$age, summary)
#--------------------------------------------------------------------------------------
#Defining a new subset with age < 19, Calculating only for G1
#Inference : Students with age 15,16 have good grades and low variance in Portuguese but
# in Maths age 16,17 seems to perform better

general_age_subgroup <- subset(d3, age <19)
ggplot(general_age_subgroup, aes(x = age, y = G1.x))+ geom_boxplot(aes(colour = as.factor(age)))
ggplot(general_age_subgroup, aes(x = G1.x))+ geom_density()+ facet_wrap(~age)

################################################################################################
## ***ADDRESS 
##Inference : Students in Urban Area perform better in both the subjects (boxplot)
################################################################################################

ggplot(d3, aes(x = G1.x))+ geom_density(aes(colour = as.factor(d3$address)))
ggplot(d3, aes(x = G1.y))+ geom_density(aes(colour = as.factor(d3$address)))
ggplot(d3, aes(x = address, y = G1.x))+ geom_boxplot(aes(colour = as.factor(address)),alpha = 0.5)
ggplot(d3, aes(x = address, y = G1.y))+ geom_boxplot(aes(colour = as.factor(address)),alpha = 0.5)

################################################################################################
## **FAMSIZE 
##Inference : The students with family size less than 3 has higher G1 mean(boxplot)
################################################################################################
ggplot(d3, aes(x = G1))+ geom_density(aes(colour = as.factor(famsize)))
ggplot(d3, aes(x =famsize, y = G3))+ geom_boxplot(aes(colour = as.factor(famsize)),alpha = 0.5)

################################################################################################
## PSTATUS
##Inference : It seems students whose parents are alone perform better in both the subjects
################################################################################################
ggplot(d3, aes(x = G1.x))+ geom_density(aes(colour = as.factor(Pstatus)))
ggplot(d3, aes(x = Pstatus, y = G1.x))+ geom_boxplot(aes(colour = as.factor(Pstatus)),alpha = 0.5)


################################################################################################
## MEDU 
##Inference : With density plot we don't see any info but boxplot gives an interesting
## inference; children with mothers having higher education have higher mean of G1 in
#maths but not so in Portuguese. In portuguese students with higher mother's edu performed better
################################################################################################
ggplot(d3, aes(x = G1.x))+ geom_density(aes(colour = as.factor(Medu)))
ggplot(d3, aes(x = Medu, y = G1.x))+ geom_boxplot(aes(colour = as.factor(Medu)),alpha = 0.5)

################################################################################################
## FEDU 
#Inference : There are very few students with fathers education 0 and seems to be an outlier
#In portuguese and maths students having higher father's education perform better
################################################################################################
ggplot(d3, aes(x = G1.x))+ geom_density(aes(colour = as.factor(Fedu)))
ggplot(d3, aes(x = Fedu, y = G1.x))+ geom_boxplot(aes(colour = as.factor(Fedu)),alpha = 0.5)

################################################################################################
## MJOB 
#Inference : Students whose mothers are working in service sector perform better in Maths than students
#whose mothers are at_home. while this difference is not very visible in Portuguese
################################################################################################
d3$Mjob <- factor(d3$Mjob,levels = c('at_home','other','services','teacher','health'),ordered = TRUE)
ggplot(d3, aes(x = Mjob, y = G1))+ geom_boxplot(aes(colour = as.factor(Mjob)),alpha = 0.5)


################################################################################################
## FJOB
#Inference : Students whose fathers are teachers tends to do exceptionally better than other 
#students in Maths. This is not very visible in Portuguese
################################################################################################
d3$Fjob <- factor(d3$Fjob,levels = c('at_home','other','services','teacher','health'),ordered = TRUE)
ggplot(d3, aes(x = Fjob, y = G1.x))+ geom_boxplot(aes(colour = as.factor(Fjob)),alpha = 0.5)


################################################################################################
## REASON
#Inference : We can clearly infer from the histogram that the reputation of school GP is quite
#good and most students have enrolled considering this. But the major factor for considering 
#the school is course in both the schools. In GP, its reputation as well as distance from home
#is also considered but in MS, it seems that students have only enrolled due to course and
#probably because they were not able to enroll into a school with better reputation.

################################################################################################
ggplot(d3, aes(x = reason))+ geom_histogram(stat = "count")+ facet_wrap(~school)
ggplot(d3, aes(x = reason, y = G1.x))+ geom_boxplot(aes(colour = as.factor(reason)),alpha = 0.5) + facet_wrap(~school)


################################################################################################
## ***GUARDIAN 
#Inference : From boxplot we can infer that students whose guardian are other than father 
#or mother struggle in both the subjects, predominantly more in Maths
################################################################################################

ggplot(d3, aes(x = G1.x))+ geom_density(aes(colour = as.factor(d3$guardian.x)))
ggplot(d3, aes(x = guardian.x, y = G1.x))+ geom_boxplot(alpha=0.2)


################################################################################################
## TRAVELTIME
#Inference : Students with traveltime > 30min seem to suffer more in Maths less in Portuguese
################################################################################################

ggplot(d3, aes(x = traveltime.x, y = G1.x))+ geom_boxplot(aes(colour = as.factor(traveltime.x)),alpha = 0.5)

################################################################################################
## STUDYTIME
#Inference : Students with studytime = 5-10 hours/week seem to do preety good(boxplot)
#When we look at the zoomed picture of histogram, we see that some students study less than 2 hours
#weekly and score good grades
################################################################################################
ggplot(d3, aes(x = studytime.x, y = G1.x))+ geom_boxplot(aes(colour = as.factor(studytime.x)),alpha = 0.5)
ggplot(d3, aes(x = G1.x, color = as.factor(studytime.x),fill = as.factor(studytime.x))) + geom_histogram()
ggplot(d3, aes(x = G1.x, color = as.factor(studytime.x),fill = as.factor(studytime.x))) + geom_histogram() + coord_cartesian(xlim=c(15, 20))

#----------------------------------------------------------------------------------------
#FINDING EINSTEINS <- Selecting students who study 2-5 hours per week and score G1>=18
einsteins.x <- subset(d3, studytime.x<=2)
einsteins.x <- subset(einsteins.x, G1.x>=18)
#We find 6 such students in Maths and two in Portuguese, and guess what! Either one of their parents is teacher or both of them!!
#Need to study more about students whose parents are teachers


einsteins.y <- subset(d3, studytime.y<=2)
einsteins.y <- subset(einsteins.y, G1.y>=18)

################################################################################################
## FAILURES
##Inference : As expected, people who never failed performed distinctly well in both the subjects
################################################################################################
ggplot(d3, aes(x = as.factor(failures.x), y = G1))+ geom_boxplot()


################################################################################################
## SCHOOLSUP
#Inference : Very few students took school support in Maths, almost 50, similar in portuguese,
#But those who took don't seem to perform better than those who took. 
################################################################################################
ggplot(d3, aes(x = schoolsup.x))+ geom_histogram(stat = "count") + scale_y_continuous(breaks = seq(0, 1000, 100))
ggplot(d3, aes(x = as.factor(schoolsup.x), y = G1.x))+ geom_boxplot()

#---------------------------------------------------------------------------------
#We made a new subset of students who have failed earlier and made a box plot to see the
#performance of the students who took schoolsup Vs those who didn't. 

failed_stud$x <- subset(d3, failures.x>0) 
ggplot(failed_stud, aes(x = as.factor(schoolsup.x), y = G1.x))+ geom_boxplot()
by(failed_stud$G1.x, failed_stud$schoolsup.x, summary) #check median

#We found that of 66 took Maths schoolsup and 34 postuguese schoolsup
#Most who took Maths performed better while in portuguese not visible improvement is seen


################################################################################################
## FAMSUP(can delete)
##Inference : More students took family support, close to 232 in Math and Portuguese. Overall they
#did similar to those who didn't take family suuport.
#Even when considering just failed students, it didn't matter if student took family support; both 
#performed even. In both the subjects.

ggplot(d3, aes(x = famsup.x))+ geom_histogram(stat = "count") + scale_y_continuous(breaks = seq(0, 1000, 100))
ggplot(d3, aes(x = as.factor(famsup.x), y = G1.x))+ geom_boxplot()
ggplot(failed_stud, aes(x = as.factor(famsup.x), y = G1.x))+ geom_boxplot()



################################################################################################
## PAID (can delete)
#Inference : 220 students took paid extra classes. But they performed same as those who didn't
#even among those who have failed earlier. Negative performance for students who have failed earlier
# in Maths and portugues .
#took school support

ggplot(d3, aes(x = paid.x))+ geom_histogram(stat = "count") + scale_y_continuous(breaks = seq(0, 1000, 100))
ggplot(d3, aes(x = as.factor(paid.x), y = G1.x))+ geom_boxplot()
ggplot(failed_stud, aes(x = as.factor(paid.x), y = G1.x))+ geom_boxplot()



################################################################################################
## ACTIVITIES
#Inference : Students who were involved in extra activities performed better in Portuguese but 
#this  

ggplot(d3, aes(x = activities.x))+ geom_histogram(stat = "count")
ggplot(d3, aes(x = as.factor(activities.x), y = G1.x))+ geom_boxplot()
ggplot(failed_stud, aes(x = as.factor(activities.x), y = G1.x))+ geom_boxplot()

################################################################################################
## **NURSERY
##Inference : Don't seem to make any difference
################################################################################################

ggplot(d3, aes(x = G3))+ geom_density(aes(colour = as.factor(d3$nursery)))
ggplot(d3, aes(x = as.factor(nursery), y = G1.x))+ geom_boxplot()
ggplot(d3, aes(x = as.factor(nursery), y = G1.y))+ geom_boxplot()

################################################################################################
## DALC
#Inference : Students who drink less on weekday perform better in Portuguese while no significant 
#difference in Maths
################################################################################################
d3$ddrinker <- ifelse(d3$Dalc > 3, 1, 0)
ggplot(d3, aes(x = d3$G3))+ geom_density(aes(colour = as.factor(d3$ddrinker)))


ggplot(d3, aes(x = as.factor(Dalc.y), y = G1.y))+ geom_boxplot()
ggplot(d3, aes(x = as.factor(Dalc.x), y = G1.x))+ geom_boxplot()
################################################################################################
## WALC
#Inference : Students who drink less on weekend perform better in Portuguese while no significant 
#difference in Maths
################################################################################################
d3$ddrinker <- ifelse(d3$Walc > 3, 1, 0)
ggplot(d3, aes(x = d3$G3))+ geom_density(aes(colour = as.factor(d3$ddrinker)))


ggplot(d3, aes(x = as.factor(Walc.y), y = G1.y))+ geom_boxplot()
ggplot(d3, aes(x = as.factor(Walc.x), y = G1.x))+ geom_boxplot()

################################################################################################
## HIGHER
#Inference : Remarkable difference in grades in both the subjects. Students who want to go for
#higher education has higher grades 
################################################################################################

ggplot(d3, aes(x = as.factor(higher.y), y = G1.y))+ geom_boxplot()
ggplot(d3, aes(x = as.factor(higher.x), y = G1.x))+ geom_boxplot()


################################################################################################
## GOOUT
#Inference : Remarkable difference in grades in both the subjects. Students who want to go for
#higher education has higher grades 
################################################################################################

ggplot(d3, aes(x = as.factor(goout.y), y = G1.y))+ geom_boxplot()
ggplot(d3, aes(x = as.factor(goout.x), y = G1.x))+ geom_boxplot()
################################################################################################
## INTERNET(can delete)
#Inference : 
################################################################################################


ggplot(d3, aes(x = as.factor(internet), y = G1.x))+ geom_boxplot()

################################################################################################
## HEALTH (can delete)
#Inference : Not a factor, irrelevant
################################################################################################

ggplot(d3, aes(x = as.factor(health.y), y = G1.y))+ geom_boxplot()


################################################################################################
## ROMANTIC (can delete, Not a factor)
#Inference : Students who drink less on weekday perform better in Portuguese while no significant 
#difference in Maths
################################################################################################


ggplot(d3, aes(x = as.factor(Dalc.x), y = G1.x))+ geom_boxplot()

################################################################################################
## FAMREL
#Inference : Didn't effect grades in Portuguese, but in maths students who reported worst 
#family relations suffered
################################################################################################

ggplot(d3, aes(x = as.factor(famrel.y), y = G1.y))+ geom_boxplot()
ggplot(d3, aes(x = as.factor(famrel.x), y = G1.x))+ geom_boxplot()

################################################################################################
## FREETIME
#Inference : can't find pattern in maths, didn't effect grades in Portuguese
################################################################################################

ggplot(aes(x = freetime.x, y = G1.x), data = d3) + geom_point(alpha= 0.1)
ggplot(aes(x = freetime.y, y = G1.y), data = d3) + geom_point(alpha= 0.1)

################################################################################################
## ABSENCES
#Inference : Students who drink less on weekday perform better in Portuguese while no significant 
#difference in Maths
################################################################################################
d3$absences_norm.x <- scale(d3[30:30])
#OR
ggplot(aes(x = G1.x, y = ((absences.x-min(absences.x)))/(max(absences.x)-min(absences.x))),
       data = d3) + geom_point()

ggplot(d3, aes(x = as.factor(Dalc.y), y = G1.y))+ geom_boxplot()
ggplot(d3, aes(x = as.factor(Dalc.x), y = G1.x))+ geom_boxplot()



############################################################################################
# Histogram for 1D plot
qplot(x = age, data = d3)
  #Faceting according to gender
qplot(x = G3, data = d3, binwidth = 2) + facet_wrap(~sex)
qplot(x = studytime, data = subset(d3, G3==10) , binwidth = 0.5, ylab = 'No of students with G3=10')
qplot(x = studytime, data = subset(d3, G3>=15) , binwidth = 0.5, ylab = 'No of students with G3>=15')
qplot(x = studytime, data = subset(d3, G3>=18) , binwidth = 0.5, ylab = 'No of students with G3>=18')
qplot(x = G3, data = d3, binwidth = 2) + scale_x_continuous(lim = c(0, 22),
                                                            breaks = seq(0, 20, 2)) + facet_wrap(~sex)
#Plot histogram for health vs grade
ggplot(aes(x = G1), data = d3, binwidth = 2) + geom_histogram() + facet_wrap(~health_grade)
ggplot(aes(x = G2), data = d3, binwidth = 1) + geom_histogram() + facet_wrap(~health_grade)
ggplot(aes(x = G3), data = d3) + geom_histogram() + facet_wrap(~health_grade)

ggplot(aes(x = G3), data = d3, binwidth = 1) + geom_density() + facet_wrap(~health_grade)
#
#
library(gridExtra)
x = qplot(x = studytime, data = subset(d3, G3<=9) , binwidth = 0.5, ylab = 'No of students with G3<=9')
y = qplot(x = studytime, data = subset(d3, G3>=15) , binwidth = 0.5, ylab = 'No of students with G3>=15')
grid.arrange(x , y, ncol=2)



# Making new column G1_Grade(0,1,2)
d3$G1_Grade <- ifelse(d3$G1 < 9, 0, 1)
d3$G1_Grade <- ifelse( d3$G1 >14 , d3$G1_Grade+1 , d3$G1_Grade)
qplot(x =G1_Grade, data = d3, binwidth = 0.5 )

# Making new column G2_Grade(0,1,2)
d3$G2_Grade <- ifelse(d3$G2 < 9, 0, 1)
d3$G2_Grade <- ifelse( d3$G2 >14 , d3$G2_Grade+1 , d3$G2_Grade)
qplot(x =G2_Grade, data = d3, xlab = 'Friend Count',
      ylab = 'Proportion of Users with that friend count', binwidth = 0.5 )

# Making new column G3_Grade(0,1,2)
d3$G3_Grade <- ifelse(d3$G3 < 9, 0, 1)
d3$G3_Grade <- ifelse( d3$G3 >14 , d3$G3_Grade+1 , d3$G3_Grade)
qplot(x =G3_Grade, data = d3, binwidth = 0.5 )


#
table(d3$sex)
table(d3$G3 ,d3$sex)
by(d3$G3_Grade, d3$sex, summary)


qplot(x = G3, data = d3, binwidth = 2, geom = 'freqpoly')
qplot(x = G3, data = d3, binwidth = 2, geom = 'freqpoly', xlab = 'G3 Grades',
      ylab = 'No of students with that Grade', color = sex)
qplot(x = G3, y = ..count.., data = d3, binwidth = 2, geom = 'freqpoly', color = sex)
qplot(x = G3, y = ..count../sum(..count..), data = d3, binwidth = 2, geom = 'freqpoly', color = sex)



#DENSITY PLOT
a <- ggplot(d3, aes(x = G3))
a + geom_density() + geom_vline(aes(xintercept = mean(G3)), linetype = "dashed", size = 0.6)
#DENSITY PLOT WITH COUNT
a + geom_density(aes(y = ..count..), fill = "lightgray") +
  +     geom_vline(aes(xintercept = mean(G3)), linetype = "dashed", size = 0.6, color = "#FC4E07")


#FREQUENCY POLYGON
a <- ggplot(d3, aes(x = G3))
a + geom_freqpoly(binwidth = 1)

#BOXPLOT(Check boxplot for health Vs G3), inference : health not a factor for failure
a <- ggplot(d3, aes(x = sex, y = G3))
a + geom_boxplot() 
a + geom_boxplot() + coord_cartesian(ylim = c(5, 15))

#scatterplot
#forms a positive incline with studytime implying that students could improve grades by 
#studying more hours but its still very difficult to get very good grades.
ggplot(aes(x = G3, y = studytime), data = d3) + geom_point()
ggplot(aes(x = studytime, y = G3), data = d3) + geom_point(alpha= 0.05)

#Getting outliers in this
ggplot(aes(x = G1, y = G2), data = d3) + geom_point(aes(colour = as.factor(paid)), alpha = 0.1)
ggsave("healthVsG3_scatterplot.png")


