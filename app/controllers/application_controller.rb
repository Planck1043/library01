class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.present?
      redirect_to '/' , alert: "你不是管理员"
    end
  end

  helper_method :current_borrow

  def current_borrow
    @current_borrow ||= find_borrow
  end

  private

  def find_borrow
    borrow = Borrow.find_by(id: session[:borrow_id])

    if borrow.blank?
      borrow = Borrow.create
    end

    session[:borrow_id] = borrow.id
    return borrow
  end  
end
