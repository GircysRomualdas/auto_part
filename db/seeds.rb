
3.times do |i|
  admin = Admin.where(email: "admin#{i}@gmail.com").first_or_initialize

  admin.update!(
    username: "admin#{i}",
    password: "password",
    password_confirmation: "password"
  )
end


5.times do |i|
  seller = Seller.where(email: "seller#{i}@gmail.com").first_or_initialize

  seller.update!(
    username: "seller#{i}",
    password: "password",
    password_confirmation: "password"
  )
end

10.times do |i|
  customer = Customer.where(email: "customer#{i}@gmail.com").first_or_initialize

  customer.update!(
    username: "customer#{i}",
    address: "address#{i}",
    password: "password",
    password_confirmation: "password"
  )
end
