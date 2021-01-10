# frozen_string_literal: true

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = '送信が完了しました。'
      redirect_to action: :index
    else
      flash.now[:danger] = '送信に失敗しました。'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :section, :sectiondate, :sectiontime, :message)
  end
end
