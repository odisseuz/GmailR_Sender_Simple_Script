# Selecting only the email of those who enrolled in our workshop + changing the name to something better and checking for NAs
# I am pretending there is a csv file in your project folder!
# We only want the emails, no info from them besides this (Discarting Phone numbers, etc)
# in case you don't have the libraries you can always install.packages(), loading only the libraries I needed instead of the whole tidyverse was a intentional choice

library(dplyr)

Lista_Raw <- read.csv("List_Participants.csv")

Lista_selected <- Lista_Raw %>%
  select(
    email = Email_From_Participants,
    curso = Day_and_Date
  ) %>%

  filter(
    curso == "Course's Name in string to find in the table",
    !is.na(email),
    email != ""
  ) %>%

  mutate(email = trimws(email)) %>%

  select(email)

rm(Lista_Raw)

gc() #why not? ;)

# If we will need to run this script multiple times, we will need to:
# Save which emails we sent and compare with the new stuff and save it in a different table or vector
# Since I wouldn't need to run it multiple days I didn't save the dataframes, but it might be a good idea, observing data protection laws from where you are and security
# I choose to compare tables using dplyr to it, using anti_join()

df_diference<- anti_join(Lista_selected_1, Lista_selected, by = "email")
