# Introducing the Gmail_omah gem

    require 'gmail_omah'

    mail = {user_name: 'somebody@gmail.com', password: 'secretpassword'}

    gomah = GmailOmah.new mail: mail
    gomah.fetch_email


The above example demonstrates how I fetch the email from my email server. Gmail_omah does the following:

1. connects to Gmail using the Gmail gem
2. retrieves all messages from the inbox
3. stores the messages in a file directory called *email*
4. deletes all messages from the inbox
5. publishes an SPS message to announce new email has been received.


## Resources

* ?gmail_omah https://rubygems.org/gems/gmail_omah?
* ?Omah 0.3.0 can now save message attachments http://www.jamesrobertson.eu/snippets/2015/may/22/omah-0-3-0-can-now-save-message-attachments.html?

email classicomah gem mail
