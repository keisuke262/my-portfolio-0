# frozen_string_literal: true

# メール送信に必要なApplicationMailerを継承する
class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      to: 'nanzanessnaimu@gmail.com',
      subject: '南山大学ESS セクション体験お問い合わせ内容'
    )
  end
end
