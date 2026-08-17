# Setup Instructions:
# 1. Go to Google Cloud Console (console.cloud.google.com) and select/create a project.
# 2. Go to "APIs & Services" > "Library", search for "Google Drive API", and click "Enable".
# 3. Go to "APIs & Services" > "Credentials" and set up your OAuth Consent Screen.
# 4. Click "Create Credentials" > "OAuth client ID" (or "Service Account"), download the JSON credentials file, and place it in your project root
# Take care of your credentials and be safe pls!

library(gmailr)

gm_auth_configure(path = "Credentials.json")

gm_auth(email = "your email in a string")

assunto_email <- "Title of your email"

corpo_email <- "
The email you want to send, you can use HTML tags, it works well!
"
#Just being a big verbose since there's only this in our table + the loop to actually send the email
vector_emails <- df_diferenca$email

for (destinatario in vector_emails) {

  mensagem <- gm_mime() |>
    gm_to(destinatario) |>
    gm_from("example: Workshop XYZ <Your email goes here>") |>
    gm_subject(assunto_email) |>
    gm_html_body(corpo_email)

  gm_send_message(mensagem)

  print(paste("Email Sent to:", destinatario)) #Just to check in the console!

  Sys.sleep(2)
}

# I might implement a tryCach() later on besides other things
