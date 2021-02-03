library(ggplot2)
library(data.table)
library(plotly)

compare <- fread("file.txt", header=TRUE, fill=TRUE, sep="\t")

n <- compare[[2]]
t <- compare[[3]]
c <- compare[[4]]

p <- ggplot(compare, aes(x=n, y=t, colour=c))+
      geom_point(aes(text=compare[[1]], a=n, b=t)) +
      scale_x_log10("n RPM", breaks=c(0.1, 1, 10, 100, 1000, 10^4, 10^5, 10^6), labels=c("0.1", "1", "10", "100", "1000", "10^4", "10^5", "10^6"))+
      scale_y_log10("t RPM", breaks=c(0.1, 1, 10, 100, 1000, 10^4, 10^5, 10^6), labels=c("0.1", "1", "10", "100", "1000", "10^4", "10^5", "10^6"))+
      scale_color_gradientn(colours=rainbow(7), name="log2") +
      ggtitle("t vs. n") +
      theme(plot.title = element_text(hjust = 0.5))
      
ggsave("file.png")

ggplotly(p, tooltip=c("text","a", "b"))


