class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code , :shipping_origin_id , :city , :street , :buliding , :phone , :user_id ,:item_id ,:token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_origin_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city 
    validates :street
    validates :phone,format:{with: /\A\d{10,11}\z/}
    validates :token

  end

  def save
  
    buy = Buy.create(item_id: item_id, user_id: user_id)
  
    Address.create(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city: city, street: street, buliding: buliding,phone: phone ,buy_id: buy.id)
  end
end
