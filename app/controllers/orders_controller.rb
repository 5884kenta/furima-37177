class OrdersController < ApplicationController
  before_action :set_item_id
  before_action :authenticate_user!
  before_action :contributor_confirmation, only: :index
  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_order
      @order_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end  

  def contributor_confirmation
    redirect_to root_path if @item.item_order != nil 
    redirect_to root_path if @item.user_id == current_user.id 
  end

end
