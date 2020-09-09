ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: '3110testtest@gmail.com',
  password: 'test3110',
  authentication: 'plain',
  enable_starttls_auto: true
}