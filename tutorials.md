Tutorials
================
`tibor`
`2016-07-10`

Tutorials as Light R Markdown Documents
=======================================

Loops
-----

Contents of `loops.r`

``` r
## repeat: without any condition, only break can end it

repeat {
    num <- sample(1:10,1,replace=T)
    cat("number drawn: ",num,"\n")
    if (num == 3) break;
}
```

    ## number drawn:  3

``` r
## while: entry condition, break and next can be used

num <- 0

while (num != 3) {
    num <- sample(1:10,1,replace=T)
    cat("number drawn: ",num,"\n")
}
```

    ## number drawn:  6 
    ## number drawn:  3

``` r
## for: sequences

### looping through elements

for(a in 1:10)
    cat("Loop at number: ",a,"\n");
```

    ## Loop at number:  1 
    ## Loop at number:  2 
    ## Loop at number:  3 
    ## Loop at number:  4 
    ## Loop at number:  5 
    ## Loop at number:  6 
    ## Loop at number:  7 
    ## Loop at number:  8 
    ## Loop at number:  9 
    ## Loop at number:  10

``` r
#### backwards

for(a in 10:1)
    cat("Loop at number: ",a,"\n");
```

    ## Loop at number:  10 
    ## Loop at number:  9 
    ## Loop at number:  8 
    ## Loop at number:  7 
    ## Loop at number:  6 
    ## Loop at number:  5 
    ## Loop at number:  4 
    ## Loop at number:  3 
    ## Loop at number:  2 
    ## Loop at number:  1

``` r
## for: indeces

a <- sample(10)

for (i in 1:length(a))
    cat("Loop at index: ",i," and at number: ",a[i],"\n")
```

    ## Loop at index:  1  and at number:  5 
    ## Loop at index:  2  and at number:  2 
    ## Loop at index:  3  and at number:  4 
    ## Loop at index:  4  and at number:  8 
    ## Loop at index:  5  and at number:  1 
    ## Loop at index:  6  and at number:  3 
    ## Loop at index:  7  and at number:  7 
    ## Loop at index:  8  and at number:  10 
    ## Loop at index:  9  and at number:  6 
    ## Loop at index:  10  and at number:  9

``` r
### Looping through Strings

b <- "Hello world!"

for (i in nchar(b):1)
    cat(substr(b,i,i))
```

    ## !dlrow olleH

``` r
### Looping through a Matrix

c <- matrix(1:12,nrow=3)

for(j in 1:nrow(c)) {
    for(i in 1:ncol(c))
        cat(c[j,i],"\t")
    cat("\n")
}
```

    ## 1    4   7   10  
    ## 2    5   8   11  
    ## 3    6   9   12  

``` r
### Looping through a List

d <- list(a,b,c)

for (i in 1:length(d)) {
    cat("link item ",i,":\n\t")
    print(d[[i]])
}
```

    ## link item  1 :
    ##   [1]  5  2  4  8  1  3  7 10  6  9
    ## link item  2 :
    ##  [1] "Hello world!"
    ## link item  3 :
    ##       [,1] [,2] [,3] [,4]
    ## [1,]    1    4    7   10
    ## [2,]    2    5    8   11
    ## [3,]    3    6    9   12

Plots
-----

``` r
## dot plot
x <- seq(0,2*pi,0.01)
y <- sin(x)
z <- cos(x)
a <- tan(x)
##plot(y,main="sin(x)")
plot(x,y,main="sine, cosine, and tangent",asp=c(1,2))
points(x,z,col=c(2))
points(x,a,col=c(4))
legend(5.9, 0.75, c("sin", "cos", "tan"), col = c(1, 2, 4),
       text.col = "green4", pch = c(1, 1, 1),
       merge = TRUE, bg = "gray90")
```

    ## Warning in legend(5.9, 0.75, c("sin", "cos", "tan"), col = c(1, 2, 4),
    ## text.col = "green4", : 'merge = TRUE' has no effect when no line segments
    ## are drawn

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-1.png)

``` r
## matrix plots
e <- matrix(0,10,10)
e[4:5,6:7] = 1
e[c(3,6),5:8] = 0.5
e[4:5,c(5,8)] = 0.5
contour(e)                              # elevation lines on a map
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-2.png)

``` r
persp(e)                                # perspective view
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-3.png)

``` r
persp(e,expand=0.4)                     # squish it a little lower
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-4.png)

``` r
persp(e,expand=0.2)
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-5.png)

``` r
## using a built-in matrix
str(volcano)                            # 87 by 61
```

    ##  num [1:87, 1:61] 100 101 102 103 104 105 105 106 107 108 ...

