## Credits
## Helveston (2021, March 25). jhelvy.com: Customizing distill with {htmltools} and CSS. Retrieved from https://www.jhelvy.com/posts/2021-03-25-customizing-distill-with-htmltools-and-css/
## https://github.com/jhelvy/jhelvy_distill/tree/master

library(htmltools)
library(distilltools)
library(stringr)
library(dplyr)
library(latex2exp)

create_footer <- function() {
  
  fill <- '#ededeb'
  height <- '14px'
  
  footer <- HTML(paste0(
    '<footer>',
    '© 2023 <a href="https://www.alexjohnquijano.com">Alex John Quijano</a> <a href="https://creativecommons.org/licenses/by-sa/4.0/">CC-BY-NC</a>\n',
    br(),
    ' Made with ','<a href="https://cran.r-project.org/">R</a>', ' and ',
    '<a href="https://rmarkdown.rstudio.com/">R Markdown,</a> \n',
    br(),
    last_updated(), "\n\n",
    '</footer>',
    '<div class="tocify-extend-page" data-unique="tocify-extend-page" style="height: 0;"></div>',
    
    '<!-- Add function to open links to external links in new tab, from: -->',
    '<!-- https://yihui.name/en/2018/09/target-blank/ -->\n\n',
    '<script src="js/external-link.js"></script>'
  ))
  
  save_raw(footer, "_footer.html")
}

last_updated <- function() {
  return(span(
    paste0(
      'Last updated on ',
      format(Sys.Date(), format="%B %d, %Y")
    ),
    style = "font-size:0.8rem;")
  )
}

save_raw <- function(text, path) {
  fileConn <- file(path)
  writeLines(text, fileConn)
  close(fileConn)
}
