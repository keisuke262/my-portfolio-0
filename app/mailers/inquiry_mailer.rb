#メール送信に必要なApplicationMailerクラスを継承する
#send_mailメソッドでメールを送信する
#mailメソッドで細かい設定を行う

class InquiryMailer < ApplicationMailer
    def send_mail(inquiry)
        @inquiry = inquiry
        mail(
            from: 'system@example.com',
            to: 'nanzanessnaimu@gmail.com',
            subject: 'お問い合わせ内容'
        )   
    end    
end


