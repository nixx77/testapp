class ClientsController < ApplicationController
  include WashOut::SOAP
  before_filter :dump_parameters
#  skip_before_filter :verify_authenticity_token

  soap_action "CheckClient",
              :args   => :string,
              :return => :string,
              :to     => :check_client,
              :response_tag => "CheckClientResponse"

  def check_client
    Rails.logger.debug params[:value]
    soap_response = "1;2334;Ok"
    render :soap => soap_response
    #Rails.logger.debug params[:response.to_s]
    #headers["Content-Length"]
    #.length.to_s
  end

  def dump_parameters
    Rails.logger.debug params.inspect
  end
end