# frozen_string_literal: true

class InquiriesController < ApplicationController
  def index; end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver
      flash[:success] = '送信が完了しました。'
      redirect_to inquiries_path
    else
      flash.now[:danger] = '送信に失敗しました。'
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :section, :date, :time, :message)
  end
end
