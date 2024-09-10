#### graphs and plots and figures and things ####

### 2019 species status ###
dat <- data.frame(
  "infected" = c(49,25,303),
  "uninfected" = c(184,130,419),
  row.names = c("bimaculatus", "griseocollis", "impatiens"),
  stringsAsFactors = FALSE
)

dat #review 

test<-fisher.test(dat) #fisher's exact
test




x <- c()
for (row in rownames(dat)) {
  for (col in colnames(dat)) {
    x <- rbind(x, matrix(rep(c(row, col), dat[row, col]), ncol = 2, byrow = TRUE))
  }
}
df <- as.data.frame(x)
df
colnames(df) <- c("bombus", "status")
df

# Fisher's exact test with raw data
test <- fisher.test(table(df))
test

# combine plot and statistical test with ggbarstats
library(ggstatsplot)
ggbarstats(
  df, status, bombus,
  results.subtitle = FALSE,
  subtitle = paste0(
    "Fisher's exact test", ", p-value = ",
    ifelse(test$p.value < 0.001, "< 0.001", round(test$p.value, 3))
  )
)

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
