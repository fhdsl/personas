library(tidyverse)
library(rmarkdown)
library(here)
library(fs)

here("_mds") |>
  dir_create()

here() |>
  dir_ls(glob = "*.md") |>
  file_move(new_path = here("_mds"))

here("_personas/") |>
  dir_ls(glob = "*.md") |>
  file_copy(new_path = here())

tags_ <- here("_personas/") |>
  dir_ls(glob = "*.md") |>
  map(yaml_front_matter) |>
  map(as_tibble) |>
  list_rbind() |>
  pull(tags) |>
  unique() |>
  sort()

for (i in tags_) {
  tag_template <- here("tag-template.Rmd") |> readLines()
  tag_template[2] <- paste("title:", i)
  tag_page <- tolower(i) |>
    (\(x) gsub("\\s", "-", x))() |>
    paste0(".Rmd")
  tag_template |> writeLines(here(tag_page))
}

render_site(here())

if(dir_exists(here("_mds"))){
  here() |>
    dir_ls(glob = "*.md") |>
    file_delete()
}

tags_ |>
  tolower() |>
  (\(x) gsub("\\s", "-", x))() |>
  paste0(".Rmd") |>
  here() |>
  file_delete()

here("_mds") |>
  dir_ls(glob = "*.md") |>
  file_move(new_path = here())

here("_mds") |>
  dir_delete()
