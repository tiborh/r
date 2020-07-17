#!/usr/bin/env Rscript

source("script_env.r")

make.dataframe <- function(loc.site,loc.file,force.local=F,data.dir=DATA.DIR) {
    raw.data <- get.raw.df(loc.site,loc.file,force.local,data.dir)
    

    return(raw.data)
}

mail50.data <- make.dataframe("https://www.openintro.org/data/csv/","email50.csv")

str(mail50.data)
plot(x=factor(as.character(mail50.data$spam)),y=mail50.data$exclaim_mess,xlab="Spam?",ylab="Num of exclamations")
plot(x=factor(as.character(mail50.data$spam)),y=mail50.data$number,xlab="Spam?",ylab="Number in mail?")
plot(x=factor(as.character(mail50.data$spam)),y=factor(as.character(mail50.data$to_multiple)),xlab="Spam?",ylab="Multiple recipients?")

mail.data <- make.dataframe("https://www.openintro.org/data/csv/","email.csv")

plot(x=factor(as.character(mail.data$spam)),y=factor(as.character(mail.data$to_multiple)),xlab="Spam?",ylab="Multiple recipients?")

## to do:
## a function that prepares a chart for each variable
## correlation choices


## data frame explanation:
## variables:
## spam - Indicator for whether the email was spam.
## to_multiple - Indicator for whether the email was addressed to more than one recipient.
## from - Whether the message was listed as from anyone (this is usually set by default for regular outgoing email).
## cc - Indicator for whether anyone was CCed.
## sent_email - Indicator for whether the sender had been sent an email in the last 30 days.
## time - Time at which email was sent.
## image - The number of images attached.
## attach - The number of attached files.
## dollar - The number of times a dollar sign or the word "dollar" appeared in the email.
## winner - Indicates whether "winner" appeared in the email.
## inherit - The number of times "inherit" (or an extension, such as "inheritance") appeared in the email.
## viagra - The number of times "viagra" appeared in the email.
## password - The number of times "password" appeared in the email.
## num_char - The number of characters in the email, in thousands.
## line_breaks - The number of line breaks in the email (does not count text wrapping).
## format - Indicates whether the email was written using HTML (e.g. may have included bolding or active links).
## re_subj - Whether the subject started with "Re:", "RE:", "re:", or "rE:"
## exclaim_subj - Whether there was an exclamation point in the subject.
## urgent_subj - Whether the word "urgent" was in the email subject.
## exclaim_mess - The number of exclamation points in the email message.
## period_mess - The number of periods in the message.
## signoff - Whether a sign-off of "Cheers", "Regards", or "Best" (also, "Best Regards") was used.
## number - Factor variable saying whether there was no number, a small number (under 1 million), or a big number.
