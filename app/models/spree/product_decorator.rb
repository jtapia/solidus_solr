Spree::Product.class_eval do
  # Attributes by default: [Name, Description, Taxons]
  # You can add/remove the options that you need to the searchable list
  searchable do
    string :name, stored: true
    text :description, stored: true, more_like_this: true do
      [name, description, meta_description, meta_keywords].join(' ')
    end

    integer :taxon_ids, stored: true, multiple: true do
      taxons.map(&:id)
    end

    integer :popularity, stored: true do
      line_items.joins(:order).
                 where.not(spree_orders: { completed_at: nil }).
                 map(&:quantity).sum
    end

    integer :product_ids_bought_together, stored: true, multiple: true do
      variant_ids = Spree::LineItem.where(order_id: line_items.
                                    joins(:order).
                                    where.not(spree_orders: { completed_at: nil }).
                                    where.not(variant_id: variants.map(&:id)).
                                    map(&:order_id)).
                                    select('distinct variant_id').
                                    map(&:variant_id)
      Spree::Variant.where(id: variant_ids).
                     select('distinct product_id').
                     map(&:product_id)
    end
  end
end
