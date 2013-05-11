class SubscriptionsController < ApplicationController
  AMOUNT = "7.99"
  DESCRIPTION = "Domiciliation du courrier - abonnement mensuel"

  def show
    unless current_user.paypal_profile_id.present?
      ppr = PayPal::Recurring.new({
        :return_url   => thank_you_subscription_url,
        :cancel_url   => canceled_subscription_url,
        :ipn_url      => "http://example.com/paypal/ipn",
        :description  => DESCRIPTION,
        :amount       => AMOUNT,
        :currency     => "EUR"
      })

      @paypal_response = ppr.checkout
      redirect_to :back unless @paypal_response.valid?
    end
  end

  def thank_you
    if params[:token] and params[:PayerID]
      user = current_user
      user.paypal_token = params[:token]
      user.paypal_payerid = params[:PayerID]
      user.save!

      ppr = PayPal::Recurring.new({
        :token       => user.paypal_token,
        :payer_id    => user.paypal_payerid,
        :amount      => AMOUNT,
        :description => DESCRIPTION
      })
      response = ppr.request_payment
      response.approved?
      response.completed?

      ppr = PayPal::Recurring.new({
        :amount      => AMOUNT,
        :currency    => "EUR",
        :description => DESCRIPTION,
        :ipn_url     => "http://example.com/paypal/ipn",
        :frequency   => 1,
        :token       => user.paypal_token,
        :period      => :monthly,
        :payer_id    => user.paypal_payerid,
        :start_at    => Time.now,
        :failed      => 1,
        :outstanding => :next_billing
      })

      response = ppr.create_recurring_profile
      user.update_attribute :paypal_profile_id, response.profile_id
    end
  end

  def canceled

  end
end
