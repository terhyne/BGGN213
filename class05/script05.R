# Class 05: Data Visualization
# Today we are going to use ggplot2 package
# random tip: hit control enter to run line of code from script
# install.packages one time only with install.packages("ggplot2")

# Figure 1: Cars 
ggplot(cars)
# error: can't find. You have to call it / load the package every time you use it! Do this with "library".
library(ggplot2)
head(cars)
# head (see beginning of data) is useful when the entire dataset is large
cars
# use to view entire dataset
# use ?cars to learn about the dataset
ggplot(cars)
# got a blank plot
ggplot(data=cars)
# got a blank plot
ggplot (data=cars) + aes (x=speed)
# got just an x-axis
ggplot (data=cars) + aes (x=speed, y=dist)
# got a y-axis too, but no data
ggplot (data=cars) + aes (x=speed, y=dist) + geom_point()
# got a nice scatter plot. now time to customize.
ggplot (data=cars) + aes (x=speed, y=dist) + geom_point() + labs(title="Stopping Distance of Old Cars", x="speed (mph)") +
# can just add "+" to previous line instead of typing all on one line
labs(y="stopping distance (ft)") +
geom_smooth(method="lm")
# note: ggplot is not the only graphics system. the base "R" graphics is fine for basic stuff / initial visualization.
plot(cars)
# remember to use ?plot to see arguments for customization possibilities. ggplot is much better / more customizable though.

# Figure 2: Genes
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
genes
# how many rows in the dataset?
nrow(genes)
# how many columns? what are they named?
ncol(genes)
colnames(genes)
# how many "up"(regulated) genes are there?
table(genes$State)
table(genes[,4])
# what fraction are upregulated?
table(genes$State)/nrow(genes)
# always write script in code (not concrete numbers) so you don't have to change it when dataset changes
# what are these numbers in fewer sig figs?
round( table(genes$State)/nrow(genes)) * 100
# got 0, 100, and 0 -> not informative. argue.
round(table(genes$State)/nrow(genes) *100, 3)
# let's make a figure
p <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()
# good to set this plot to p so that you can modify / come back to it
# change color scale and add title
p <- p + scale_color_manual(values=c("blue", "gray", "red"))
p <- p + labs(title="Gene expression")

# Figure 3: Going further
# gapminder dataset contains economic and demographic data about various countries since 1952
install.packages("gapminder")
library(gapminder)
gapminder
install.packages("dplyr")
library(dplyr)
# use dpylr for focus in on a single year from gapminder data
gapminder_2007 <- gapminder %>% filter(year==2007)
gapminder_2007
# let's make a figure
ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp) + geom_point() +
# to better see overlapping points, change transparency
geom_point(alpha=0.4)
# nothing changed. remember that adding will just add on top.
ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp) + geom_point(alpha=0.4)
p2 <- ggplot(gapminder_2007) + aes(x=gdpPercap, y=lifeExp) + geom_point(alpha=0.4)
# let's add the other useful data columns into the figure
p2 + aes(col=continent, size=pop)
# want population to be reflected as continuous? set col=pop
p2 + aes(col=pop)
# let's go back to col=continent, size=pop
p2 + aes(col=continent, size=pop)
# notice that size isn't proportional? expand the max size
p2 + aes(col=continent, size=pop) + scale_size_area(max_size =10)

# want to make the figure interactive?
install.packages("plotly")
library(plotly)
ggplotly()

# Figure 4: Introduction to Bar Charts
# filter the dataset: only interested in the biggest 5 countries in 2007 -> name 
gapminder_top5 <- gapminder %>%
  filter(year==2007) %>%
  arrange(desc(pop)) %>%
  top_n(5, pop)
# let's make a figure
# geom_col requires aes x/y to define the bars (x=bar, y=height)
ggplot(gapminder_top5) + geom_col(aes(x=country, y=pop))
# let's add the other useful data columns into the figure
ggplot(gapminder_top5) + geom_col(aes(x=country, y=pop, fill=continent))
# two different hues because continent = categorical
ggplot(gapminder_top5) + geom_col(aes(x=country, y=pop, fill=lifeExp)) 
# saturation gradient because lifeExp = numerical
# want to change the order of the bars?
ggplot(gapminder_top5) + geom_col(aes(x=reorder(country, -pop), y=pop, fill=lifeExp))
# don't want a 3rd variable anymore?
ggplot(gapminder_top5) + geom_col(aes(x=reorder(country, -pop), y=pop))
# remember to name this to modify more easily
p3 <- ggplot(gapminder_top5) + geom_col(aes(x=reorder(country, -pop), y=pop))

# all done. Do datacamp for more practice.