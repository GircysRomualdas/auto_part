
3.times do |i|
  admin = Admin.where(email: "admin#{i}@gmail.com").first_or_initialize

  admin.update!(
    password: "password",
    password_confirmation: "password"
  )
end


4.times do |i|
  seller = Seller.where(email: "seller#{i}@gmail.com").first_or_initialize

  seller.update!(
    password: "password",
    password_confirmation: "password"
  )
end

8.times do |i|
  customer = Customer.where(email: "customer#{i}@gmail.com").first_or_initialize

  customer.update!(
    password: "password",
    password_confirmation: "password"
  )
end
