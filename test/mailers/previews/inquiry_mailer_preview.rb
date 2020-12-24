# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
    def inquiry
       inquiry = Inquiry.new(name: "稲垣圭佑", email: "keikei1166guiyou@gmail.com", section: "Guide", date: "2020-12-20", time: "15:00",
                            message: "テスト")
      
       InquiryMailer.send_mail(inquiry)
     end
  end