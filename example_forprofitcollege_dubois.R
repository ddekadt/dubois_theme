###########################################################
################ THEME DUBOIS EXAMPLE #####################
## by Anthony Starks, Charlie Eaton, Daniel de Kadt, et al.

# Libraries
library(foreign)
library(tidyverse)
library(haven)
library(extrafont)

# Set wd
if(Sys.info()['user']=='ddeka'){
  setwd("C:\\Users\\ddeka\\Dropbox\\dubois\\dubois_theme")
} else {}

# Load theme
source("theme_dubois.R")

# Load palette
source("dubois_palette.R")

# Call data
fpc = read_csv("for_profit_college.csv")

# Plot data
dubois_fpc = 
  ggplot(fpc, aes(y=pct, x=year, color=race)) +
  geom_line(size=3) +
  scale_color_manual(values=dubois_palette[c(2,3)]) +
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
