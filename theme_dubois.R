###########################################################
##################### THEME DUBOIS ########################
## by Anthony Starks, Charlie Eaton, Daniel de Kadt, et al.

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
