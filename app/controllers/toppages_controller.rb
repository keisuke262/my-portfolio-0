# frozen_string_literal: true

class ToppagesController < ApplicationController
  # controllerのデフォルト機能として、アクションの最後に
  # render :自身のアクション名を呼び出している
  # つまりcontrollerのアクションに対応するViewを呼び出す
  def index; end
end
