#!/usr/bin/env ruby

# file: gmail_omah.rb

require 'gmail'
require 'omah'


class GmailOmah < Omah

  def initialize(user: 'user', filepath: '.', mail: {}, \
               options: {xslt: 'listing.xsl'}, plugins: [])

    @user = user    
    @mail = {user_name: '',  password: '' }.merge mail

    field = %i(user_name password).detect {|x| @mail[x].empty?}
    return "GmailOmah: missing %s" % field if field
        
    @email_address = @mail[:user_name]

    @variables = {user_name: @mail[:user_name], email_address: @email_address}
    
    super(user: user, filepath: filepath, plugins: plugins, options: options)    

  end

  def fetch_email()
    
    gmail = Gmail.new(@mail[:user_name], @mail[:password])
    a = gmail.inbox.emails
    
    return 'no new messages' unless a.any?

    # fields we are interested in:
    #
    #    :from,  :message_id, :to, :subject, :date, :body.decoded, 
    #    :text_part.to_s, html_part.to_s

    messages = a.map.with_index.inject([]) do |r, x|

      gmail_msg, i = x
      msg = gmail_msg.message

      begin
        r << {
          id:         msg.message_id,
          from:       msg.from.is_a?(Array) ? msg.from.join(', ') : msg.from,
          to:         msg.to.is_a?(Array) ? msg.to.join(', ') : msg.to,
          subject:    msg.subject,
          date:       msg.date.to_s,
          body_text:  (msg.text_part ? msg.text_part.body.decoded : msg.body.decoded),
          body_html:  (msg.html_part ? msg.html_part.body.decoded : msg.body.decoded),
          attachments: msg.attachments.map {|x| [x.filename, x.body.decoded] }
        }
      rescue
        puts 'warning: ' + ($!).inspect
      end
      
    r

    end

    # messages are stored in the file dynarexdaily.xml
    self.store messages    

    a.each {|email|  email.delete! }
    messages.length.to_s + " new messages"
    
  end
end