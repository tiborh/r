Introduction to R Markdown
================
`tibor`
`2016-07-09`

Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

Using the **rmarkdown** package (`pandoc` version 1.12.3 or higher is required), the rendering command is

``` r
rmarkdown::render("your rmd file")
```

The default is HTML output (because `output` has been specified as such in the heading of the current document). If you would like a markdown (.md) or github (to include graphics, with preview in html) document, add an argument:

``` r
rmarkdown::render("your rmd file", md_document())
rmarkdown::render("your rmd file", github_document())
```

------------------------------------------------------------------------

The same way, PDF output (`pdflatex` is needed, that is `texlive-base`, `texlive-latex-base`, `texlive-latex-extra`, and `texlive-fonts-recommended`):

``` r
rmarkdown::render("your rmd file", pdf_document())
```

or OpenOffice or Word document:

``` r
rmarkdown::render("your rmd file", odt_document())
rmarkdown::render("your rmd file", word_document())
```

or `beamer` (PDF) or `slidy` (HTML) presentation:

``` r
rmarkdown::render("your rmd file", beamer_presentation())
rmarkdown::render("your rmd file", slidy_presentation())
```

------------------------------------------------------------------------

When the document is generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
summary(mtcars)
```

    ##       mpg             cyl             disp             hp       
    ##  Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
    ##  1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
    ##  Median :19.20   Median :6.000   Median :196.3   Median :123.0  
    ##  Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
    ##  3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
    ##  Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
    ##       drat             wt             qsec             vs        
    ##  Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
    ##  1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
    ##  Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
    ##  Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
    ##  3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
    ##  Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
    ##        am              gear            carb      
    ##  Min.   :0.0000   Min.   :3.000   Min.   :1.000  
    ##  1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
    ##  Median :0.0000   Median :4.000   Median :2.000  
    ##  Mean   :0.4062   Mean   :3.688   Mean   :2.812  
    ##  3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
    ##  Max.   :1.0000   Max.   :5.000   Max.   :8.000

------------------------------------------------------------------------

You can also embed plots, for example:

![](tutorial_markdown1_files/figure-markdown_github/unnamed-chunk-7-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

Session Information
-------------------

``` r
sessionInfo()
```

    ## R version 3.3.1 (2016-06-21)
    ## Platform: x86_64-pc-linux-gnu (64-bit)
    ## Running under: Ubuntu 16.04 LTS
    ## 
    ## locale:
    ##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
    ##  [3] LC_TIME=de_DE.UTF-8        LC_COLLATE=en_US.UTF-8    
    ##  [5] LC_MONETARY=de_DE.UTF-8    LC_MESSAGES=en_US.UTF-8   
    ##  [7] LC_PAPER=de_DE.UTF-8       LC_NAME=C                 
    ##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
    ## [11] LC_MEASUREMENT=de_DE.UTF-8 LC_IDENTIFICATION=C       
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] knitr_1.13      ggvis_0.4.2     dplyr_0.5.0     nasaweather_0.1
    ## [5] rmarkdown_1.0  
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] Rcpp_0.12.5     digest_0.6.9    assertthat_0.1  mime_0.4       
    ##  [5] R6_2.1.2        jsonlite_1.0    xtable_1.8-2    DBI_0.4-1      
    ##  [9] formatR_1.4     magrittr_1.5    evaluate_0.9    stringi_1.1.1  
    ## [13] lazyeval_0.2.0  tools_3.3.1     stringr_1.0.0   shiny_0.13.2   
    ## [17] compiler_3.3.1  httpuv_1.3.3    yaml_2.1.13     htmltools_0.3.5
    ## [21] tibble_1.1

Supported Languages
-------------------

``` r
library(knitr)
names(knitr::knit_engines$get())
```

    ##  [1] "awk"       "bash"      "coffee"    "gawk"      "groovy"   
    ##  [6] "haskell"   "lein"      "mysql"     "node"      "perl"     
    ## [11] "psql"      "python"    "Rscript"   "ruby"      "sas"      
    ## [16] "scala"     "sed"       "sh"        "stata"     "zsh"      
    ## [21] "highlight" "Rcpp"      "tikz"      "dot"       "c"        
    ## [26] "fortran"   "asy"       "cat"       "asis"      "stan"     
    ## [31] "block"     "js"        "css"

### Some Perl

``` perl
package TS v0.0.1 {
    sub ts {
        my @art = localtime(time);
        return sprintf("%4d%02d%02d_%02d%02d%02d",
                       $art[5]+1900, # year
                       ++$art[4],    # month
                       $art[3],      # day
                       $art[2],      # hour
                       $art[1],      # minute
                       $art[0]);     # second
    }
}
1;
```

### Some C

``` c
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <time.h>
#include <unistd.h>
#include <stdbool.h>

time_t start, end;

void signal_callback_handler(int signum)
{
   printf("Caught signal %d\n",signum);
   printf("end: %ld\n",(long)end);
   double time_difference = difftime(end,start);
   printf("%lfs has passed.\n",time_difference);
   exit(signum);
}


int main(int argc, char** argv)
{
  signal(SIGINT, signal_callback_handler);
  bool ticktack = true;
  start = end = time(NULL);
  printf("start: %ld\n",(long)start);
  //long long counter = 0;
  while(1)
    {
      if (ticktack)
    {
      puts("tick");
      ticktack = false;
    }
      else
    {
      puts("tack");
      ticktack = true;
    }
      sleep(1);
      end = time(NULL);
      //counter++;
    }
  //printf("%lld loop cyles for one clock tick\n",counter);

  return 0;
}
```