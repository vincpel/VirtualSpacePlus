class AdMailerController < ApplicationController

  def sendmail()
    respond = JSON.parse('{"status": "ok"}')

    ads_seller = Ad.find(params["ad_id"])
    buyerinfo = params["callbackinfo"] || "no callback info left ..."
    buyermsg =  params["mailbody"]     || "no msg left ..."

    AdMailer.mailproxysend(buyerinfo,buyermsg, ads_seller).deliver_later
    if simple_captcha_valid?
      respond_to do |format|
        format.json { render status: 200, json: true  }
      end
    else
      respond_to do |format|
        format.json { render status: 400, json: JSON.parse('{"status":"captcha not valid"}') }
      end
    end
  end
end
