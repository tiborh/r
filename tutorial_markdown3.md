Introduction to R Markdown 3
================
`tibor`
`2016-07-09`

Data
----

The `atmos` data set resides in the `nasaweather` package of the *R* programming language. It contains a collection of atmospheric variables measured between 1995 and 2000 on a grid of 576 coordinates in the western hemisphere. The data set comes from the [2006 ASA Data Expo](http://stat-computing.org/dataexpo/2006/).

Some of the variables in the `atmos` data set are:

-   **temp** - The mean monthly air temperature near the surface of the Earth (measured in degrees kelvin (*K*))

-   **pressure** - The mean monthly air pressure at the surface of the Earth (measured in millibars (*mb*))

-   **ozone** - The mean monthly abundance of atmospheric ozone (measured in Dobson units (*DU*))

Conversion
----------

You can convert the temperature unit from Kelvin to Celsius with the formula

\[ celsius = kelvin - 273.15 \]

And you can convert the result to Fahrenheit with the formula

\[ fahrenheit = celsius \times \frac{5}{9} + 32 \]

Cleaning
--------

For the remainder of the report, we will look only at data from the year 1995. We aggregate our data by location, using the *R* code below.

``` r
means <- atmos %>% 
  filter(year == year) %>%
  group_by(long, lat) %>%
  summarize(temp = mean(temp, na.rm = TRUE), 
         pressure = mean(pressure, na.rm = TRUE),
         ozone = mean(ozone, na.rm = TRUE),
         cloudlow = mean(cloudlow, na.rm = TRUE),
         cloudmid = mean(cloudmid, na.rm = TRUE),
         cloudhigh = mean(cloudhigh, na.rm = TRUE)) %>%
  ungroup()
```

where the `year` object equals 1995.

Ozone and temperature
---------------------

Is the relationship between ozone and temperature useful for understanding fluctuations in ozone? A scatterplot of the variables shows a strong, but unusual relationship.

<!--html_preserve-->

<nav class="ggvis-control"> <a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: <a id="plot_id480436822_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id480436822" data-renderer="svg">SVG</a> | <a id="plot_id480436822_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id480436822" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id480436822_download" class="ggvis-download" data-plot-id="plot_id480436822">Download</a>
</li>
</ul>
</nav>

<script type="text/javascript">
var plot_id480436822_spec = {
  "data": [
    {
      "name": ".0",
      "format": {
        "type": "csv",
        "parse": {
          "temp": "number",
          "ozone": "number"
        }
      },
      "values": "\"temp\",\"ozone\"\n296.133333333333,269.333333333333\n295.725,268.5\n298.05,248\n296,265\n296.88,260.8\n296.9,262\n299.5,250.666666666667\n298.433333333333,254.666666666667\n301,232\n296.933333333333,256\n297.8,248\n298.75,250\n300.5,252\n301.266666666667,253.333333333333\n300.833333333333,258.666666666667\n299.75,259\n301.9,270\n296.2,278\n298.7,267\n298.55,278\n290.95,303\n302.8,308\n292.1,303.666666666667\n297.1,292\n294.55,285\n297.066666666667,258\n296,263\n297.433333333333,259.666666666667\n297.2,259.333333333333\n297.1,261.2\n298.26,258.8\n298.433333333333,260.666666666667\n296.766666666667,259.666666666667\n298.45,252\n299.42,256.8\n300.1,269\n300.625,253\n300.55,259\n303.2,264\n302.3,264\n300.128571428571,266.285714285714\n297.4,259\n304.5,274\n301.48,279.6\n289.3,274\n295.125,300.5\n294.05,338\n290.95,310\n295.15,275\n295.833333333333,259.333333333333\n295.5,272\n295.5,270\n297.825,256\n298.075,258.5\n298.6,258.666666666667\n300.066666666667,253.333333333333\n298.34,252.8\n297.8,252.666666666667\n300.3,257\n300.75,250\n300.457142857143,252.571428571429\n301.3,252\n300.075,259\n301.566666666667,264\n298.3,278\n300.475,274\n300.95,269\n294.816666666667,280.666666666667\n296.2,300\n288.975,288\n281.95,302.666666666667\n289.6,323.666666666667\n294.266666666667,275.666666666667\n295.6,268\n295.5,268\n298.566666666667,258\n298.05,261\n298.3,255.333333333333\n300.5,252\n296,270\n297.85,264\n299.42,256.8\n298.7,244\n300.914285714286,256.857142857143\n302.1,269\n301.58,262.4\n300.366666666667,266.666666666667\n302.2,265\n298.275,270.5\n295,272.666666666667\n293.725,275\n299.4,278\n285.6,310\n283.733333333333,306.333333333333\n295.5,271\n294.7,259.5\n295.666666666667,254.666666666667\n295.75,261\n295.2,265.333333333333\n300.5,253\n298.7,253.5\n297.966666666667,264.666666666667\n295.5,258\n299.933333333333,250\n301.4,234\n300.016666666667,255.666666666667\n300.65,252.5\n301.525,256\n301.425,254\n302.4,266.333333333333\n299.2,260.666666666667\n292.833333333333,264.666666666667\n290.2,270\n295.55,293\n300.1,297\n292.85,306\n287.7,311.714285714286\n276.9,325\n293.52,275.6\n294.266666666667,272\n294.76,266.4\n296.983333333333,256.333333333333\n295.725,262.5\n297.625,254.5\n297.333333333333,255.333333333333\n299.175,255.5\n297.64,258.8\n300.5,250\n300.528571428571,255.142857142857\n301.34,258.8\n299.2,266\n301,248\n302.075,260.5\n299.85,271\n292.316666666667,267.333333333333\n293.233333333333,276.333333333333\n293.75,271\n295.966666666667,285\n294.72,300\n294.166666666667,290\n295.12,267.6\n291.95,278\n295.72,258.4\n295.4,259.2\n296.5,259.333333333333\n296.26,261.2\n294.6,268\n297.16,258.4\n298.88,254.4\n299.16,256\n299.65,260\n300.533333333333,261.333333333333\n301.4,255.333333333333\n302.24,258.8\n302.166666666667,264\n301.4,276\n303,275.5\n296.366666666667,269.333333333333\n297.3,273.333333333333\n303.85,288\n295.566666666667,290\n288.5,305\n293,315\n294.45,271.5\n295.228571428571,256.857142857143\n297.15,259\n297.4,256.5\n298.042857142857,255.714285714286\n301,252\n297.966666666667,263.333333333333\n299.8,256.666666666667\n299.1,254.333333333333\n300.75,252\n300.5,259\n301.1,250.5\n301.86,264.8\n298.5,275\n298.433333333333,256.666666666667\n298.266666666667,262.666666666667\n299.266666666667,273.333333333333\n300.95,274\n302.3,272\n300.025,283.5\n285.2,288\n290.866666666667,320\n293.02,275.6\n293.15,269.5\n294.1,267.142857142857\n295.95,255.5\n295.5,260\n298.95,256\n299.766666666667,249.333333333333\n298.05,255.5\n300.533333333333,251.333333333333\n299.033333333333,260\n300.566666666667,253.333333333333\n301.4,257\n301.433333333333,258.666666666667\n302.75,272\n297.533333333333,257.333333333333\n298.25,251\n299.99,263.4\n295.75,270\n302.3,272\n302.8,290\n290.2,282\n298.433333333333,292\n291.1,298\n295.75,262\n294.3,259\n294.55,262\n295.25,268\n297.34,256.4\n300.1,250\n297.066666666667,260.666666666667\n298.08,254.8\n300.3,252\n297.72,260.8\n298.6,253.333333333333\n301.26,254.8\n300.666666666667,257.333333333333\n302.3,261.5\n301.7,257\n298.1,256.5\n298.375,255.5\n297.8,264\n300.1,273.5\n298.2,279\n295.7,288.4\n302.314285714286,285.428571428571\n287.7,309\n302.7,311\n293.871428571429,262.571428571429\n293.7,266.285714285714\n295.4,261\n296.08,258\n300.1,246\n296.975,260\n298.566666666667,249.333333333333\n297.216666666667,257\n297.5,262.333333333333\n297.6,258\n302.3,244\n298.7,264\n301.88,259.6\n300.55,252\n301.266666666667,272\n299.466666666667,258.666666666667\n299.15,256\n298,262\n299.95,282.5\n293.675,289\n296.65,289.5\n298.76,289.6\n294.225,297.5\n292.983333333333,271\n294.733333333333,258\n293.85,260\n297.425,255.5\n296.54,258\n295.966666666667,255.333333333333\n298.95,257\n298.7,254.5\n295.78,260\n297.925,259\n300.55,261\n301.566666666667,257.333333333333\n301.6,257.6\n302.2,266\n297.6,260\n298.95,248\n300.533333333333,276.666666666667\n304.3,281\n296.7,261\n297.3,275.333333333333\n292.45,285\n292.04,296.4\n292.366666666667,306\n286.375,304\n293.3,264.666666666667\n292.275,270\n294.9,256.666666666667\n295.95,262.666666666667\n296.4,261.333333333333\n296.18,262\n298.64,252.4\n298.583333333333,249.666666666667\n300.2,251.333333333333\n298.35,253\n300.2,249.5\n300.233333333333,264\n301.866666666667,250\n301.3625,257\n300.5,251\n300.5,252\n300.966666666667,271.333333333333\n302.275,279.5\n299.78,272\n301.666666666667,296.666666666667\n297.45,279.5\n290.975,282\n299.033333333333,310.666666666667\n285.566666666667,298.666666666667\n293.04,266\n291.533333333333,266\n293.94,260\n295.4,258\n295.525,257.5\n298.18,256.4\n296.133333333333,252.666666666667\n298.9,251.333333333333\n297.6,267\n299.5,250\n301.05,256\n300.85,254.5\n301.266666666667,252.666666666667\n301.433333333333,264.666666666667\n301.36,267.6\n300.8,260.8\n300.98,265.6\n303.375,277.5\n296.45,270\n302.375,294\n300.38,279.2\n294.35,303\n291.583333333333,292\n282.7,300\n292.8,272.5\n295.833333333333,258\n291.7,269\n293.6,256\n296.34,256.4\n297.4,250\n291,255.333333333333\n293.35,257.5\n296,248\n300.625,253.5\n302.033333333333,250\n300.875,257.75\n300.2,261.333333333333\n300.75,273\n300.95,265\n304.25,272\n299.15,269\n297.5,274\n297.75,290\n296.333333333333,300\n302.133333333333,301.333333333333\n297.8,321\n293,266.666666666667\n293.133333333333,266\n294.1,266\n294.25,263\n286.5,259\n291.433333333333,257.333333333333\n297.72,250.8\n300.075,256.5\n301.2,248\n298,250\n296.266666666667,252.666666666667\n298.985714285714,250.857142857143\n302.8,250\n301.425,258.5\n302.6,269.333333333333\n299.85,272\n299.85,261.4\n300.175,260.5\n301.975,274.5\n296.566666666667,270.666666666667\n295.7,277\n295.02,304\n292.614285714286,298.571428571429\n289.766666666667,312.666666666667\n294.7,267\n295.666666666667,265.333333333333\n295.183333333333,259.333333333333\n281.875,248.5\n296.9,266\n299.62,257.6\n301.32,257.2\n301.65,255.5\n301.214285714286,256.285714285714\n298.46,254.4\n297.55,249.5\n298.7,252\n302.633333333333,262\n302,261.666666666667\n300.52,260\n300.8,266.8\n301.271428571429,263.142857142857\n302.725,272\n301.4,264\n296.583333333333,273.333333333333\n296.266666666667,290.666666666667\n294.1,302\n292.225,292.5\n295.12,302.8\n292.966666666667,266\n292.166666666667,265.333333333333\n288.266666666667,255.333333333333\n286.6,249\n299.685714285714,254.857142857143\n301.533333333333,252\n300.1,244\n301.266666666667,252\n301.6,249.6\n299.05,261\n301.65,254\n300.32,251.6\n302.4,261\n302.875,263.5\n300.833333333333,268.666666666667\n301.3,262.666666666667\n301.7,276\n301.7,277.333333333333\n299.3,258.666666666667\n298.56,273.6\n295.033333333333,286.666666666667\n296.2,298.5\n293.866666666667,288.666666666667\n301,300\n283.9,260\n283.95,249\n280.225,247.5\n304,248\n301.175,254\n300.72,258.8\n299.2,254\n302.4,249.6\n300.4,256.666666666667\n301.14,259.6\n302.7,250.666666666667\n301.266666666667,249.333333333333\n301.9,263\n301.4,248\n300.725,270.5\n302.55,269\n301.9,282\n293.6,283\n298.533333333333,292.666666666667\n295.36,292\n295.16,299.2\n289.933333333333,327.333333333333\n279.9,258\n283.7,252\n293.866666666667,250\n301.65,256\n300.96,260.4\n302.333333333333,248.666666666667\n302,252.666666666667\n304.9,246\n302.366666666667,255.666666666667\n300.466666666667,256.666666666667\n297.2,246.666666666667\n297.15,264\n302.625,257\n301.3,255\n300.366666666667,268\n301,254\n301.566666666667,269.333333333333\n298.3,275\n296.4,275\n296,258\n294.033333333333,279.111111111111\n296.025,292\n292.1,292.5\n289.9,321.333333333333\n298.357142857143,264.857142857143\n292.766666666667,262.666666666667\n299.783333333333,254.666666666667\n300.666666666667,258\n300.05,264\n302.64,254.8\n302.95,251\n302.64,265.6\n302.64,260\n299.4,248.5\n296.75,257.5\n297.6,250\n300.066666666667,258.333333333333\n301.975,271.5\n301,266\n300.4,271\n299.625,275\n297.6,269\n297.8,302\n297.3,273\n295.675,292.5\n294.025,300.5\n293.5,310\n298.7,257\n302,257.2\n301.566666666667,256.666666666667\n299.6,254\n300.08,256\n302.6,252\n301.666666666667,250.666666666667\n302.82,253.2\n302.2,259.5\n301.4,254.666666666667\n301.975,251\n296.733333333333,246.666666666667\n300.26,251.2\n301.85,269\n302.8,272\n300.8,273.333333333333\n299.15,255\n299.1,276\n298.557142857143,278.571428571429\n298.1,279.666666666667\n292.2,295\n294.375,296\n293.14,308.8\n290.08,338\n298.05,268\n303.2,256\n301.65,253\n299.275,261.5\n300,258.666666666667\n302.725,258\n301.45,268\n302.24,250.4\n301.45,254\n299.766666666667,251.333333333333\n301.4,246.666666666667\n301.4,268\n301.433333333333,258.666666666667\n300.78,259.2\n300.6,264.4\n300.32,270.8\n299.371428571429,267.142857142857\n300.366666666667,273.333333333333\n298.4,281.5\n297.542857142857,279.428571428571\n297.9,282\n294.98,298.4\n296.166666666667,297.333333333333\n299.62,261.2\n301.85,260\n301.4,256\n299.433333333333,257.333333333333\n299.5,260\n301.2,268.5\n301.133333333333,262\n301.55,258\n302.133333333333,266\n299.766666666667,250\n300.666666666667,258\n301.266666666667,258.333333333333\n300.425,258.5\n299.85,266\n301.05,268\n301.2,261\n299.033333333333,263.333333333333\n300.966666666667,286.666666666667\n299.825,280.5\n301,288\n293.6,281.333333333333\n295.3,292.5\n297.6,293\n296.066666666667,288"
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n275.5\n306.3"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n226.7\n343.3"
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
            "field": "data.temp"
          },
          "y": {
            "scale": "y",
            "field": "data.ozone"
          }
        },
        "ggvis": {
          "data": {
            "value": ".0"
          }
        }
      },
      "from": {
        "data": ".0"
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
      "title": "temp"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "ozone"
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
    "width": 480,
    "height": 384
  },
  "handlers": null
};
ggvis.getPlot("plot_id480436822").parseSpec(plot_id480436822_spec);
</script>
<!--/html_preserve-->
Environmental Conditions
------------------------

