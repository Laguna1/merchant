# frozen_string_literal: true

json.array! @order_items, partial: 'order_items/order_item', as: :order_item
