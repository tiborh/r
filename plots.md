Plots
================
`tibor`
`2016-07-10`

Tutorials as Light R Markdown Documents 2
=========================================

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

![](plots_files/figure-markdown_github/unnamed-chunk-1-1.png)

``` r
## matrix plots
e <- matrix(0,10,10)
e[4:5,6:7] = 1
e[c(3,6),5:8] = 0.5
e[4:5,c(5,8)] = 0.5
contour(e)                              # elevation lines on a map
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-2.png)

``` r
persp(e)                                # perspective view
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-3.png)

``` r
persp(e,expand=0.4)                     # squish it a little lower
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-4.png)

``` r
persp(e,expand=0.2)
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-5.png)

``` r
## using a built-in matrix
str(volcano)                            # 87 by 61
```

    ##  num [1:87, 1:61] 100 101 102 103 104 105 105 106 107 108 ...

``` r
contour(volcano)
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-6.png)

``` r
persp(volcano,expand=0.2)
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-7.png)

``` r
image(volcano)                          # heat map
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-8.png)

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

![](plots_files/figure-markdown_github/unnamed-chunk-1-9.png)

``` r
boxplot(vals)
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-10.png)

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

![](plots_files/figure-markdown_github/unnamed-chunk-1-11.png)

``` r
plot(x,y,pch=as.integer(tf),col=as.integer(tf)+1,main="Dot and Colour Per Factor")
legend("bottomright", levels(tf), pch=letrange, col=letrange+1)
##help(legend)
##help(plot)

## same with ggplot2
library(ggplot2)
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-12.png)

``` r
qplot(x,y)
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-13.png)

``` r
qplot(x,y,color=tf)                     # introducing groups
```

![](plots_files/figure-markdown_github/unnamed-chunk-1-14.png)

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
Renderer: <a id="plot_id381393531_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id381393531" data-renderer="svg">SVG</a> | <a id="plot_id381393531_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id381393531" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id381393531_download" class="ggvis-download" data-plot-id="plot_id381393531">Download</a>
</li>
</ul>
</nav>

<script type="text/javascript">
var plot_id381393531_spec = {
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
ggvis.getPlot("plot_id381393531").parseSpec(plot_id381393531_spec);
</script>
<!--/html_preserve-->
