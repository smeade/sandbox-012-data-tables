class ProductsDatatable

  delegate :params, :h, :link_to, :number_to_currency, :product_path, :edit_product_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      draw: params['draw'].to_i,
      recordsTotal: products_total,
      recordsFiltered: filtered_products_total,
      data: data
    }
  end

  private

  def products_total
    Product.count
  end

  def filtered_products_total
    filtered_products.count
  end

  def data
    filtered_products.page(page).per(per_page).map do |product|
      row = [
        product.sku.html_safe,
        product.name.html_safe,
        product.description.html_safe,
        actions(product).html_safe
      ]
      row.compact
    end
  end

  def filtered_products
    products = Product.unscoped.order("#{sort_column} #{sort_direction}")
    if params['search']['value'].present?
      products = products.where("sku ilike :search or name ilike :search or description ilike :search", search: "%#{params['search']['value']}%")
    end
    products
  end

  def actions(product)
    link_to('Show', product_path(product)) + ' | ' +
    link_to('Edit', edit_product_path(product)) + ' | ' +
    link_to('Delete', product, method: :delete, data: { confirm: 'Are you sure?' })
  end

  def page
    params['start'].to_i/per_page + 1
  end

  def per_page
    params['length'].to_i > 0 ? params['length'].to_i : 10
  end

  def columns
    cols = [
      'sku',
      'name',
      'description',
      'pce_field_two',
    ]
    cols.compact
  end

  def sort_column
    columns[params['order']['0']['column'].to_i]
  end

  def sort_direction
    params['order']['0']['dir'] == "desc" ? "desc" : "asc"
  end
end
