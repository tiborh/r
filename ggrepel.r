if (!require(ggrepel)) install.packages("ggrepel")
library(ggrepel)

ggplot(mtcars, aes(wt, mpg)) +
    geom_point(color = 'red') +
    geom_text_repel(aes(label = rownames(mtcars))) +
    theme_classic(base_size = 16)

## source: https://github.com/slowkow/ggrepel
## also exists: ?geom_label_repel
