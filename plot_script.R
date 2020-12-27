library(tidyverse)
library(ggplot2)
library(scales)


setwd('~')
results = read_csv('substitutions_results.csv')
subs = results$substitution
count = results$count
type = results$type
d = data.frame(subs, count, type)
total = sum(count)

# overview pie chart of transitions and transversions 
p1 = ggplot(d, aes(x="",y=count,fill=type)) + 
  geom_bar(stat="identity", width=1, color="white") +
  geom_text(aes(1.6, label= paste0(subs, "\n", percent(count/total))), hjust = "outward", position=position_stack(vjust = 0.5)) +
  coord_polar("y", start=0) +
  theme(axis.text.x=element_blank(), 
        axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Substitutions overview")
p1

# plot with transitions
transitions = d[d$type == 'transition',]
p2 = ggplot(transitions, aes(x=subs, y=count, fill=subs)) + 
  geom_bar(stat="identity") +
  scale_fill_brewer(palette = "RdYlGn", name = "Type") +
  theme(legend.position="none") +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Transitions overview")
p2

#plot with transversions
transversions = d[d$type == 'transversion',]
p3 = ggplot(transversions, aes(x=subs, y=count, fill=subs)) + 
  geom_bar(stat="identity") +
  scale_fill_brewer(palette = "RdYlGn", name = "Type") +
  theme(legend.position="none") +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Transversions overview")
p3

# plots for adenine
adenin = d[grepl('A', d$subs),]

# pie chart
p4 = ggplot(adenin, aes(x="",y=count,fill=type)) + 
  geom_bar(stat="identity", width=1, color="white") +
  geom_text(aes(1.6, label= paste0(subs, "\n", percent(count/total))), hjust = "outward", position=position_stack(vjust = 0.5)) +
  coord_polar("y", start=0) +
  theme(axis.text.x=element_blank(), 
        axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) + 
  ggtitle("Adenin substitutions overview")
p4

# histogram
p5 = ggplot(adenin, aes(x=subs, y=count, fill=subs)) + 
  geom_bar(stat="identity") +
  scale_fill_brewer(palette = "RdYlGn", name = "Type") +
  theme(legend.position="none") +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Adenin substitutions")
p5

#plots for cytosin
cytosin = d[grepl('C', d$subs),]

# pie chart
p6 = ggplot(cytosin, aes(x="",y=count,fill=type)) + 
  geom_bar(stat="identity", width=1, color="white") +
  geom_text(aes(1.6, label= paste0(subs, "\n", percent(count/total))), hjust = "outward", position=position_stack(vjust = 0.5)) +
  coord_polar("y", start=0) +
  theme(axis.text.x=element_blank(), 
        axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Cytosin substitutions overview")
p6

# histogram
p7 = ggplot(cytosin, aes(x=subs, y=count, fill=subs)) + 
  geom_bar(stat="identity") +
  scale_fill_brewer(palette = "RdYlGn", name = "Type") +
  theme(legend.position="none") +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Cytosin substitutions")
p7

#plots for guanin
guanin = d[grepl('G', d$subs),]

# pie chart
p8 = ggplot(guanin, aes(x="",y=count,fill=type)) + 
  geom_bar(stat="identity", width=1, color="white") +
  geom_text(aes(1.6, label= paste0(subs, "\n", percent(count/total))), hjust = "outward", position=position_stack(vjust = 0.5)) +
  coord_polar("y", start=0) +
  theme(axis.text.x=element_blank(), 
        axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Guanin substitutions overview")
p8

# histogram
p9 = ggplot(guanin, aes(x=subs, y=count, fill=subs)) + 
  geom_bar(stat="identity") +
  scale_fill_brewer(palette = "RdYlGn", name = "Type") +
  theme(legend.position="none") +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Guanin substitutions")
p9

#plots for thymin
thymin = d[grepl('T', d$subs),]

# pie chart
p10 = ggplot(thymin, aes(x="",y=count,fill=type)) + 
  geom_bar(stat="identity", width=1, color="white") +
  geom_text(aes(1.6, label= paste0(subs, "\n", percent(count/total))), hjust = "outward", position=position_stack(vjust = 0.5)) +
  coord_polar("y", start=0) +
  theme(axis.text.x=element_blank(), 
        axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Thymin substitutions overview")
p10

# histogram
p11 = ggplot(thymin, aes(x=subs, y=count, fill=subs)) + 
  geom_bar(stat="identity") +
  scale_fill_brewer(palette = "RdYlGn", name = "Type") +
  theme(legend.position="none") +
  theme(axis.title.x = element_blank(), 
        axis.title.y = element_blank(),
        panel.grid=element_blank()) +
  ggtitle("Thymin substitutions")
p11