We suspect that group level effects are caused by environmental conditions that vary by locale. To test this idea, we sort each data point into one of four geographic regions:

``` r
means$locale <- "north america"  
means$locale[means$lat < 10] <- "south pacific"
means$locale[means$long > -80 & means$lat < 10] <- "south america"
means$locale[means$long > -80 & means$lat > 10] <- "north atlantic"
```

Model
-----

We suggest that ozone is highly correlated with temperature, but that a different relationship exists for each geographic region. We capture this relationship with a second order linear model of the form

\[ ozone = \alpha + \beta_{1} temperature + \sum_{locales} \beta_{i} locale_{i} + \\
   \sum_{locales} \beta_{j} interaction_{j} + \epsilon\]

This yields the following coefficients and model lines.

``` r
lm(ozone ~ temp + locale + temp:locale, data = means)
```

------------------------------------------------------------------------

    ## 
    ## Call:
    ## lm(formula = ozone ~ temp + locale + temp:locale, data = means)
    ## 
    ## Coefficients:
    ##               (Intercept)                       temp  
    ##                  917.7961                    -2.1519  
    ##      localenorth atlantic        localesouth america  
    ##                  495.7904                  -633.7339  
    ##       localesouth pacific  temp:localenorth atlantic  
    ##                  -52.2260                    -1.6498  
    ##  temp:localesouth america   temp:localesouth pacific  
    ##                    2.0587                     0.1126

