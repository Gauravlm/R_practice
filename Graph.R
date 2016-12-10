# Bar plot
#simple bar plot
library(vcd)
counts<- table(Arthritis$Improved)
barplot(counts,
        main="simple bar plot",
        xlab="Improvment",ylab="Frequency"
)
barplot( counts,
         main="simple bar plot",
         ylab="Improvment",xlab="frequency",
         horiz=TRUE    # plot horizontal graph
)
#plot same graph using plot function
plot(Arthritis$Improved,main="Simple bar plot",
     xlab= "Improvment",ylab="Frequency")
#horizontal graph
plot(Arthritis$Improved,horiz=TRUE,main="Simple bar plot",
     ylab= "Improvment",xlab="Frequency")

#stack and group bar plot----------------------------------------
#beside =TRUE then each column of the matrix produces a bar in the plot,
#        with the values in the column giving the heights of stacked "sub-bars."
#beside= each column of the matrix represents a group, and the
#        values in each column are juxtaposed rather than stacked
counts<- table(Arthritis$Improved,Arthritis$Treatment)
counts

#plotinig stack bar plot
barplot(counts,
        main="stack bar plot",
        xlab="Treatment",ylab= "Frequency",
        col=c("red","yellow","green"),
        legend=rownames(counts)
)

# plotting group bar plot
barplot(counts,
        main="Group bar plot",
        xlab="Treament",ylab = "Frequency",
        col=c("red","yellow","green"),
        legend=rownames(counts),
        beside = TRUE
)
#col: option to add color to the bars plotted.
# legend.text: parameter provides bar labels for the legend (which are only useful
#             when height is a matrix)


#Bar plot for sorted mean value
state<- data.frame(state.region,state.x77)
mean<- aggregate(state$Illiteracy,by=list(state.region),FUN=mean)  # mean is vecoter here
mean<- mean[order(mean$x),]
barplot(mean$x,names.arg=mean$Group.1)
title("Mean Illiteracy Rate")


#Spinograms ---------------------------------------------
#In a spinogram, a stacked bar plot is rescaled so that the height of each bar is 1
library(vcd)
attach(Arthritis)
counts<- table(Treatment,Improved)
spine(counts,main="Spinogram Example")
detach(Arthritis)
#------------------------------------------------------------------------------------------------
#                         Pie chart                                                             #
#------------------------------------------------------------------------------------------------
par(mfrow=c(2,2))     #combining 2 graph in one
slice<-c(10,12.4,16,8)
lbls<- c("US", "UK", "Australia", "Germany", "France")

#plot simple pie chart
pie(slice,labels = lbls,
    main="Simple pie chart")

#plot percentage pie chart
pct<- round(slice/sum(slice)*100)
lbls2<- paste(lbls," ",pct,"%",sep=" ")
pie(slice,labels=lbls2,col=rainbow(length(lbls2)),
    main="Percentages pie chart")

#plot 3D chart
library(plotrix)
pie3D(slice, labels=lbls,explode=0.1,
      main="3D Pie Chart ")

#pie chart from table
mytable<- table(state.region)
lbls3<- paste(names(mytable)," \n ",mytable,sep=" ")
pie(mytable,lables=lbls3,
    main="Pie chart a Table")
#if there is error regrading plot.new() then plot this chart seperatly

#Fan plot
library(plotrix)
slice <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
fan.plot(slice,labels=lbls,main="Fan plot")

#-------------------------------------------------------------------------------
#                               Histogram                                      #
#-------------------------------------------------------------------------------
par(mfrow=c(2,2))
hist(mtcars$mpg)

hist(mtcars$mpg,
     breaks=12,
     col="red",
     xlab="Mile per gallon",
     main="Colour histogram with 12 bins"
)

hist(mtcars$mpg,
     freq=FALSE,
     breaks=12,
     col="red",
     xlab="Miles Per Gallon",
     main="Histogram, rug plot, density curve"
)
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg),col="blue",lwd=2)

x <- mtcars$mpg
h<-hist(x,
        freq=FALSE,
        breaks=12,
        col="red",
        xlab="Miles Per Gallon",
        main="Histogram, rug plot, density curve"
)
xfit<-seq(min(x), max(x), length=40)
yfit<-dnorm(xfit, mean=mean(x), sd=sd(x))
yfit<-yfit*diff(h$mids[1:2])*length(x)
lines(xfit,yfit,col="blue",lwd=2)
box()


#-------------------------------------------------------------------------------
#                           Kernel density plot                                #
#-------------------------------------------------------------------------------
par(mfrow=c(2,1))
d <- density(mtcars$mpg)
plot(d)


d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d,col="red",border="blue")
rug(mtcars$mpg,col="brown")


#comparative kernel density plots

# sm.density.compare():- function in the sm package allows you to superimpose
#                        the kernel density plots of two or more groups

par(lwd=2)      #double width of ploted lines
library(sm)
attach(mtcars)
cyl.f<- factor(cyl,levels=c(4,6,8),
               labels=c("4 cylindere","6 cylinder","8 cylinder")
               )
sm.density.compare(mpg,cyl,xlab="Miles per gallon")  #plot density
title(main="Mpg distributed by cylinders")    # add main title
colfill<-c(2:(1+length(levels(cyl.f)))) #assigns a color
legend(locator(1),levels(cyl.f),fill=colfill) #add legend via mouse click
detach(mtcars)


#-------------------------------------------------------------------------------
#                           Box plot                                           #
#-------------------------------------------------------------------------------

#This plot describes the distribution of a continuous variable by plotting
# its five-number summary: the minimum, lower quartile (25th percentile), 
#median (50th percentile), upper quartile (75th percentile), and maximum

boxplot(mpg ~ cyl, data=mtcars,
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

mtcars$cyl.f<-factor(mtcars$cyl,
                     levels=c(4,6,8),
                     labels=c("4","6","8")
                     )
mtcars$am.f<- factor(mtcars$am,
                     levels=c(0,1),
                     labels=c("auto","standard")
                     )
boxplot(mpg~ am.f * cyl.f,
        data=mtcars,
        varwidth=TRUE,   #produces box plots with widths that are proportional to their sample sizes
        col=c("gold","darkgreen"),
        main= "MPG distribution by auto type ",
        xlab="auto type"
        )
 
#-------------------------------------------------------------------------------
#                           Dot plot                                           #
#-------------------------------------------------------------------------------       



