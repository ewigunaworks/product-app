class ActivateProductMailer < ApplicationMailer
  default from: 'no-reply@product-app.com'

  def activate_product_email(user, product)
    puts "=================== ACTIVATE PRODUCT EMAIL STARTED ===================="
    @user = user
    @product = product

    mail(to: @user.email, subject: 'Produk sudah aktif')
    puts "=================== ACTIVATE PRODUCT EMAIL END ===================="
  end
end
