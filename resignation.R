library(tidyverse)
library(readxl)
library(ggside)

resignation <- read_excel("resignation.xlsx")
resignation2 <- read_excel("profession.xlsx")
resignation3 <- read_excel("overall.xlsx")
theme_set(theme_bw())

resignation_plot <- ggplot(resignation, aes(x = year, y = resignation)) +
  geom_point(color = "firebrick", shape = "diamond", size = 3) +
  geom_line(col = "firebrick", linetype = "dotted", size = 0.4) +
  labs(x = "Year", y = "Resignation (Numbers)",
       title = "Great Resignation of Civil Servants (RGoB)",
       caption = "Data: The Bhutanese (www.thebhutanese.bt)") +
  theme(axis.title = element_text(color = "sienna", size = 15, face = "bold"),
        axis.text = element_text(color = "dodgerblue", size = 12),
        plot.title = element_text(family = "Arial", hjust = .5, size = 14, face = "bold"))

resignation_plot

profession <- resignation %>% 
  select(profession, number)

writexl::write_xlsx(profession, "profession.xlsx")

p <- resignation2 %>% 
  ggplot(aes(profession, number, fill = profession)) +
  geom_col() +
  coord_flip() +
  labs(x = "Position", y = "Number") +
  scale_fill_brewer(palette = "Accent") +
  theme(legend.position = "none")
p

library(patchwork)
patchwork::plot_layout(ncol = 1, nrow = 2)
resignation_plot + p + plot_layout(widths = c(2, 1))

ggsave(dpi = 300, "great_resignation.png")

resignation_plot2 <- ggplot(resignation3, aes(x = year, y = resignations)) +
  geom_point(color = "firebrick", shape = "diamond", size = 3) +
  geom_line(col = "firebrick", linetype = "dotted", size = 0.4) +
  labs(x = "Year", y = "Resignation (Numbers)",
       title = "Great Resignation of Civil Servants (RGoB)",
       caption = "Data: The Bhutanese (www.thebhutanese.bt)") +
  theme(axis.title = element_text(color = "sienna", size = 15, face = "bold"),
        axis.text = element_text(color = "dodgerblue", size = 12),
        plot.title = element_text(family = "Arial", hjust = .5, size = 14, face = "bold"))

resignation_plot2


p2 <- resignation2 %>% 
  ggplot(aes(profession, number, fill = profession)) +
  geom_col() +
  coord_flip() +
  labs(x = "Position", y = "Number") +
  scale_fill_brewer(palette = "Accent") +
  theme(legend.position = "none")
p2

library(patchwork)
patchwork::plot_layout(ncol = 1, nrow = 2)
resignation_plot2 + p2 + plot_layout(widths = c(2, 1))

ggsave(dpi = 300, "great_resignation2.png")
