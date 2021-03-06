class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :plan
  has_one :profile
  
  attr_accessor :stripe_card_token
  # Create Stripe customer for premium membership
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, plan: 'price_1JPrqKBSIZw7Us2gk2jlkZOu', card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
