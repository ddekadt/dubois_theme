###########################################################
##################### THEME DUBOIS ########################
## by Anthony Starks, Charlie Eaton, Daniel de Kadt, et al.

# Libraries
library(foreign)
library(tidyverse)
library(haven)
library(extrafont)

# Define theme (this needs work)
theme_dubois <- function(base_size = 11,
                         base_family = "Roboto Condensed",
                         base_line_size = base_size / 170,
                         base_rect_size = base_size / 170, 
                         legend_title=element_blank(),
                         legend_position = "none",
                         aspect_ratio = 1.2727){
    theme_minimal(base_size = base_size, 
                  base_family = base_family,
                  base_line_size = base_line_size) %+replace%
      theme(aspect.ratio=aspect_ratio, 
            plot.background=element_rect(fill="linen"),
            plot.margin=unit(c(5,5,5,5),"mm"),
            legend.title = legend_title,
            legend.position = legend_position,
            legend.background = element_rect(fill="linen", color = "linen"),
            panel.grid.major = element_line(color="light grey", size=0.65, linetype=1),
            panel.grid.minor = element_line(color="light grey", size=0.65, linetype=1),
            axis.title=element_blank(),
            plot.title=element_text(hjust= 0.5, margin=margin(0,0,10,0), size=15),
            plot.subtitle=element_text(hjust= 0.5, margin=margin(0,0,30,0), size=10))
}

# Set wd
if(Sys.info()['user']=='ddeka'){
  setwd("C:\\Users\\ddeka\\Dropbox\\dubois\\dubois_theme")
} else {}


# Call data
fpc = read_csv("for_profit_college.csv")

# Plot data
dubois_fpc = 
ggplot(fpc, aes(y=pct, x=year, color=race)) +
  geom_line(size=3) +
  scale_color_manual(values=c("#dc143c", "#00aa00")) +
  scale_y_continuous(limits=c(0,20), "", breaks = c(seq(0,20,5)), 
                     labels=c(seq(0,15,5), "PERCENT"), minor_breaks = c(seq(0,20,1))) + 
  scale_x_continuous("", breaks = c(seq(1995, 2015, 2)), labels = c(seq(1995, 2015, 2)), 
                     minor_breaks = c(seq(1995, 2015, 1))) +
  labs(title="SHARE OF ALL U.S. UNDERGRADUATES\n ENROLLED AT FOR-PROFIT COLLEGES, BY RACE.",
          subtitle= "by faculty at the University of California, Merced", 
          caption= "Data from IPEDS. Design based on Plate 40 of Du Bois 1900 Paris Exhibition (Battle-Baptiste & 
Russert 2018; Stark 2019).") +
  theme_dubois(aspect_ratio = 1, legend_position = c(0.25,0.705))

# Save plot
ggsave("for_profit_college.png", dubois_fpc, width=7, height=10)
