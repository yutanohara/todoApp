ActionMailer::Base.delivery_method = :letter_opener

# gmailから送信する場合。accountはdummy
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
#     address: 'smtp.gmail.com',
#     domain: 'gmail.com',
#     port: 587,
#     user_name: 'dummy@gmail.com',
#     password: 'dummy',
#     authentication: 'plain',
#     enable_starttls_auto: true
# }