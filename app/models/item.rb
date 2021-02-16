class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image

 
  belongs_to :category
  belongs_to :sales_status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery



  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :price, format: {with: /\A[0-9]+\z/, message: 'Half-width number'}, numericality: { greater_than: 300, less_than: 99999999, message: 'Out of setting range'}
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :sales_status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
end



end
