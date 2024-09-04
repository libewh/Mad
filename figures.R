#### graphs and plots and figures and things ####

##### basic plots for data visualization ####
ggplot(impervspecies2019) +
  aes(imperv, p.api) +
  geom_tile(aes(imperv, species, fill = p.api))

#plots for publication
# Load the ggplot2 package
library(ggplot2)

# Example data frame
data <- data.frame(
  species = c("Species A", "Species B", "Species C", "Species D"),
  prevalence = c(10, 25, 15, 30)
)

# Create visuals

library(ggplot2)
library(dplyr)
years <- read_csv("/Users/whiteman/Library/CloudStorage/OneDrive-TheOhioStateUniversity/School/Papers/Invert_Path/Data/byyearplot.csv")


ggplot(years, aes(imp, n, fill = species)) +
  geom_bar(position = position_dodge(1.0), stat = "identity", width = .50) +
  facet_wrap(~ year) +
  labs(title = "% api by % imp for four bumble bee species",
       x = "% imp",
       y = "% api") +
  theme_minimal()


ggplot(years, aes(x = imp, y = species, fill = p.api)) +
  geom_tile(color = "white", width = 2, height = 2) +
  scale_fill_gradient(low = "white", high = "blue") +
  labs(title = "heatmap for your pleasure",
       x = "imp",
       y = "species",
       fill = "p.api") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  coord_fixed(ratio = 1)

ggplot(years, aes(x = imp, y = p.api, color = species)) +
  geom_point() +
  labs(title = "scat(ter) for your pleasure",
       x = "imp",
       y = "p.api") +
  theme_minimal() +
  facet_wrap(~ year)

ggplot(years, aes(x = imp, y = p.api)) +
  stat_binhex(bins = 10) +
  scale_fill_viridis_c() +
  labs(title = "Hexbin it",
       x = "X-axis",
       y = "Y-axis",
       fill = "p.api") +
  theme_minimal()


ggplot(data, aes(x = surface, y = prevalence, fill = species)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Surface", y = "Prevalence", fill = "Species") +
  theme_minimal()
