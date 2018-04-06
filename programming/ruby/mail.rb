#!/usr/bin/env ruby

require 'net/smtp'

class Mail
	def Mail.send(subject, from, to, html, cc = '')

message = <<EOM
MIME-Version: 1.0
Subject: #{subject}
From: #{from}
To: #{to}
CC: #{cc}
Content-Type: text/html;
        charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<html>
<head>
<title>#{subject}</title>
</head>
<body>
#{html}
<br />
</body>
</html>
EOM

		# Send via smtp
		Net::SMTP::start('localhost') do |smtp|
			smtp.send_message message, to, to
		end
	end
end


if __FILE__ == $0
	subject = 'Subject'
	from = '"First Last" <someone@email.com>'
	to = 'person@email.com'
	cc = ''
	html = '<p>paragraph</p>'
	Mail.send(subject, from, to, html)
end

