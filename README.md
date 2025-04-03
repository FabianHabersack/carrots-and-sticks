# Carrots and Sticks

[![Follow me on Bluesky](https://img.shields.io/badge/Bluesky-0285FF?logo=bluesky&logoColor=fff&label=Follow%20me%20on&color=0285FF)](https://bsky.app/profile/fabianhabersack.bsky.social)



This repository contains the datasets and R Script for all main analyses presented in the article and the appendix of “Carrots and sticks: How voter loyalty and electoral opportunities shape parties’ policy priorities in Europe”. The files include:
- **CSES_MARPOR.RDS:** Data from *CSES* ([IMD](https://doi.org/10.7804/cses.imd.2024-02-27)) on parties' voter loyalty and electoral opportunities based on vote choice and party likability scores, merged with data from *MARPOR* ([version 2024a](https://manifesto-project.wzb.eu/datasets)) on parties' issue focus.
- **EES_MARPOR.RDS:** Data from *EES* ([1999](https://doi.org/10.17026/dans-z9j-vy6m); [2004](https://doi.org/10.4232/1.10086); [2009](https://doi.org/10.4232/1.11760); [2014](https://doi.org/10.4232/1.12628); [2019](https://doi.org/10.4232/1.13473)) on parties' voter loyalty and electoral opportunities based on vote choice and propensity to vote, merged with data from *MARPOR* ([version 2024a](https://manifesto-project.wzb.eu/datasets)) on parties' issue focus.
- **REPLICATION_SCRIPT.R:** The R Script, documenting the data import and modeling.


## Prerequisites

Before running the script, make sure you have the following installed:

- **R** (version ≥ 4.2)
- The following R packages:
  - `tidyverse`
  - `broom`
  - `sandwich`
  - `stargazer`
  - `estimatr`
  - `ggthemr`

You can install the required packages by running this command in R:

```r
install.packages(c("tidyverse", "broom", "sandwich", "stargazer", "estimatr", "ggthemr"))
```



# Citation 
> Habersack, F. (2024). “Carrots and sticks: How voter loyalty and electoral opportunities shape parties’ policy priorities in Europe”. *European Journal of Political Research*.
> DOI: 10.1111/1475-6765.12744



## Contact

**Fabian Habersack**  
*Postdoctoral Researcher*  
Department of Political Science, University of Innsbruck  

📧 [fabian.habersack@uibk.ac.at](mailto:fabian.habersack@uibk.ac.at)  
