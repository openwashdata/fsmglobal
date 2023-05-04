


library(cffr)

packageVersion("cffr")

# Download a DESCRIPTION file
tmp <- file.path(tempdir(), "DESCRIPTION")

download.file("https://raw.githubusercontent.com/openwashdata/fsmglobal/main/DESCRIPTION",
              tmp,
              quiet = TRUE
)

# creates CFF with all author roles & date-released to add "year"?
mod_cff <- cffr::cff_create(tmp, dependencies = FALSE,
                      authors_roles = c("aut", "cre", "ctb", "fnd"),
                      keys = list("date-released" = Sys.Date()))

# writes the CFF file
outcff <- tempfile(fileext = ".cff")
cff_write(mod_cff, outfile = outcff)

# Now write a CITATION file from the CITATION.cff file
# Use inst/CITATION instead (the default if not provided)
tmpcit <- file.path(tempdir(), "CITATION")

write_citation(outcff, tmpcit)

cat(readLines(tmpcit), sep = "\n")
