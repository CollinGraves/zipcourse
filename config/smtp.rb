SMTP_SETTINGS = {
  address: "smtp.sendgrid.net", # example: "smtp.sendgrid.net"
  authentication: :plain,
  domain: ENV.fetch("CURRENT_DOMAIN"), # example: "heroku.com"
  enable_starttls_auto: true,
  password: ENV.fetch("SMTP_PASSWORD"),
  port: "587",
  user_name: ENV.fetch("SMTP_USERNAME")
}
