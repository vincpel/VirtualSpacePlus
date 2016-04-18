class AdMailer < ApplicationMailer
  helper :application

  def mailproxysend(buyerinfo,mesg, adseller)
    @buyerinfo = buyerinfo
    @message = mesg
    @ad = adseller
    mail(from: "virtualspaceplus7@gmail.com",
         to: adseller.user.email,
         subject: "Some one is interested in your ad : #{@ad.title}")
  end 
end