Temperature vs Ozone Level by Area
----------------------------------

    ## Guessing formula = ozone ~ temp

<!--html_preserve-->

<nav class="ggvis-control"> <a class="ggvis-dropdown-toggle" title="Controls" onclick="return false;"></a>
<ul class="ggvis-dropdown">
<li>
Renderer: <a id="plot_id714852748_renderer_svg" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id714852748" data-renderer="svg">SVG</a> | <a id="plot_id714852748_renderer_canvas" class="ggvis-renderer-button" onclick="return false;" data-plot-id="plot_id714852748" data-renderer="canvas">Canvas</a>
</li>
<li>
<a id="plot_id714852748_download" class="ggvis-download" data-plot-id="plot_id714852748">Download</a>
</li>
</ul>
</nav>

<script type="text/javascript">
var plot_id714852748_spec = {
  "data": [
    {
      "name": ".0_flat",
      "format": {
        "type": "csv",
        "parse": {
          "temp": "number",
          "ozone": "number"
        }
      },
      "values": "\"temp\",\"ozone\",\"locale\"\n301.266666666667,253.333333333333,\"north america\"\n300.833333333333,258.666666666667,\"north america\"\n299.75,259,\"north america\"\n301.9,270,\"north america\"\n296.2,278,\"north america\"\n298.7,267,\"north america\"\n298.55,278,\"north america\"\n290.95,303,\"north america\"\n302.8,308,\"north america\"\n292.1,303.666666666667,\"north america\"\n297.1,292,\"north america\"\n300.55,259,\"north america\"\n303.2,264,\"north america\"\n302.3,264,\"north america\"\n300.128571428571,266.285714285714,\"north america\"\n297.4,259,\"north america\"\n304.5,274,\"north america\"\n301.48,279.6,\"north america\"\n289.3,274,\"north america\"\n295.125,300.5,\"north america\"\n294.05,338,\"north america\"\n290.95,310,\"north america\"\n301.3,252,\"north america\"\n300.075,259,\"north america\"\n301.566666666667,264,\"north america\"\n298.3,278,\"north america\"\n300.475,274,\"north america\"\n300.95,269,\"north america\"\n294.816666666667,280.666666666667,\"north america\"\n296.2,300,\"north america\"\n288.975,288,\"north america\"\n281.95,302.666666666667,\"north america\"\n289.6,323.666666666667,\"north america\"\n302.1,269,\"north america\"\n301.58,262.4,\"north america\"\n300.366666666667,266.666666666667,\"north america\"\n302.2,265,\"north america\"\n298.275,270.5,\"north america\"\n295,272.666666666667,\"north america\"\n293.725,275,\"north america\"\n299.4,278,\"north america\"\n285.6,310,\"north america\"\n283.733333333333,306.333333333333,\"north america\"\n301.525,256,\"north america\"\n301.425,254,\"north america\"\n302.4,266.333333333333,\"north america\"\n299.2,260.666666666667,\"north america\"\n292.833333333333,264.666666666667,\"north america\"\n290.2,270,\"north america\"\n295.55,293,\"north america\"\n300.1,297,\"north america\"\n292.85,306,\"north america\"\n287.7,311.714285714286,\"north america\"\n276.9,325,\"north america\"\n299.2,266,\"north america\"\n301,248,\"north america\"\n302.075,260.5,\"north america\"\n299.85,271,\"north america\"\n292.316666666667,267.333333333333,\"north america\"\n293.233333333333,276.333333333333,\"north america\"\n293.75,271,\"north america\"\n295.966666666667,285,\"north america\"\n294.72,300,\"north america\"\n294.166666666667,290,\"north america\"\n302.24,258.8,\"north america\"\n302.166666666667,264,\"north america\"\n301.4,276,\"north america\"\n303,275.5,\"north america\"\n296.366666666667,269.333333333333,\"north america\"\n297.3,273.333333333333,\"north america\"\n303.85,288,\"north america\"\n295.566666666667,290,\"north america\"\n288.5,305,\"north america\"\n293,315,\"north america\"\n301.1,250.5,\"north america\"\n301.86,264.8,\"north america\"\n298.5,275,\"north america\"\n298.433333333333,256.666666666667,\"north america\"\n298.266666666667,262.666666666667,\"north america\"\n299.266666666667,273.333333333333,\"north america\"\n300.95,274,\"north america\"\n302.3,272,\"north america\"\n300.025,283.5,\"north america\"\n285.2,288,\"north america\"\n290.866666666667,320,\"north america\"\n301.433333333333,258.666666666667,\"north america\"\n302.75,272,\"north america\"\n297.533333333333,257.333333333333,\"north america\"\n298.25,251,\"north america\"\n299.99,263.4,\"north america\"\n295.75,270,\"north america\"\n302.3,272,\"north america\"\n302.8,290,\"north america\"\n290.2,282,\"north america\"\n298.433333333333,292,\"north america\"\n291.1,298,\"north america\"\n302.3,261.5,\"north america\"\n301.7,257,\"north america\"\n298.1,256.5,\"north america\"\n298.375,255.5,\"north america\"\n297.8,264,\"north america\"\n300.1,273.5,\"north america\"\n298.2,279,\"north america\"\n295.7,288.4,\"north america\"\n302.314285714286,285.428571428571,\"north america\"\n287.7,309,\"north america\"\n302.7,311,\"north america\"\n300.55,252,\"north america\"\n301.266666666667,272,\"north america\"\n299.466666666667,258.666666666667,\"north america\"\n299.15,256,\"north america\"\n298,262,\"north america\"\n299.95,282.5,\"north america\"\n293.675,289,\"north america\"\n296.65,289.5,\"north america\"\n298.76,289.6,\"north america\"\n294.225,297.5,\"north america\"\n302.2,266,\"north america\"\n297.6,260,\"north america\"\n298.95,248,\"north america\"\n300.533333333333,276.666666666667,\"north america\"\n304.3,281,\"north america\"\n296.7,261,\"north america\"\n297.3,275.333333333333,\"north america\"\n292.45,285,\"north america\"\n292.04,296.4,\"north america\"\n292.366666666667,306,\"north america\"\n286.375,304,\"north america\"\n301.3625,257,\"north america\"\n300.5,251,\"north america\"\n300.5,252,\"north america\"\n300.966666666667,271.333333333333,\"north america\"\n302.275,279.5,\"north america\"\n299.78,272,\"north america\"\n301.666666666667,296.666666666667,\"north america\"\n297.45,279.5,\"north america\"\n290.975,282,\"north america\"\n299.033333333333,310.666666666667,\"north america\"\n285.566666666667,298.666666666667,\"north america\"\n301.433333333333,264.666666666667,\"north america\"\n301.36,267.6,\"north america\"\n300.8,260.8,\"north america\"\n300.98,265.6,\"north america\"\n303.375,277.5,\"north america\"\n296.45,270,\"north america\"\n302.375,294,\"north america\"\n300.38,279.2,\"north america\"\n294.35,303,\"north america\"\n291.583333333333,292,\"north america\"\n282.7,300,\"north america\"\n300.875,257.75,\"north atlantic\"\n300.2,261.333333333333,\"north atlantic\"\n300.75,273,\"north atlantic\"\n300.95,265,\"north atlantic\"\n304.25,272,\"north atlantic\"\n299.15,269,\"north atlantic\"\n297.5,274,\"north atlantic\"\n297.75,290,\"north atlantic\"\n296.333333333333,300,\"north atlantic\"\n302.133333333333,301.333333333333,\"north atlantic\"\n297.8,321,\"north atlantic\"\n301.425,258.5,\"north atlantic\"\n302.6,269.333333333333,\"north atlantic\"\n299.85,272,\"north atlantic\"\n299.85,261.4,\"north atlantic\"\n300.175,260.5,\"north atlantic\"\n301.975,274.5,\"north atlantic\"\n296.566666666667,270.666666666667,\"north atlantic\"\n295.7,277,\"north atlantic\"\n295.02,304,\"north atlantic\"\n292.614285714286,298.571428571429,\"north atlantic\"\n289.766666666667,312.666666666667,\"north atlantic\"\n302,261.666666666667,\"north atlantic\"\n300.52,260,\"north atlantic\"\n300.8,266.8,\"north atlantic\"\n301.271428571429,263.142857142857,\"north atlantic\"\n302.725,272,\"north atlantic\"\n301.4,264,\"north atlantic\"\n296.583333333333,273.333333333333,\"north atlantic\"\n296.266666666667,290.666666666667,\"north atlantic\"\n294.1,302,\"north atlantic\"\n292.225,292.5,\"north atlantic\"\n295.12,302.8,\"north atlantic\"\n302.875,263.5,\"north atlantic\"\n300.833333333333,268.666666666667,\"north atlantic\"\n301.3,262.666666666667,\"north atlantic\"\n301.7,276,\"north atlantic\"\n301.7,277.333333333333,\"north atlantic\"\n299.3,258.666666666667,\"north atlantic\"\n298.56,273.6,\"north atlantic\"\n295.033333333333,286.666666666667,\"north atlantic\"\n296.2,298.5,\"north atlantic\"\n293.866666666667,288.666666666667,\"north atlantic\"\n301,300,\"north atlantic\"\n301.9,263,\"north atlantic\"\n301.4,248,\"north atlantic\"\n300.725,270.5,\"north atlantic\"\n302.55,269,\"north atlantic\"\n301.9,282,\"north atlantic\"\n293.6,283,\"north atlantic\"\n298.533333333333,292.666666666667,\"north atlantic\"\n295.36,292,\"north atlantic\"\n295.16,299.2,\"north atlantic\"\n289.933333333333,327.333333333333,\"north atlantic\"\n301.3,255,\"north atlantic\"\n300.366666666667,268,\"north atlantic\"\n301,254,\"north atlantic\"\n301.566666666667,269.333333333333,\"north atlantic\"\n298.3,275,\"north atlantic\"\n296.4,275,\"north atlantic\"\n296,258,\"north atlantic\"\n294.033333333333,279.111111111111,\"north atlantic\"\n296.025,292,\"north atlantic\"\n292.1,292.5,\"north atlantic\"\n289.9,321.333333333333,\"north atlantic\"\n300.066666666667,258.333333333333,\"north atlantic\"\n301.975,271.5,\"north atlantic\"\n301,266,\"north atlantic\"\n300.4,271,\"north atlantic\"\n299.625,275,\"north atlantic\"\n297.6,269,\"north atlantic\"\n297.8,302,\"north atlantic\"\n297.3,273,\"north atlantic\"\n295.675,292.5,\"north atlantic\"\n294.025,300.5,\"north atlantic\"\n293.5,310,\"north atlantic\"\n301.85,269,\"north atlantic\"\n302.8,272,\"north atlantic\"\n300.8,273.333333333333,\"north atlantic\"\n299.15,255,\"north atlantic\"\n299.1,276,\"north atlantic\"\n298.557142857143,278.571428571429,\"north atlantic\"\n298.1,279.666666666667,\"north atlantic\"\n292.2,295,\"north atlantic\"\n294.375,296,\"north atlantic\"\n293.14,308.8,\"north atlantic\"\n290.08,338,\"north atlantic\"\n300.78,259.2,\"north atlantic\"\n300.6,264.4,\"north atlantic\"\n300.32,270.8,\"north atlantic\"\n299.371428571429,267.142857142857,\"north atlantic\"\n300.366666666667,273.333333333333,\"north atlantic\"\n298.4,281.5,\"north atlantic\"\n297.542857142857,279.428571428571,\"north atlantic\"\n297.9,282,\"north atlantic\"\n294.98,298.4,\"north atlantic\"\n296.166666666667,297.333333333333,\"north atlantic\"\n299.85,266,\"north atlantic\"\n301.05,268,\"north atlantic\"\n301.2,261,\"north atlantic\"\n299.033333333333,263.333333333333,\"north atlantic\"\n300.966666666667,286.666666666667,\"north atlantic\"\n299.825,280.5,\"north atlantic\"\n301,288,\"north atlantic\"\n293.6,281.333333333333,\"north atlantic\"\n295.3,292.5,\"north atlantic\"\n297.6,293,\"north atlantic\"\n296.066666666667,288,\"north atlantic\"\n292.8,272.5,\"south america\"\n295.833333333333,258,\"south america\"\n291.7,269,\"south america\"\n293.6,256,\"south america\"\n296.34,256.4,\"south america\"\n297.4,250,\"south america\"\n291,255.333333333333,\"south america\"\n293.35,257.5,\"south america\"\n296,248,\"south america\"\n300.625,253.5,\"south america\"\n302.033333333333,250,\"south america\"\n293,266.666666666667,\"south america\"\n293.133333333333,266,\"south america\"\n294.1,266,\"south america\"\n294.25,263,\"south america\"\n286.5,259,\"south america\"\n291.433333333333,257.333333333333,\"south america\"\n297.72,250.8,\"south america\"\n300.075,256.5,\"south america\"\n301.2,248,\"south america\"\n298,250,\"south america\"\n296.266666666667,252.666666666667,\"south america\"\n298.985714285714,250.857142857143,\"south america\"\n302.8,250,\"south america\"\n294.7,267,\"south america\"\n295.666666666667,265.333333333333,\"south america\"\n295.183333333333,259.333333333333,\"south america\"\n281.875,248.5,\"south america\"\n296.9,266,\"south america\"\n299.62,257.6,\"south america\"\n301.32,257.2,\"south america\"\n301.65,255.5,\"south america\"\n301.214285714286,256.285714285714,\"south america\"\n298.46,254.4,\"south america\"\n297.55,249.5,\"south america\"\n298.7,252,\"south america\"\n302.633333333333,262,\"south america\"\n292.966666666667,266,\"south america\"\n292.166666666667,265.333333333333,\"south america\"\n288.266666666667,255.333333333333,\"south america\"\n286.6,249,\"south america\"\n299.685714285714,254.857142857143,\"south america\"\n301.533333333333,252,\"south america\"\n300.1,244,\"south america\"\n301.266666666667,252,\"south america\"\n301.6,249.6,\"south america\"\n299.05,261,\"south america\"\n301.65,254,\"south america\"\n300.32,251.6,\"south america\"\n302.4,261,\"south america\"\n283.9,260,\"south america\"\n283.95,249,\"south america\"\n280.225,247.5,\"south america\"\n304,248,\"south america\"\n301.175,254,\"south america\"\n300.72,258.8,\"south america\"\n299.2,254,\"south america\"\n302.4,249.6,\"south america\"\n300.4,256.666666666667,\"south america\"\n301.14,259.6,\"south america\"\n302.7,250.666666666667,\"south america\"\n301.266666666667,249.333333333333,\"south america\"\n279.9,258,\"south america\"\n283.7,252,\"south america\"\n293.866666666667,250,\"south america\"\n301.65,256,\"south america\"\n300.96,260.4,\"south america\"\n302.333333333333,248.666666666667,\"south america\"\n302,252.666666666667,\"south america\"\n304.9,246,\"south america\"\n302.366666666667,255.666666666667,\"south america\"\n300.466666666667,256.666666666667,\"south america\"\n297.2,246.666666666667,\"south america\"\n297.15,264,\"south america\"\n302.625,257,\"south america\"\n298.357142857143,264.857142857143,\"south america\"\n292.766666666667,262.666666666667,\"south america\"\n299.783333333333,254.666666666667,\"south america\"\n300.666666666667,258,\"south america\"\n300.05,264,\"south america\"\n302.64,254.8,\"south america\"\n302.95,251,\"south america\"\n302.64,265.6,\"south america\"\n302.64,260,\"south america\"\n299.4,248.5,\"south america\"\n296.75,257.5,\"south america\"\n297.6,250,\"south america\"\n298.7,257,\"south america\"\n302,257.2,\"south america\"\n301.566666666667,256.666666666667,\"south america\"\n299.6,254,\"south america\"\n300.08,256,\"south america\"\n302.6,252,\"south america\"\n301.666666666667,250.666666666667,\"south america\"\n302.82,253.2,\"south america\"\n302.2,259.5,\"south america\"\n301.4,254.666666666667,\"south america\"\n301.975,251,\"south america\"\n296.733333333333,246.666666666667,\"south america\"\n300.26,251.2,\"south america\"\n298.05,268,\"south america\"\n303.2,256,\"south america\"\n301.65,253,\"south america\"\n299.275,261.5,\"south america\"\n300,258.666666666667,\"south america\"\n302.725,258,\"south america\"\n301.45,268,\"south america\"\n302.24,250.4,\"south america\"\n301.45,254,\"south america\"\n299.766666666667,251.333333333333,\"south america\"\n301.4,246.666666666667,\"south america\"\n301.4,268,\"south america\"\n301.433333333333,258.666666666667,\"south america\"\n299.62,261.2,\"south america\"\n301.85,260,\"south america\"\n301.4,256,\"south america\"\n299.433333333333,257.333333333333,\"south america\"\n299.5,260,\"south america\"\n301.2,268.5,\"south america\"\n301.133333333333,262,\"south america\"\n301.55,258,\"south america\"\n302.133333333333,266,\"south america\"\n299.766666666667,250,\"south america\"\n300.666666666667,258,\"south america\"\n301.266666666667,258.333333333333,\"south america\"\n300.425,258.5,\"south america\"\n296.133333333333,269.333333333333,\"south pacific\"\n295.725,268.5,\"south pacific\"\n298.05,248,\"south pacific\"\n296,265,\"south pacific\"\n296.88,260.8,\"south pacific\"\n296.9,262,\"south pacific\"\n299.5,250.666666666667,\"south pacific\"\n298.433333333333,254.666666666667,\"south pacific\"\n301,232,\"south pacific\"\n296.933333333333,256,\"south pacific\"\n297.8,248,\"south pacific\"\n298.75,250,\"south pacific\"\n300.5,252,\"south pacific\"\n294.55,285,\"south pacific\"\n297.066666666667,258,\"south pacific\"\n296,263,\"south pacific\"\n297.433333333333,259.666666666667,\"south pacific\"\n297.2,259.333333333333,\"south pacific\"\n297.1,261.2,\"south pacific\"\n298.26,258.8,\"south pacific\"\n298.433333333333,260.666666666667,\"south pacific\"\n296.766666666667,259.666666666667,\"south pacific\"\n298.45,252,\"south pacific\"\n299.42,256.8,\"south pacific\"\n300.1,269,\"south pacific\"\n300.625,253,\"south pacific\"\n295.15,275,\"south pacific\"\n295.833333333333,259.333333333333,\"south pacific\"\n295.5,272,\"south pacific\"\n295.5,270,\"south pacific\"\n297.825,256,\"south pacific\"\n298.075,258.5,\"south pacific\"\n298.6,258.666666666667,\"south pacific\"\n300.066666666667,253.333333333333,\"south pacific\"\n298.34,252.8,\"south pacific\"\n297.8,252.666666666667,\"south pacific\"\n300.3,257,\"south pacific\"\n300.75,250,\"south pacific\"\n300.457142857143,252.571428571429,\"south pacific\"\n294.266666666667,275.666666666667,\"south pacific\"\n295.6,268,\"south pacific\"\n295.5,268,\"south pacific\"\n298.566666666667,258,\"south pacific\"\n298.05,261,\"south pacific\"\n298.3,255.333333333333,\"south pacific\"\n300.5,252,\"south pacific\"\n296,270,\"south pacific\"\n297.85,264,\"south pacific\"\n299.42,256.8,\"south pacific\"\n298.7,244,\"south pacific\"\n300.914285714286,256.857142857143,\"south pacific\"\n295.5,271,\"south pacific\"\n294.7,259.5,\"south pacific\"\n295.666666666667,254.666666666667,\"south pacific\"\n295.75,261,\"south pacific\"\n295.2,265.333333333333,\"south pacific\"\n300.5,253,\"south pacific\"\n298.7,253.5,\"south pacific\"\n297.966666666667,264.666666666667,\"south pacific\"\n295.5,258,\"south pacific\"\n299.933333333333,250,\"south pacific\"\n301.4,234,\"south pacific\"\n300.016666666667,255.666666666667,\"south pacific\"\n300.65,252.5,\"south pacific\"\n293.52,275.6,\"south pacific\"\n294.266666666667,272,\"south pacific\"\n294.76,266.4,\"south pacific\"\n296.983333333333,256.333333333333,\"south pacific\"\n295.725,262.5,\"south pacific\"\n297.625,254.5,\"south pacific\"\n297.333333333333,255.333333333333,\"south pacific\"\n299.175,255.5,\"south pacific\"\n297.64,258.8,\"south pacific\"\n300.5,250,\"south pacific\"\n300.528571428571,255.142857142857,\"south pacific\"\n301.34,258.8,\"south pacific\"\n295.12,267.6,\"south pacific\"\n291.95,278,\"south pacific\"\n295.72,258.4,\"south pacific\"\n295.4,259.2,\"south pacific\"\n296.5,259.333333333333,\"south pacific\"\n296.26,261.2,\"south pacific\"\n294.6,268,\"south pacific\"\n297.16,258.4,\"south pacific\"\n298.88,254.4,\"south pacific\"\n299.16,256,\"south pacific\"\n299.65,260,\"south pacific\"\n300.533333333333,261.333333333333,\"south pacific\"\n301.4,255.333333333333,\"south pacific\"\n294.45,271.5,\"south pacific\"\n295.228571428571,256.857142857143,\"south pacific\"\n297.15,259,\"south pacific\"\n297.4,256.5,\"south pacific\"\n298.042857142857,255.714285714286,\"south pacific\"\n301,252,\"south pacific\"\n297.966666666667,263.333333333333,\"south pacific\"\n299.8,256.666666666667,\"south pacific\"\n299.1,254.333333333333,\"south pacific\"\n300.75,252,\"south pacific\"\n300.5,259,\"south pacific\"\n293.02,275.6,\"south pacific\"\n293.15,269.5,\"south pacific\"\n294.1,267.142857142857,\"south pacific\"\n295.95,255.5,\"south pacific\"\n295.5,260,\"south pacific\"\n298.95,256,\"south pacific\"\n299.766666666667,249.333333333333,\"south pacific\"\n298.05,255.5,\"south pacific\"\n300.533333333333,251.333333333333,\"south pacific\"\n299.033333333333,260,\"south pacific\"\n300.566666666667,253.333333333333,\"south pacific\"\n301.4,257,\"south pacific\"\n295.75,262,\"south pacific\"\n294.3,259,\"south pacific\"\n294.55,262,\"south pacific\"\n295.25,268,\"south pacific\"\n297.34,256.4,\"south pacific\"\n300.1,250,\"south pacific\"\n297.066666666667,260.666666666667,\"south pacific\"\n298.08,254.8,\"south pacific\"\n300.3,252,\"south pacific\"\n297.72,260.8,\"south pacific\"\n298.6,253.333333333333,\"south pacific\"\n301.26,254.8,\"south pacific\"\n300.666666666667,257.333333333333,\"south pacific\"\n293.871428571429,262.571428571429,\"south pacific\"\n293.7,266.285714285714,\"south pacific\"\n295.4,261,\"south pacific\"\n296.08,258,\"south pacific\"\n300.1,246,\"south pacific\"\n296.975,260,\"south pacific\"\n298.566666666667,249.333333333333,\"south pacific\"\n297.216666666667,257,\"south pacific\"\n297.5,262.333333333333,\"south pacific\"\n297.6,258,\"south pacific\"\n302.3,244,\"south pacific\"\n298.7,264,\"south pacific\"\n301.88,259.6,\"south pacific\"\n292.983333333333,271,\"south pacific\"\n294.733333333333,258,\"south pacific\"\n293.85,260,\"south pacific\"\n297.425,255.5,\"south pacific\"\n296.54,258,\"south pacific\"\n295.966666666667,255.333333333333,\"south pacific\"\n298.95,257,\"south pacific\"\n298.7,254.5,\"south pacific\"\n295.78,260,\"south pacific\"\n297.925,259,\"south pacific\"\n300.55,261,\"south pacific\"\n301.566666666667,257.333333333333,\"south pacific\"\n301.6,257.6,\"south pacific\"\n293.3,264.666666666667,\"south pacific\"\n292.275,270,\"south pacific\"\n294.9,256.666666666667,\"south pacific\"\n295.95,262.666666666667,\"south pacific\"\n296.4,261.333333333333,\"south pacific\"\n296.18,262,\"south pacific\"\n298.64,252.4,\"south pacific\"\n298.583333333333,249.666666666667,\"south pacific\"\n300.2,251.333333333333,\"south pacific\"\n298.35,253,\"south pacific\"\n300.2,249.5,\"south pacific\"\n300.233333333333,264,\"south pacific\"\n301.866666666667,250,\"south pacific\"\n293.04,266,\"south pacific\"\n291.533333333333,266,\"south pacific\"\n293.94,260,\"south pacific\"\n295.4,258,\"south pacific\"\n295.525,257.5,\"south pacific\"\n298.18,256.4,\"south pacific\"\n296.133333333333,252.666666666667,\"south pacific\"\n298.9,251.333333333333,\"south pacific\"\n297.6,267,\"south pacific\"\n299.5,250,\"south pacific\"\n301.05,256,\"south pacific\"\n300.85,254.5,\"south pacific\"\n301.266666666667,252.666666666667,\"south pacific\""
    },
    {
      "name": ".0",
      "source": ".0_flat",
      "transform": [
        {
          "type": "treefacet",
          "keys": [
            "data.locale"
          ]
        }
      ]
    },
    {
      "name": ".0/model_prediction1_flat",
      "format": {
        "type": "csv",
        "parse": {
          "pred_": "number",
          "resp_": "number"
        }
      },
      "values": "\"pred_\",\"resp_\",\"locale\"\n276.9,321.932924026563,\"north america\"\n277.249367088608,321.181118433197,\"north america\"\n277.598734177215,320.429312839831,\"north america\"\n277.948101265823,319.677507246465,\"north america\"\n278.29746835443,318.925701653099,\"north america\"\n278.646835443038,318.173896059733,\"north america\"\n278.996202531646,317.422090466367,\"north america\"\n279.345569620253,316.670284873001,\"north america\"\n279.694936708861,315.918479279636,\"north america\"\n280.044303797468,315.16667368627,\"north america\"\n280.393670886076,314.414868092904,\"north america\"\n280.743037974684,313.663062499538,\"north america\"\n281.092405063291,312.911256906172,\"north america\"\n281.441772151899,312.159451312806,\"north america\"\n281.791139240506,311.40764571944,\"north america\"\n282.140506329114,310.655840126074,\"north america\"\n282.489873417722,309.904034532708,\"north america\"\n282.839240506329,309.152228939342,\"north america\"\n283.188607594937,308.400423345976,\"north america\"\n283.537974683544,307.64861775261,\"north america\"\n283.887341772152,306.896812159244,\"north america\"\n284.236708860759,306.145006565879,\"north america\"\n284.586075949367,305.393200972513,\"north america\"\n284.935443037975,304.641395379147,\"north america\"\n285.284810126582,303.889589785781,\"north america\"\n285.63417721519,303.137784192415,\"north america\"\n285.983544303797,302.385978599049,\"north america\"\n286.332911392405,301.634173005683,\"north america\"\n286.682278481013,300.882367412317,\"north america\"\n287.03164556962,300.130561818951,\"north america\"\n287.381012658228,299.378756225585,\"north america\"\n287.730379746835,298.626950632219,\"north america\"\n288.079746835443,297.875145038853,\"north america\"\n288.429113924051,297.123339445488,\"north america\"\n288.778481012658,296.371533852122,\"north america\"\n289.127848101266,295.619728258756,\"north america\"\n289.477215189873,294.86792266539,\"north america\"\n289.826582278481,294.116117072024,\"north america\"\n290.175949367089,293.364311478658,\"north america\"\n290.525316455696,292.612505885292,\"north america\"\n290.874683544304,291.860700291926,\"north america\"\n291.224050632911,291.10889469856,\"north america\"\n291.573417721519,290.357089105194,\"north america\"\n291.922784810127,289.605283511828,\"north america\"\n292.272151898734,288.853477918462,\"north america\"\n292.621518987342,288.101672325097,\"north america\"\n292.970886075949,287.349866731731,\"north america\"\n293.320253164557,286.598061138365,\"north america\"\n293.669620253165,285.846255544999,\"north america\"\n294.018987341772,285.094449951633,\"north america\"\n294.36835443038,284.342644358267,\"north america\"\n294.717721518987,283.590838764901,\"north america\"\n295.067088607595,282.839033171535,\"north america\"\n295.416455696203,282.087227578169,\"north america\"\n295.76582278481,281.335421984803,\"north america\"\n296.115189873418,280.583616391437,\"north america\"\n296.464556962025,279.831810798072,\"north america\"\n296.813924050633,279.080005204706,\"north america\"\n297.163291139241,278.32819961134,\"north america\"\n297.512658227848,277.576394017974,\"north america\"\n297.862025316456,276.824588424608,\"north america\"\n298.211392405063,276.072782831242,\"north america\"\n298.560759493671,275.320977237876,\"north america\"\n298.910126582278,274.56917164451,\"north america\"\n299.259493670886,273.817366051144,\"north america\"\n299.608860759494,273.065560457778,\"north america\"\n299.958227848101,272.313754864412,\"north america\"\n300.307594936709,271.561949271046,\"north america\"\n300.656962025316,270.810143677681,\"north america\"\n301.006329113924,270.058338084315,\"north america\"\n301.355696202532,269.306532490949,\"north america\"\n301.705063291139,268.554726897583,\"north america\"\n302.054430379747,267.802921304217,\"north america\"\n302.403797468354,267.051115710851,\"north america\"\n302.753164556962,266.299310117485,\"north america\"\n303.10253164557,265.547504524119,\"north america\"\n303.451898734177,264.795698930753,\"north america\"\n303.801265822785,264.043893337387,\"north america\"\n304.150632911392,263.292087744021,\"north america\"\n304.5,262.540282150655,\"north america\"\n289.766666666667,311.976009581654,\"north atlantic\"\n289.95,311.279028394673,\"north atlantic\"\n290.133333333333,310.582047207691,\"north atlantic\"\n290.316666666667,309.88506602071,\"north atlantic\"\n290.5,309.188084833728,\"north atlantic\"\n290.683333333333,308.491103646747,\"north atlantic\"\n290.866666666667,307.794122459765,\"north atlantic\"\n291.05,307.097141272783,\"north atlantic\"\n291.233333333333,306.400160085802,\"north atlantic\"\n291.416666666667,305.70317889882,\"north atlantic\"\n291.6,305.006197711839,\"north atlantic\"\n291.783333333333,304.309216524857,\"north atlantic\"\n291.966666666667,303.612235337876,\"north atlantic\"\n292.15,302.915254150894,\"north atlantic\"\n292.333333333333,302.218272963912,\"north atlantic\"\n292.516666666667,301.521291776931,\"north atlantic\"\n292.7,300.824310589949,\"north atlantic\"\n292.883333333333,300.127329402968,\"north atlantic\"\n293.066666666667,299.430348215986,\"north atlantic\"\n293.25,298.733367029005,\"north atlantic\"\n293.433333333333,298.036385842023,\"north atlantic\"\n293.616666666667,297.339404655041,\"north atlantic\"\n293.8,296.64242346806,\"north atlantic\"\n293.983333333333,295.945442281078,\"north atlantic\"\n294.166666666667,295.248461094097,\"north atlantic\"\n294.35,294.551479907115,\"north atlantic\"\n294.533333333333,293.854498720134,\"north atlantic\"\n294.716666666667,293.157517533152,\"north atlantic\"\n294.9,292.46053634617,\"north atlantic\"\n295.083333333333,291.763555159189,\"north atlantic\"\n295.266666666667,291.066573972207,\"north atlantic\"\n295.45,290.369592785226,\"north atlantic\"\n295.633333333333,289.672611598244,\"north atlantic\"\n295.816666666667,288.975630411263,\"north atlantic\"\n296,288.278649224281,\"north atlantic\"\n296.183333333333,287.581668037299,\"north atlantic\"\n296.366666666667,286.884686850318,\"north atlantic\"\n296.55,286.187705663336,\"north atlantic\"\n296.733333333333,285.490724476355,\"north atlantic\"\n296.916666666667,284.793743289373,\"north atlantic\"\n297.1,284.096762102392,\"north atlantic\"\n297.283333333333,283.39978091541,\"north atlantic\"\n297.466666666667,282.702799728429,\"north atlantic\"\n297.65,282.005818541447,\"north atlantic\"\n297.833333333333,281.308837354465,\"north atlantic\"\n298.016666666667,280.611856167484,\"north atlantic\"\n298.2,279.914874980502,\"north atlantic\"\n298.383333333333,279.21789379352,\"north atlantic\"\n298.566666666667,278.520912606539,\"north atlantic\"\n298.75,277.823931419557,\"north atlantic\"\n298.933333333333,277.126950232576,\"north atlantic\"\n299.116666666667,276.429969045594,\"north atlantic\"\n299.3,275.732987858613,\"north atlantic\"\n299.483333333333,275.036006671631,\"north atlantic\"\n299.666666666667,274.339025484649,\"north atlantic\"\n299.85,273.642044297668,\"north atlantic\"\n300.033333333333,272.945063110687,\"north atlantic\"\n300.216666666667,272.248081923705,\"north atlantic\"\n300.4,271.551100736723,\"north atlantic\"\n300.583333333333,270.854119549742,\"north atlantic\"\n300.766666666667,270.15713836276,\"north atlantic\"\n300.95,269.460157175779,\"north atlantic\"\n301.133333333333,268.763175988797,\"north atlantic\"\n301.316666666667,268.066194801816,\"north atlantic\"\n301.5,267.369213614834,\"north atlantic\"\n301.683333333333,266.672232427852,\"north atlantic\"\n301.866666666667,265.975251240871,\"north atlantic\"\n302.05,265.278270053889,\"north atlantic\"\n302.233333333333,264.581288866907,\"north atlantic\"\n302.416666666667,263.884307679926,\"north atlantic\"\n302.6,263.187326492944,\"north atlantic\"\n302.783333333333,262.490345305963,\"north atlantic\"\n302.966666666667,261.793364118981,\"north atlantic\"\n303.15,261.096382932,\"north atlantic\"\n303.333333333333,260.399401745018,\"north atlantic\"\n303.516666666667,259.702420558037,\"north atlantic\"\n303.7,259.005439371055,\"north atlantic\"\n303.883333333333,258.308458184074,\"north atlantic\"\n304.066666666667,257.611476997092,\"north atlantic\"\n304.25,256.91449581011,\"north atlantic\"\n279.9,257.97286605146,\"south america\"\n280.216455696203,257.943369459269,\"south america\"\n280.532911392405,257.913872867077,\"south america\"\n280.849367088608,257.884376274885,\"south america\"\n281.16582278481,257.854879682694,\"south america\"\n281.482278481013,257.825383090502,\"south america\"\n281.798734177215,257.79588649831,\"south america\"\n282.115189873418,257.766389906119,\"south america\"\n282.43164556962,257.736893313927,\"south america\"\n282.748101265823,257.707396721735,\"south america\"\n283.064556962025,257.677900129544,\"south america\"\n283.381012658228,257.648403537352,\"south america\"\n283.69746835443,257.61890694516,\"south america\"\n284.013924050633,257.589410352969,\"south america\"\n284.330379746835,257.559913760777,\"south america\"\n284.646835443038,257.530417168585,\"south america\"\n284.96329113924,257.500920576394,\"south america\"\n285.279746835443,257.471423984202,\"south america\"\n285.596202531646,257.44192739201,\"south america\"\n285.912658227848,257.412430799819,\"south america\"\n286.229113924051,257.382934207627,\"south america\"\n286.545569620253,257.353437615435,\"south america\"\n286.862025316456,257.323941023244,\"south america\"\n287.178481012658,257.294444431052,\"south america\"\n287.494936708861,257.26494783886,\"south america\"\n287.811392405063,257.235451246669,\"south america\"\n288.127848101266,257.205954654477,\"south america\"\n288.444303797468,257.176458062285,\"south america\"\n288.760759493671,257.146961470093,\"south america\"\n289.077215189873,257.117464877902,\"south america\"\n289.393670886076,257.08796828571,\"south america\"\n289.710126582278,257.058471693518,\"south america\"\n290.026582278481,257.028975101327,\"south america\"\n290.343037974684,256.999478509135,\"south america\"\n290.659493670886,256.969981916943,\"south america\"\n290.975949367089,256.940485324752,\"south america\"\n291.292405063291,256.91098873256,\"south america\"\n291.608860759494,256.881492140368,\"south america\"\n291.925316455696,256.851995548177,\"south america\"\n292.241772151899,256.822498955985,\"south america\"\n292.558227848101,256.793002363793,\"south america\"\n292.874683544304,256.763505771602,\"south america\"\n293.191139240506,256.73400917941,\"south america\"\n293.507594936709,256.704512587218,\"south america\"\n293.824050632911,256.675015995027,\"south america\"\n294.140506329114,256.645519402835,\"south america\"\n294.456962025316,256.616022810643,\"south america\"\n294.773417721519,256.586526218452,\"south america\"\n295.089873417721,256.55702962626,\"south america\"\n295.406329113924,256.527533034068,\"south america\"\n295.722784810127,256.498036441877,\"south america\"\n296.039240506329,256.468539849685,\"south america\"\n296.355696202532,256.439043257493,\"south america\"\n296.672151898734,256.409546665301,\"south america\"\n296.988607594937,256.38005007311,\"south america\"\n297.305063291139,256.350553480918,\"south america\"\n297.621518987342,256.321056888726,\"south america\"\n297.937974683544,256.291560296535,\"south america\"\n298.254430379747,256.262063704343,\"south america\"\n298.570886075949,256.232567112151,\"south america\"\n298.887341772152,256.20307051996,\"south america\"\n299.203797468354,256.173573927768,\"south america\"\n299.520253164557,256.144077335576,\"south america\"\n299.836708860759,256.114580743385,\"south america\"\n300.153164556962,256.085084151193,\"south america\"\n300.469620253165,256.055587559001,\"south america\"\n300.786075949367,256.02609096681,\"south america\"\n301.10253164557,255.996594374618,\"south america\"\n301.418987341772,255.967097782426,\"south america\"\n301.735443037975,255.937601190235,\"south america\"\n302.051898734177,255.908104598043,\"south america\"\n302.36835443038,255.878608005851,\"south america\"\n302.684810126582,255.84911141366,\"south america\"\n303.001265822785,255.819614821468,\"south america\"\n303.317721518987,255.790118229276,\"south america\"\n303.63417721519,255.760621637085,\"south america\"\n303.950632911392,255.731125044893,\"south america\"\n304.267088607595,255.701628452701,\"south america\"\n304.583544303797,255.67213186051,\"south america\"\n304.9,255.642635268318,\"south america\"\n291.533333333333,271.046097201634,\"south pacific\"\n291.669620253165,270.76816724897,\"south pacific\"\n291.805907172996,270.490237296306,\"south pacific\"\n291.942194092827,270.212307343642,\"south pacific\"\n292.078481012658,269.934377390978,\"south pacific\"\n292.214767932489,269.656447438314,\"south pacific\"\n292.351054852321,269.37851748565,\"south pacific\"\n292.487341772152,269.100587532986,\"south pacific\"\n292.623628691983,268.822657580322,\"south pacific\"\n292.759915611814,268.544727627658,\"south pacific\"\n292.896202531646,268.266797674994,\"south pacific\"\n293.032489451477,267.98886772233,\"south pacific\"\n293.168776371308,267.710937769666,\"south pacific\"\n293.305063291139,267.433007817002,\"south pacific\"\n293.44135021097,267.155077864338,\"south pacific\"\n293.577637130802,266.877147911674,\"south pacific\"\n293.713924050633,266.59921795901,\"south pacific\"\n293.850210970464,266.321288006346,\"south pacific\"\n293.986497890295,266.043358053682,\"south pacific\"\n294.122784810127,265.765428101018,\"south pacific\"\n294.259071729958,265.487498148354,\"south pacific\"\n294.395358649789,265.209568195689,\"south pacific\"\n294.53164556962,264.931638243025,\"south pacific\"\n294.667932489451,264.653708290361,\"south pacific\"\n294.804219409283,264.375778337697,\"south pacific\"\n294.940506329114,264.097848385033,\"south pacific\"\n295.076793248945,263.819918432369,\"south pacific\"\n295.213080168776,263.541988479705,\"south pacific\"\n295.349367088608,263.264058527041,\"south pacific\"\n295.485654008439,262.986128574377,\"south pacific\"\n295.62194092827,262.708198621713,\"south pacific\"\n295.758227848101,262.430268669049,\"south pacific\"\n295.894514767932,262.152338716385,\"south pacific\"\n296.030801687764,261.874408763721,\"south pacific\"\n296.167088607595,261.596478811057,\"south pacific\"\n296.303375527426,261.318548858393,\"south pacific\"\n296.439662447257,261.040618905729,\"south pacific\"\n296.575949367089,260.762688953065,\"south pacific\"\n296.71223628692,260.484759000401,\"south pacific\"\n296.848523206751,260.206829047737,\"south pacific\"\n296.984810126582,259.928899095073,\"south pacific\"\n297.121097046413,259.650969142409,\"south pacific\"\n297.257383966245,259.373039189745,\"south pacific\"\n297.393670886076,259.095109237081,\"south pacific\"\n297.529957805907,258.817179284417,\"south pacific\"\n297.666244725738,258.539249331753,\"south pacific\"\n297.80253164557,258.261319379089,\"south pacific\"\n297.938818565401,257.983389426425,\"south pacific\"\n298.075105485232,257.705459473761,\"south pacific\"\n298.211392405063,257.427529521097,\"south pacific\"\n298.347679324895,257.149599568433,\"south pacific\"\n298.483966244726,256.871669615769,\"south pacific\"\n298.620253164557,256.593739663105,\"south pacific\"\n298.756540084388,256.315809710441,\"south pacific\"\n298.892827004219,256.037879757777,\"south pacific\"\n299.029113924051,255.759949805113,\"south pacific\"\n299.165400843882,255.482019852449,\"south pacific\"\n299.301687763713,255.204089899785,\"south pacific\"\n299.437974683544,254.92615994712,\"south pacific\"\n299.574261603376,254.648229994457,\"south pacific\"\n299.710548523207,254.370300041793,\"south pacific\"\n299.846835443038,254.092370089128,\"south pacific\"\n299.983122362869,253.814440136464,\"south pacific\"\n300.1194092827,253.5365101838,\"south pacific\"\n300.255696202532,253.258580231136,\"south pacific\"\n300.391983122363,252.980650278472,\"south pacific\"\n300.528270042194,252.702720325808,\"south pacific\"\n300.664556962025,252.424790373144,\"south pacific\"\n300.800843881857,252.14686042048,\"south pacific\"\n300.937130801688,251.868930467816,\"south pacific\"\n301.073417721519,251.591000515152,\"south pacific\"\n301.20970464135,251.313070562488,\"south pacific\"\n301.345991561181,251.035140609824,\"south pacific\"\n301.482278481013,250.75721065716,\"south pacific\"\n301.618565400844,250.479280704496,\"south pacific\"\n301.754852320675,250.201350751832,\"south pacific\"\n301.891139240506,249.923420799168,\"south pacific\"\n302.027426160338,249.645490846504,\"south pacific\"\n302.163713080169,249.36756089384,\"south pacific\"\n302.3,249.089630941176,\"south pacific\""
    },
    {
      "name": ".0/model_prediction1",
      "source": ".0/model_prediction1_flat",
      "transform": [
        {
          "type": "treefacet",
          "keys": [
            "data.locale"
          ]
        }
      ]
    },
    {
      "name": "scale/fill",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"south pacific\"\n\"north america\"\n\"south america\"\n\"north atlantic\""
    },
    {
      "name": "scale/stroke",
      "format": {
        "type": "csv",
        "parse": {}
      },
      "values": "\"domain\"\n\"north america\"\n\"north atlantic\"\n\"south america\"\n\"south pacific\""
    },
    {
      "name": "scale/x",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n275.5\n306.3"
    },
    {
      "name": "scale/y",
      "format": {
        "type": "csv",
        "parse": {
          "domain": "number"
        }
      },
      "values": "\"domain\"\n226.7\n343.3"
    }
  ],
  "scales": [
    {
      "name": "fill",
      "type": "ordinal",
      "domain": {
        "data": "scale/fill",
        "field": "data.domain"
      },
      "points": true,
      "sort": false,
      "range": "category10"
    },
    {
      "domain": {
        "data": "scale/stroke",
        "field": "data.domain"
      },
      "name": "stroke",
      "type": "ordinal",
      "range": ["darkorange", "darkred", "darkgreen", "darkblue"],
      "points": true,
      "sort": false
    },
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
      "type": "group",
      "from": {
        "data": ".0"
      },
      "marks": [
        {
          "type": "symbol",
          "properties": {
            "update": {
              "size": {
                "value": 50
              },
              "x": {
                "scale": "x",
                "field": "data.temp"
              },
              "y": {
                "scale": "y",
                "field": "data.ozone"
              },
              "fill": {
                "scale": "fill",
                "field": "data.locale"
              }
            },
            "ggvis": {
              "data": {
                "value": ".0"
              }
            }
          }
        }
      ]
    },
    {
      "type": "group",
      "from": {
        "data": ".0/model_prediction1"
      },
      "marks": [
        {
          "type": "line",
          "properties": {
            "update": {
              "strokeWidth": {
                "value": 2
              },
              "x": {
                "scale": "x",
                "field": "data.pred_"
              },
              "y": {
                "scale": "y",
                "field": "data.resp_"
              },
              "stroke": {
                "scale": "stroke",
                "field": "data.locale"
              },
              "fill": {
                "value": "transparent"
              }
            },
            "ggvis": {
              "data": {
                "value": ".0/model_prediction1"
              }
            }
          }
        }
      ]
    }
  ],
  "legends": [
    {
      "orient": "right",
      "fill": "fill",
      "title": "locale"
    }
  ],
  "axes": [
    {
      "type": "x",
      "scale": "x",
      "orient": "bottom",
      "layer": "back",
      "grid": true,
      "title": "temp"
    },
    {
      "type": "y",
      "scale": "y",
      "orient": "left",
      "layer": "back",
      "grid": true,
      "title": "ozone"
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
    "width": 480,
    "height": 384
  },
  "handlers": null
};
ggvis.getPlot("plot_id714852748").parseSpec(plot_id714852748_spec);
</script>
<!--/html_preserve-->
Diagnostics
-----------

An anova test suggests that both locale and the interaction effect of locale and temperature are useful for predicting ozone (i.e., the p-value that compares the full model to the reduced models is statistically significant).

``` r
mod <- lm(ozone ~ temp, data = means)
mod2 <- lm(ozone ~ temp + locale, data = means)
mod3 <- lm(ozone ~ temp + locale + temp:locale, data = means)

anova(mod, mod2, mod3)
```

------------------------------------------------------------------------

    ## Analysis of Variance Table
    ## 
    ## Model 1: ozone ~ temp
    ## Model 2: ozone ~ temp + locale
    ## Model 3: ozone ~ temp + locale + temp:locale
    ##   Res.Df    RSS Df Sum of Sq       F    Pr(>F)    
    ## 1    559 132709                                   
    ## 2    556  72584  3     60124 191.368 < 2.2e-16 ***
    ## 3    553  57914  3     14670  46.694 < 2.2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
