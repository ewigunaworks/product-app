class ActivateProductJob < ApplicationJob
  queue_as :default

  def perform(product, users)
    # Do something later
    puts "=================== ACTIVATE PRODUCT JOB STARTED ===================="
    @products = Product.find(product.id)
    @products.update({is_active: true})
    puts "Success update product to active"

    ActivateProductMailer.activate_product_email(users, @products).deliver_now
    puts "=================== ACTIVATE PRODUCT JOB END ===================="
  end
end
