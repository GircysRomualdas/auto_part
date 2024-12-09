
admin = Admin.where(email: "admin@gmail.com").first_or_initialize

admin.update!(
  password: "password",
  password_confirmation: "password"
)

seller = Seller.where(email: "seller@gmail.com").first_or_initialize

seller.update!(
  password: "password",
  password_confirmation: "password"
)