``` r
contour(volcano)
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-6.png)

``` r
persp(volcano,expand=0.2)
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-7.png)

``` r
image(volcano)                          # heat map
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-8.png)

``` r
## together with functions
vals <- sample(7:27,10)
names(vals) <- letters[1:10]
barplot(vals,main="Value Distribution Study")
my.mean <- mean(vals)
abline(h = my.mean)
abline(h = median(vals),col=2)
my.dev <- sd(vals)
abline(h = my.mean + my.dev, lty=2)
abline(h = my.mean - my.dev, lty=2)
legend(9, 5, c("mean","median","mean +/- sd"), col = c(1, 2),
       text.col = "blue", lty = c(1, 1, 2),
       merge = TRUE, bg = "gray90")
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-9.png)

``` r
boxplot(vals)
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-10.png)

``` r
## factors
num <- 20
maxn <- 50
letrange <- 1:3
x <- sample(1:maxn,num)
y <- sample(1:maxn,num)
t <- sample(letters[letrange],num,replace=T)
tf <- factor(t)
plot(x,y,pch=levels(tf))
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-11.png)

``` r
plot(x,y,pch=as.integer(tf),col=as.integer(tf)+1,main="Dot and Colour Per Factor")
legend("bottomright", levels(tf), pch=letrange, col=letrange+1)
##help(legend)
##help(plot)

## same with ggplot2
library(ggplot2)
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-12.png)

``` r
qplot(x,y)
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-13.png)

``` r
qplot(x,y,color=tf)                     # introducing groups
```

![](tutorials_files/figure-markdown_github/unnamed-chunk-2-14.png)

``` r
##help(qplot)


## ggvis test (works only in html environment)
if (!require(ggvis)) install.packages("ggvis")
```

    ## Loading required package: ggvis

    ## 
    ## Attaching package: 'ggvis'

    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     resolution

``` r
library(ggvis)
ggvis(mtcars, ~wt, ~hp)
```

    ## Guessing layer_points()

<!--html_preserve-->

<nav class="ggvis-control"> <a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: <a id="plot_id518591098_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id518591098" data-renderer="svg">SVG</a> | <a id="plot_id518591098_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id518591098" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id518591098_download" class="ggvis-download" data-plot-id="plot_id518591098">Download</a>
</li>
</ul>
</nav>

<script type="text/javascript">
var plot_id518591098_spec = {
  "data": [
    {
      "name": "mtcars0",
      "format": {
        "type": "csv",
        "parse": {
          "wt": "number",
          "hp": "number"
        }
      },
      "values": "\"wt\",\"hp\"\n2.62,110\n2.875,110\n2.32,93\n3.215,110\n3.44,175\n3.46,105\n3.57,245\n3.19,62\n3.15,95\n3.44,123\n3.44,123\n4.07,180\n3.73,180\n3.78,180\n5.25,205\n5.424,215\n5.345,230\n2.2,66\n1.615,52\n1.835,65\n2.465,97\n3.52,150\n3.435,150\n3.84,245\n3.845,175\n1.935,66\n2.14,91\n1.513,113\n3.17,264\n2.77,175\n3.57,335\n2.78,109"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n1.31745\n5.61955"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n37.85\n349.15"
    }
  ],
  "scales": [
    {
      "name": "x",
      "domain": {
        "data": "scale/x",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "width"
    },
    {
      "name": "y",
      "domain": {
        "data": "scale/y",
        "field": "data.domain"
      },
      "zero": false,
      "nice": false,
      "clamp": false,
      "range": "height"
    }
  ],
  "marks": [
    {
      "type": "symbol",
      "properties": {
        "update": {
          "fill": {
            "value": "#000000"
          },
          "size": {
            "value": 50
          },
          "x": {
            "scale": "x",
            "field": "data.wt"
          },
          "y": {
            "scale": "y",
            "field": "data.hp"
          }
        },
        "ggvis": {
          "data": {
            "value": "mtcars0"
          }
        }
      },
      "from": {
        "data": "mtcars0"
      }
    }
  ],
  "legends": [],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "wt"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "hp"
    }
  ],
  "padding": null,
  "ggvis_opts": {
    "keep_aspect": false,
    "resizable": true,
    "padding": {},
    "duration": 250,
    "renderer": "svg",
    "hover_duration": 0,
    "width": 672,
    "height": 480
  },
  "handlers": null
};
ggvis.getPlot("plot_id518591098").parseSpec(plot_id518591098_spec);
</script>
<!--/html_preserve-->
