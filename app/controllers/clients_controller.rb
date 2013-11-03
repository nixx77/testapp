class ClientsController < ApplicationController
  include WashOut::SOAP
  before_filter :dump_parameters
#  skip_before_filter :verify_authenticity_token

  soap_action "CheckClient",
              :args   => :string,
              :return => :string,
              :to     => :check_client
  def check_client
    Rails.logger.debug params[:value]
    soap_response = "1;2334;Ok"
    render :soap => soap_response
  end

  def dump_parameters
    Rails.logger.debug params.inspect
  end
end