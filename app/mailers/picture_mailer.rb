class PictureMailer < ApplicationMailer
    def picture_mail(picture)
        @picture = picture

        mail to: @picture.email, subject: "投稿のお知らせメール"
      end
end
