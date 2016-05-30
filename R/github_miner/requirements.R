# Required packages for github_miner.
required_packages <- c('github', 'httpuv', 'httr', 'stringr')

# Determinate the new packages to be installed.
new_packages <- required_packages[!(required_packages %in% installed.packages()[, 'Package'])]

# Install new packages if needed.
if (length(new_packages))
  install.packages(new_packages)

if ('github' %in% new_packages) {
  install.packages('devtools')
  require(devtools)
  install_github('cscheid/rgithub')
}

# Load the packages.
lapply(required_packages, library, character.only = TRUE)

# Clean up.
rm(required_packages, new_packages)
