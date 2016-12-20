class QrCodesController < ApplicationController
  def new
  end

  def create
    @qr = RQRCode::QRCode.new(params[:qr_code][:text], size: 4)
  end

private
  def qr_code_params
    params.require(:qr_code).permit(:text)
  end
end
