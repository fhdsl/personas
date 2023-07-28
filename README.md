# personas

Where RDI curates the DaSL Personas

## Build Site Locally

Open this project in RStudio. Make sure you have at least R 4.3.0 installed.
Then run the following in the R console:

```
install.packages("renv", dependencies = TRUE)
renv::activate()
renv::restore()
source(here::here("build.R"))
browseURL(here::here("docs", "index.html"))
```

## Contributing

Only markdown files in the `_personas` folder are rendered. Each persona
markdown file must have yaml front matter in the following format:

```
---
title: Title of Persona
series: 100
tags: ["CARDS", "Clinical Research"]
---
```

Make sure that each persona has only one series number (100, 200, or 300) and
that each persona has at least one tag. If only one tag applies, still put it
in brackets (`["CARDS"]` for example). Try to only modify files in the
`_personas` or `_drafts` folder.

## Details

100-series personas are translational data oriented, with components of both clinical and research data use such as those in academic medical centers, clinical trialists, or translational researchers at academic research centers closely aligned with medical centers. 

200-series personas are primarily research data oriented, which can include clinical data, such as those affiliated with a research or academic institution that is not primarily a medical center.  

300-series personas are primarily clinical data oriented for clinical care, operations or administrative uses such as those affiliated with a hospital or  medical/cancer center. 
