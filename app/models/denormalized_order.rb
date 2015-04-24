class DenormalizedOrder < ActiveRecord::Base
  include FlattenRecord::Flattener

  denormalize :order, {
                        # specifying association
                        include: {
                            # :belongs_to association
                            customer: {},
                            # :has_many association, create multiple denormalized records
                            line_items: {}
                            },

  methods: {
      total_in_usd: :decimal
  },

      # compute results of methods defined in Denormalized model
      compute: {
      line_items_sum: { type: :decimal, default: 0 }
  }
  }

  private
  def compute_line_items_sum(order)
    order.line_items.collect(&:total).inject(:+)
  end
end
