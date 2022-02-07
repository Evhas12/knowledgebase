class Contact < MailForm::Base
  append :remote_ip, :user_agent, :session
  
  attributes :topic, validate: true
  attributes :name, validate: true
  attributes :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :message, validate: true
  attributes :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Contact Form Inquiry",
      :to => "cmittal79dev@gmail.com",
      :cc => %("#{name}" <#{email}>),
      :from => "cmittal79dev@gmail.com"
    }
  end
end