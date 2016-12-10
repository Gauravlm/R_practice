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
mean<- aggregate(state$Illiteracy,by)
