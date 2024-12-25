require 'open-uri'

CarBrand.destroy_all
CarModel.destroy_all
Stock.destroy_all
CarPart.destroy_all
PartType.destroy_all
OrderItem.destroy_all
Order.destroy_all
CartItem.destroy_all
Cart.destroy_all
Customer.destroy_all
Seller.destroy_all
Admin.destroy_all



# create customer
customer_data = []

11.times do |i|
  customer_data << { email: "customer#{i+1}@gmail.com", password: "password" }
end

customers = []
customer_data.each do |customer|
  customer = Customer.create!(customer)
  customer.create_cart
  customers << customer
end

# create admin
admin_data = []

2.times do |i|
  admin_data << { email: "admin#{i+1}@gmail.com", password: "password" }
end

admins = []
admin_data.each do |admin|
  admins << Admin.create!(admin)
end

# create seller
seller_data = []

4.times do |i|
  admin = admins.sample
  seller_data << { email: "seller#{i+1}@gmail.com", password: "password", admin_id: admin.id }
end

sellers = []
seller_data.each do |seller|
  sellers << Seller.create!(seller)
end

# create part type
type_data = [
  { name: "Engine", description: "The engine converts fuel into mechanical energy to power the vehicle.", url: "https://i.pinimg.com/736x/89/2a/59/892a5959d7ceca61c2e6161b54d72fea--used-engines-remanufactured-engines.jpg" },
  { name: "Transmission", description: "The transmission system transfers power from the engine to the wheels.", url: "https://highgradeauto.com/wp-content/uploads/2014/06/Cars-Transmissions.jpg" },
  { name: "Alternator", description: "The alternator generates electrical power to charge the battery and run electrical systems.", url: "https://heielectric.com/wp-content/uploads/2023/05/7.3-200A.jpg" },
  { name: "Brake Pads", description: "Brake pads provide friction to slow down and stop the vehicle.", url: "https://neobrake.com/wp-content/uploads/2016/06/NeoBrake-Air-Disc-Brake-Pads-2.1.png" },
  { name: "Radiator", description: "The radiator helps to cool the engine by dissipating heat.", url: "https://5.imimg.com/data5/QK/LH/MY-11959742/automobile-radiator-1000x1000.jpg" },
  { name: "Fuel Injector", description: "The fuel injector delivers fuel into the engine’s combustion chamber.", url: "https://mydieselpro.com/wp-content/uploads/2020/01/0-986-435-597DX_P04-600x600.jpg" },
  { name: "Catalytic Converter", description: "The catalytic converter reduces harmful emissions from the exhaust.", url: "https://m.media-amazon.com/images/I/51oFUV8B74L.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Suspension Struts", description: "Suspension struts support the vehicle’s weight and absorb shocks from the road.", url: "https://static.summitracing.com/global/images/faqs/5260/strut.jpg" },
  { name: "Battery", description: "The battery provides the initial power to start the vehicle and powers electrical components.", url: "https://images.tayna.com/prod-images/1200/Powerline/065-powerline-45-435.jpg" },
  { name: "Exhaust Muffler", description: "The muffler reduces noise and emissions from the exhaust system.", url: "https://m.media-amazon.com/images/I/51dyA3YBlOL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Power Steering", description: "Power steering allows for easier steering of the vehicle.", url: "https://www.saicmgautoparts.com/uploads/STEERING-ASSEMBLY-10325996-70699744651.jpg" },
  { name: "Wheel Bearing", description: "Wheel bearings allow the wheels to rotate smoothly and reduce friction.", url: "https://marvel-b1-cdn.bc0a.com/f00000000270517/s19528.pcdn.co/wp-content/uploads/2021/10/Wheel-Bearings-1024x512.jpg" },
  { name: "Shock Absorber", description: "Shock absorbers dampen the impact of bumps and road irregularities.", url: "https://m.media-amazon.com/images/I/81Ns5JPE5VL.__AC_SY300_SX300_QL70_FMwebp_.jpg" },
  { name: "Oil Filter", description: "The oil filter removes contaminants from the engine oil.", url: "https://img.webike-cdn.net/catalogue/images/125355/35210_TM.jpg" },
  { name: "Air Filter", description: "The air filter prevents dirt and debris from entering the engine.", url: "https://www.stage3motorsports.com/assets/images/AFE-21-910402011-2014F15050LaFeProDrySReplacementAirFilterforStage2IntakeSystems00.jpg" }
]

part_types = []
type_data.each do |data|
  part_type = PartType.create!(
    name: data[:name],
    description: data[:description]
  )

  part_types << part_type
  part_type.image.attach(io: URI.open(data[:url]), filename: "image.jpg")
end

# create car brand
car_brand_data = [
  { name: "Toyota", description: "A Japanese automaker known for reliability and fuel-efficient vehicles." },
  { name: "Ford", description: "An American automaker recognized for its trucks and iconic Mustang sports car." },
  { name: "BMW", description: "A German luxury car brand famous for its performance and engineering." },
  { name: "Tesla", description: "An American brand revolutionizing the electric vehicle market with innovative technology." },
  { name: "Honda", description: "A Japanese manufacturer popular for its affordable, durable, and fuel-efficient cars." },
  { name: "Mercedes-Benz", description: "A German luxury brand known for premium vehicles and advanced technology." },
  { name: "Chevrolet", description: "An American automaker offering a range of vehicles from compact cars to powerful trucks." },
  { name: "Hyundai", description: "A South Korean brand providing affordable cars with modern features and strong warranties." },
  { name: "Porsche", description: "A German manufacturer specializing in high-performance sports cars and SUVs." },
  { name: "Nissan", description: "A Japanese car brand offering a variety of vehicles, including electric models like the Leaf." }
]

car_brands = []
car_brand_data.each do |data|
  car_brands << CarBrand.create!(data)
end

# create car model
car_model_data = [
  { name: "Camry", description: "A mid-size sedan known for its reliability and fuel efficiency.", car_brand: "Toyota" },
  { name: "Corolla", description: "A compact sedan offering durability and great value.", car_brand: "Toyota" },
  { name: "RAV4", description: "A popular compact SUV with excellent versatility.", car_brand: "Toyota" },
  { name: "Highlander", description: "A mid-size SUV perfect for families.", car_brand: "Toyota" },
  { name: "Tacoma", description: "A durable and capable mid-size truck.", car_brand: "Toyota" },
  { name: "Prius", description: "A pioneering hybrid vehicle with exceptional fuel economy.", car_brand: "Toyota" },
  { name: "Tundra", description: "A full-size truck built for heavy-duty tasks.", car_brand: "Toyota" },
  { name: "Avalon", description: "A spacious and luxurious full-size sedan.", car_brand: "Toyota" },
  { name: "Sequoia", description: "A large SUV designed for big families and adventures.", car_brand: "Toyota" },
  { name: "Supra", description: "A sports car delivering thrilling performance.", car_brand: "Toyota" },

  { name: "Mustang", description: "An iconic American sports car with powerful performance.", car_brand: "Ford" },
  { name: "F-150", description: "A legendary full-size pickup truck with impressive capability.", car_brand: "Ford" },
  { name: "Explorer", description: "A mid-size SUV offering versatility and comfort.", car_brand: "Ford" },
  { name: "Escape", description: "A compact SUV combining practicality with modern features.", car_brand: "Ford" },
  { name: "Bronco", description: "A rugged SUV designed for off-road adventures.", car_brand: "Ford" },
  { name: "Edge", description: "A mid-size SUV offering sporty design and advanced features.", car_brand: "Ford" },
  { name: "Fusion", description: "A mid-size sedan with efficient and stylish design.", car_brand: "Ford" },
  { name: "Ranger", description: "A mid-size truck perfect for daily work and adventure.", car_brand: "Ford" },
  { name: "Expedition", description: "A full-size SUV offering ample space for large families.", car_brand: "Ford" },
  { name: "Maverick", description: "A compact truck with modern styling and utility.", car_brand: "Ford" },

  { name: "3 Series", description: "A luxury sedan offering a balance of performance and comfort.", car_brand: "BMW" },
  { name: "5 Series", description: "A mid-size luxury sedan with advanced technology.", car_brand: "BMW" },
  { name: "7 Series", description: "A flagship luxury sedan with premium features.", car_brand: "BMW" },
  { name: "X3", description: "A compact luxury SUV with sporty performance.", car_brand: "BMW" },
  { name: "X5", description: "A mid-size luxury SUV offering space and versatility.", car_brand: "BMW" },
  { name: "i4", description: "An all-electric luxury sedan with cutting-edge design.", car_brand: "BMW" },
  { name: "Z4", description: "A stylish and sporty convertible.", car_brand: "BMW" },
  { name: "M3", description: "A high-performance version of the 3 Series sedan.", car_brand: "BMW" },
  { name: "X7", description: "A full-size luxury SUV with top-tier amenities.", car_brand: "BMW" },
  { name: "iX", description: "An innovative all-electric luxury SUV.", car_brand: "BMW" },

  { name: "Model S", description: "A premium electric sedan with cutting-edge technology.", car_brand: "Tesla" },
  { name: "Model 3", description: "An affordable electric sedan with great range.", car_brand: "Tesla" },
  { name: "Model X", description: "A luxury electric SUV with distinctive falcon-wing doors.", car_brand: "Tesla" },
  { name: "Model Y", description: "A compact electric SUV designed for family use.", car_brand: "Tesla" },
  { name: "Cybertruck", description: "A futuristic all-electric pickup truck.", car_brand: "Tesla" },
  { name: "Roadster", description: "An all-electric sports car with incredible speed.", car_brand: "Tesla" },
  { name: "Semi", description: "An electric semi-truck designed for freight hauling.", car_brand: "Tesla" },
  { name: "Model 2", description: "An upcoming affordable compact electric vehicle.", car_brand: "Tesla" },
  { name: "Solar Roof", description: "Innovative solar-powered roofing solution for homes and vehicles.", car_brand: "Tesla" },
  { name: "Powerwall", description: "A home battery system for renewable energy storage.", car_brand: "Tesla" },

  { name: "Civic", description: "A compact car offering practicality and efficiency.", car_brand: "Honda" },
  { name: "Accord", description: "A mid-size sedan with a sleek and spacious design.", car_brand: "Honda" },
  { name: "CR-V", description: "A compact SUV known for reliability and versatility.", car_brand: "Honda" },
  { name: "Pilot", description: "A mid-size SUV with room for the whole family.", car_brand: "Honda" },
  { name: "Odyssey", description: "A family-friendly minivan with advanced features.", car_brand: "Honda" },
  { name: "HR-V", description: "A subcompact SUV that’s perfect for urban adventures.", car_brand: "Honda" },
  { name: "Ridgeline", description: "A versatile and comfortable mid-size truck.", car_brand: "Honda" },
  { name: "Fit", description: "A compact hatchback with surprising interior space.", car_brand: "Honda" },
  { name: "Insight", description: "A hybrid sedan offering great fuel economy.", car_brand: "Honda" },
  { name: "Passport", description: "A rugged mid-size SUV built for adventure.", car_brand: "Honda" },

  { name: "C-Class", description: "A compact luxury sedan offering elegance and performance.", car_brand: "Mercedes-Benz" },
  { name: "E-Class", description: "A luxury sedan with advanced features and refined design.", car_brand: "Mercedes-Benz" },
  { name: "S-Class", description: "A flagship luxury sedan with top-tier amenities and technology.", car_brand: "Mercedes-Benz" },
  { name: "GLC", description: "A compact luxury SUV with a premium interior.", car_brand: "Mercedes-Benz" },
  { name: "GLE", description: "A mid-size SUV offering luxury and versatility.", car_brand: "Mercedes-Benz" },
  { name: "GLA", description: "A subcompact luxury SUV perfect for urban driving.", car_brand: "Mercedes-Benz" },
  { name: "GLS", description: "A full-size SUV providing ample space and luxury.", car_brand: "Mercedes-Benz" },
  { name: "CLA", description: "A stylish and sporty compact sedan.", car_brand: "Mercedes-Benz" },
  { name: "AMG GT", description: "A high-performance sports car with sleek styling.", car_brand: "Mercedes-Benz" },
  { name: "EQC", description: "A fully electric SUV offering sustainable luxury.", car_brand: "Mercedes-Benz" },

  { name: "Silverado", description: "A robust full-size pickup truck built for heavy-duty performance.", car_brand: "Chevrolet" },
  { name: "Malibu", description: "A mid-size sedan with a comfortable ride and modern design.", car_brand: "Chevrolet" },
  { name: "Equinox", description: "A compact SUV with advanced safety features.", car_brand: "Chevrolet" },
  { name: "Traverse", description: "A mid-size SUV offering space for the whole family.", car_brand: "Chevrolet" },
  { name: "Tahoe", description: "A large SUV perfect for towing and family trips.", car_brand: "Chevrolet" },
  { name: "Suburban", description: "An extended full-size SUV with expansive cargo space.", car_brand: "Chevrolet" },
  { name: "Blazer", description: "A sporty mid-size SUV with bold styling.", car_brand: "Chevrolet" },
  { name: "Colorado", description: "A versatile mid-size truck for work and play.", car_brand: "Chevrolet" },
  { name: "Bolt EV", description: "An affordable all-electric hatchback with a long range.", car_brand: "Chevrolet" },
  { name: "Camaro", description: "A classic American muscle car delivering thrilling performance.", car_brand: "Chevrolet" },

  { name: "Elantra", description: "A compact sedan offering great value and modern features.", car_brand: "Hyundai" },
  { name: "Sonata", description: "A mid-size sedan with stylish design and advanced tech.", car_brand: "Hyundai" },
  { name: "Santa Fe", description: "A mid-size SUV ideal for families and adventures.", car_brand: "Hyundai" },
  { name: "Tucson", description: "A compact SUV with a sleek design and efficient performance.", car_brand: "Hyundai" },
  { name: "Kona", description: "A subcompact SUV offering sporty handling.", car_brand: "Hyundai" },
  { name: "Venue", description: "An affordable and stylish compact SUV.", car_brand: "Hyundai" },
  { name: "Palisade", description: "A full-size SUV with a premium interior and three rows of seats.", car_brand: "Hyundai" },
  { name: "Ioniq 5", description: "A futuristic all-electric crossover.", car_brand: "Hyundai" },
  { name: "Veloster", description: "A sporty hatchback with a unique design.", car_brand: "Hyundai" },
  { name: "Accent", description: "A compact sedan known for its affordability and efficiency.", car_brand: "Hyundai" },

  { name: "911", description: "A high-performance sports car with a timeless design.", car_brand: "Porsche" },
  { name: "Cayenne", description: "A luxury SUV combining performance and practicality.", car_brand: "Porsche" },
  { name: "Macan", description: "A compact luxury SUV with sporty performance.", car_brand: "Porsche" },
  { name: "Panamera", description: "A luxury sedan with dynamic driving capabilities.", car_brand: "Porsche" },
  { name: "Taycan", description: "A fully electric luxury sedan with impressive speed.", car_brand: "Porsche" },
  { name: "718 Cayman", description: "A compact sports car delivering thrilling handling.", car_brand: "Porsche" },
  { name: "718 Boxster", description: "A convertible sports car perfect for open-road adventures.", car_brand: "Porsche" },
  { name: "Turbo S", description: "A high-performance variant of Porsche's top models.", car_brand: "Porsche" },
  { name: "911 GT3", description: "A track-focused version of the iconic 911.", car_brand: "Porsche" },
  { name: "Mission E", description: "A concept electric sports car showcasing Porsche's future tech.", car_brand: "Porsche" },

  { name: "Leaf", description: "An affordable electric vehicle with zero emissions.", car_brand: "Nissan" },
  { name: "Altima", description: "A mid-size sedan offering comfort and advanced features.", car_brand: "Nissan" },
  { name: "Rogue", description: "A compact SUV with a refined design and efficient performance.", car_brand: "Nissan" },
  { name: "Sentra", description: "A compact sedan combining style and practicality.", car_brand: "Nissan" },
  { name: "Versa", description: "An affordable subcompact sedan with great fuel economy.", car_brand: "Nissan" },
  { name: "Pathfinder", description: "A mid-size SUV built for families and adventure.", car_brand: "Nissan" },
  { name: "Murano", description: "A stylish and comfortable mid-size SUV.", car_brand: "Nissan" },
  { name: "Frontier", description: "A reliable mid-size pickup truck.", car_brand: "Nissan" },
  { name: "Titan", description: "A full-size truck designed for heavy-duty work.", car_brand: "Nissan" },
  { name: "GT-R", description: "A high-performance sports car with advanced technology.", car_brand: "Nissan" }
]

car_models = []
car_model_data.each do |data|
  car_brand = CarBrand.find_by(name: data[:car_brand])
  car_model = CarModel.create!(
    name: data[:name],
    description: data[:description],
    car_brand: car_brand
  )

  car_models << car_model
end



# create car part
car_parts_data = [
  { name: "V8 Engine", description: "High-performance V8 engine for sports cars.", price: 700.00, part_type_name: "Engine", active: true, url: "https://cimg1.ibsrv.net/ibimg/hgm/1600x900-1/100/448/2014-volvo-v8-supercars-race-car-engine_100448945.jpg" },
  { name: "Automatic Transmission", description: "Smooth automatic transmission for sedans.", price: 600.00, part_type_name: "Transmission", active: true, url: "https://www.autoblog.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_640/MjA5MTUyODc0Njk2MTU2Nzg0/image-placeholder-title.webp" },
  { name: "Heavy Duty Alternator", description: "Durable alternator for trucks and SUVs.", price: 100.00, part_type_name: "Alternator", active: true, url: "https://www.wosperformance.co.uk/clientarea/images/product-catalogue/LMA499-SE.jpg" },
  { name: "Ceramic Brake Pads", description: "High-quality brake pads for enhanced stopping power.", price: 30.00, part_type_name: "Brake Pads", active: false, url: "https://felixperformance.com/cdn/shop/products/19996a3725e294c6f875abe909d52d05_b5344ff8-2568-4095-8b17-22ee8b1f09e3_500x.jpg?v=1702767477" },
  { name: "Aluminum Radiator", description: "Lightweight radiator for efficient cooling.", price: 120.00, part_type_name: "Radiator", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/sum-384002_it_xl.jpg" },
  { name: "Performance Fuel Injector", description: "High-flow fuel injector for improved engine performance.", price: 70.00, part_type_name: "Fuel Injector", active: false, url: "https://www.texas-speed.com/images/Product/large/11077.jpg" },
  { name: "Universal Catalytic Converter", description: "Eco-friendly catalytic converter suitable for most vehicles.", price: 90.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/61aQXRRnzBL._AC_SX466_.jpg" },
  { name: "Adjustable Suspension Struts", description: "Customizable suspension struts for improved ride quality.", price: 100.00, part_type_name: "Suspension Struts", active: true, url: "https://m.media-amazon.com/images/I/61jvguz8kQL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Lithium-ion Battery", description: "Long-lasting lithium-ion car battery.", price: 50.00, part_type_name: "Battery", active: true, url: "https://m.media-amazon.com/images/I/61i9PnpSI7L.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Sport Exhaust Muffler", description: "Low-restriction muffler for sporty sound.", price: 50.00, part_type_name: "Exhaust Muffler", active: true, url: "https://dcsports.com/cdn/shop/products/DCMU-300-ST_1_d2a65315-6302-47fc-9606-67cb60e6ffa0_1800x1800.jpg?v=1661204502" },
  { name: "Hydraulic Power Steering", description: "Efficient power steering for smooth handling.", price: 100.00, part_type_name: "Power Steering", active: true, url: "https://webshop.vetus.com/storage/HT1018806_8-780.webp" },
  { name: "High-Performance Wheel Bearing", description: "Durable wheel bearing for high-speed performance.", price: 50.00, part_type_name: "Wheel Bearing", active: false, url: "https://faiauto.com/content/uploads/2018/09/Bearing-cutaway-1200x650.jpg" },
  { name: "Heavy Duty Shock Absorber", description: "Shock absorber designed for off-road vehicles.", price: 70.00, part_type_name: "Shock Absorber", active: true, url: "https://m.media-amazon.com/images/I/717tr8m--qL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Oil Filter", description: "High-efficiency oil filter for cleaner engine operation.", price: 20.00, part_type_name: "Oil Filter", active: false, url: "https://pierce-images.imgix.net/images/0/e/7/9/0e79d8ac8000029051071934dec05504953487f1_2_TW04_1P_611_0_10.png?bg=F0F1F2&auto=compress&auto=format&h=630&w=630" },
  { name: "Premium Air Filter", description: "High-flow air filter for better engine breathing.", price: 40.00, part_type_name: "Air Filter", active: true, url: "https://autotalent.com/cdn/shop/products/e86b7d264eb748b29526e2dc72650d8c_750x750.jpg?v=1663222132" },
  { name: "Supercharged V8 Engine", description: "Supercharged engine for extreme performance.", price: 900.00, part_type_name: "Engine", active: true, url: "https://www.enginediy.com/cdn/shop/products/4de07975-5d04-4157-ad7c-5ddf5f9e4d47_c09e21c9-784a-43c7-bc1e-0b4f954d83bf_700x700.jpg?v=1664517472" },
  { name: "CVT Transmission", description: "Continuously variable transmission for smooth acceleration.", price: 700.00, part_type_name: "Transmission", active: false, url: "https://s19526.pcdn.co/wp-content/uploads/2024/02/CVT-Trans.jpg" },
  { name: "Compact Alternator", description: "Small but powerful alternator for compact cars.", price: 80.00, part_type_name: "Alternator", active: true, url: "https://i0.wp.com/www.heavymetalgarage.com.au/wp-content/uploads/2019/06/FP0049.jpg?fit=1200%2C800&ssl=1" },
  { name: "Organic Brake Pads", description: "Eco-friendly brake pads for standard vehicles.", price: 30.00, part_type_name: "Brake Pads", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/ebp-fa693_xl.jpg" },
  { name: "Copper Radiator", description: "High-efficiency copper radiator for superior cooling.", price: 100.00, part_type_name: "Radiator", active: true, url: "https://5.imimg.com/data5/LB/RR/TS/SELLER-19252368/hitachi-ex100-excavator-radiator-core-5-rows-h-2fd-31-1000x1000.jpg" },
  { name: "Multi-Port Fuel Injector", description: "Advanced fuel injector for better fuel distribution.", price: 80.00, part_type_name: "Fuel Injector", active: true, url: "https://m.media-amazon.com/images/I/713VrmRORpL.__AC_SY300_SX300_QL70_FMwebp_.jpg" },
  { name: "Heavy Duty Catalytic Converter", description: "High-performance catalytic converter for trucks.", price: 150.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/41E3LTKRmAL.jpg" },
  { name: "Coilover Suspension Struts", description: "Adjustable coilover struts for performance tuning.", price: 450.00, part_type_name: "Suspension Struts", active: false, url: "https://i.ebayimg.com/images/g/BckAAOSw~Zpmi4-D/s-l1600.webp" },
  { name: "Lead-Acid Battery", description: "Affordable and reliable battery for standard vehicles.", price: 50.00, part_type_name: "Battery", active: true, url: "https://cdn.media.halfords.ie/i/washford/950592?w=1480&h=1110&qlt=default&fmt=auto&v=1" },
  { name: "Turbo Exhaust Muffler", description: "Performance exhaust muffler for turbocharged engines.", price: 80.00, part_type_name: "Exhaust Muffler", active: true, url: "https://www.hks-power.co.jp/storage/syshks/product_db/G3iZDWLelvwjS3PX7uK1DkKVq9RP9W3sZtZvQwgd.jpeg" },
  { name: "Electric Power Steering", description: "Electric power steering for better fuel efficiency.", price: 150.00, part_type_name: "Power Steering", active: false, url: "https://www.bosch-mobility.com/media/global/solutions/passenger-cars-and-light-commercial-vehicles/steering-systems/motronic-electronic-control-unit/epsp_product_bg_1176x662.jpg" },
  { name: "High-Speed Wheel Bearing", description: "Precision wheel bearing designed for high-speed vehicles.", price: 60.00, part_type_name: "Wheel Bearing", active: true, url: "https://m.media-amazon.com/images/I/41IG8Ri804L.__AC_SX300_SY300_QL70_ML2_.jpg" },
  { name: "Off-Road Shock Absorber", description: "Shock absorbers designed for rugged off-road terrains.", price: 70.00, part_type_name: "Shock Absorber", active: true, url: "https://www.intraxracing.nl/en/wp-content/uploads/sites/2/2022/04/0_INTRAX-Suspension-Shock-absorber-schokdemper-demper-schroefset-verlaging-coilover-Alfa-Romeo-Sud-4-Weg-BT-ARC-Rally-RR-scaled-1-scaled.jpg" },
  { name: "Magnetic Oil Filter", description: "Oil filter with a magnetic core for improved filtration.", price: 25.00, part_type_name: "Oil Filter", active: false, url: "https://www.magnet-tool.com/media/143/FP-6%20oil%20filter%20magnet_s.jpg" },
  { name: "K&N Air Filter", description: "High-performance air filter for better airflow and power.", price: 50.00, part_type_name: "Air Filter", active: true, url: "https://www.speedfactoryracing.net/cdn/shop/products/4d5e0e5bd30eff4e58588a5251d9665f_1024x1024.jpg?v=1694190883" },
  { name: "Twin-Turbo V8 Engine", description: "Twin-turbo V8 engine for maximum performance.", price: 1000.00, part_type_name: "Engine", active: true, url: "https://s3.amazonaws.com/wp-images.bankspower.com/performance-upgrades/wp-content/uploads/2004/09/TwinTurbo-engine.jpg" },
  { name: "Manual Transmission", description: "Traditional manual transmission for driving enthusiasts.", price: 600.00, part_type_name: "Transmission", active: true, url: "https://www.speednik.com/wp-content/blogs.dir/1/files/2012/10/zf-seven-speed-transmission.jpg" },
  { name: "High-Output Alternator", description: "Alternator with a higher output for power-hungry vehicles.", price: 70.00, part_type_name: "Alternator", active: false, url: "https://cdn11.bigcommerce.com/s-yu3g4/images/stencil/1280x1280/products/6818/12938/InShot_20230413_145358853__41233.1681416162.jpg?c=2" },
  { name: "Carbon Ceramic Brake Pads", description: "Lightweight carbon-ceramic brake pads for superior braking.", price: 80.00, part_type_name: "Brake Pads", active: true, url: "https://www.brembo.com/en/PublishingImages/auto/primo-equipaggiamento/prodotti/dischi-carbo-ceramici/test22.jpg" },
  { name: "Dual-Pass Radiator", description: "High-performance dual-pass radiator for extreme cooling.", price: 200.00, part_type_name: "Radiator", active: true, url: "https://cdn11.bigcommerce.com/s-k9b7cqysdc/images/stencil/original/products/3949/19517/ALL30037__31401.1654003830.jpg?c=2" },
  { name: "Direct Injection Fuel Injector", description: "Fuel injector designed for direct injection engines.", price: 80.00, part_type_name: "Fuel Injector", active: true, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStqdnYtMvIlvqQMhWEsB8xcxJaBeT41_3dTg&s" },
  { name: "Sport Catalytic Converter", description: "High-flow catalytic converter for performance vehicles.", price: 100.00, part_type_name: "Catalytic Converter", active: true, url: "https://kat-eko.com/1092-large_default/sport-catalytic-converter-30-50l-awg.jpg" },
  { name: "Heavy Duty Suspension Struts", description: "Suspension struts designed for heavy-duty trucks.", price: 200.00, part_type_name: "Suspension Struts", active: false, url: "https://www.roughtrax4x4.com/media/catalog/product/cache/d74f5b23564b9a62c91e7856fa420aef/s/t/strut004_kavo_pedders-min.jpg" },
  { name: "Deep Cycle Battery", description: "Battery designed for long-lasting power in RVs and boats.", price: 100.00, part_type_name: "Battery", active: true, url: "https://auviras.lt/41464843-large_default/intact-active-gel-12v-140-20h-deep-cycle-gel-battery.jpg" },

  { name: "NA V8 Engine", description: "High-performance V8 engine for sports cars.", price: 900.00, part_type_name: "Engine", active: true, url: "https://cimg1.ibsrv.net/ibimg/hgm/1600x900-1/100/448/2014-volvo-v8-supercars-race-car-engine_100448945.jpg" },
  { name: "NA Automatic Transmission", description: "Smooth automatic transmission for sedans.", price: 400.00, part_type_name: "Transmission", active: false, url: "https://www.autoblog.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_640/MjA5MTUyODc0Njk2MTU2Nzg0/image-placeholder-title.webp" },
  { name: "NA Heavy Duty Alternator", description: "Durable alternator for trucks and SUVs.", price: 100.00, part_type_name: "Alternator", active: true, url: "https://www.wosperformance.co.uk/clientarea/images/product-catalogue/LMA499-SE.jpg" },
  { name: "NA Ceramic Brake Pads", description: "High-quality brake pads for enhanced stopping power.", price: 30.00, part_type_name: "Brake Pads", active: true, url: "https://felixperformance.com/cdn/shop/products/19996a3725e294c6f875abe909d52d05_b5344ff8-2568-4095-8b17-22ee8b1f09e3_500x.jpg?v=1702767477" },
  { name: "NA Aluminum Radiator", description: "Lightweight radiator for efficient cooling.", price: 100.00, part_type_name: "Radiator", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/sum-384002_it_xl.jpg" },
  { name: "NA Performance Fuel Injector", description: "High-flow fuel injector for improved engine performance.", price: 60.00, part_type_name: "Fuel Injector", active: true, url: "https://www.texas-speed.com/images/Product/large/11077.jpg" },
  { name: "NA Universal Catalytic Converter", description: "Eco-friendly catalytic converter suitable for most vehicles.", price: 100.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/61aQXRRnzBL._AC_SX466_.jpg" },
  { name: "NA Adjustable Suspension Struts", description: "Customizable suspension struts for improved ride quality.", price: 200.00, part_type_name: "Suspension Struts", active: true, url: "https://m.media-amazon.com/images/I/61jvguz8kQL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "NA Lithium-ion Battery", description: "Long-lasting lithium-ion car battery.", price: 80.00, part_type_name: "Battery", active: true, url: "https://m.media-amazon.com/images/I/61i9PnpSI7L.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "NA Sport Exhaust Muffler", description: "Low-restriction muffler for sporty sound.", price: 70.00, part_type_name: "Exhaust Muffler", active: true, url: "https://dcsports.com/cdn/shop/products/DCMU-300-ST_1_d2a65315-6302-47fc-9606-67cb60e6ffa0_1800x1800.jpg?v=1661204502" },
  { name: "NA Hydraulic Power Steering", description: "Efficient power steering for smooth handling.", price: 100.00, part_type_name: "Power Steering", active: false, url: "https://webshop.vetus.com/storage/HT1018806_8-780.webp" },
  { name: "NA High-Performance Wheel Bearing", description: "Durable wheel bearing for high-speed performance.", price: 60.00, part_type_name: "Wheel Bearing", active: true, url: "https://faiauto.com/content/uploads/2018/09/Bearing-cutaway-1200x650.jpg" },
  { name: "NA Heavy Duty Shock Absorber", description: "Shock absorber designed for off-road vehicles.", price: 90.00, part_type_name: "Shock Absorber", active: true, url: "https://m.media-amazon.com/images/I/717tr8m--qL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "NA Oil Filter", description: "High-efficiency oil filter for cleaner engine operation.", price: 20.00, part_type_name: "Oil Filter", active: true, url: "https://pierce-images.imgix.net/images/0/e/7/9/0e79d8ac8000029051071934dec05504953487f1_2_TW04_1P_611_0_10.png?bg=F0F1F2&auto=compress&auto=format&h=630&w=630" },
  { name: "NA Premium Air Filter", description: "High-flow air filter for better engine breathing.", price: 30.00, part_type_name: "Air Filter", active: false, url: "https://autotalent.com/cdn/shop/products/e86b7d264eb748b29526e2dc72650d8c_750x750.jpg?v=1663222132" },
  { name: "NA Supercharged V8 Engine", description: "Supercharged engine for extreme performance.", price: 1300.00, part_type_name: "Engine", active: true, url: "https://www.enginediy.com/cdn/shop/products/4de07975-5d04-4157-ad7c-5ddf5f9e4d47_c09e21c9-784a-43c7-bc1e-0b4f954d83bf_700x700.jpg?v=1664517472" },
  { name: "NA CVT Transmission", description: "Continuously variable transmission for smooth acceleration.", price: 700.00, part_type_name: "Transmission", active: true, url: "https://s19526.pcdn.co/wp-content/uploads/2024/02/CVT-Trans.jpg" },
  { name: "NA Compact Alternator", description: "Small but powerful alternator for compact cars.", price: 80.00, part_type_name: "Alternator", active: true, url: "https://i0.wp.com/www.heavymetalgarage.com.au/wp-content/uploads/2019/06/FP0049.jpg?fit=1200%2C800&ssl=1" },
  { name: "NA Organic Brake Pads", description: "Eco-friendly brake pads for standard vehicles.", price: 50.00, part_type_name: "Brake Pads", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/ebp-fa693_xl.jpg" },
  { name: "NA Copper Radiator", description: "High-efficiency copper radiator for superior cooling.", price: 100.00, part_type_name: "Radiator", active: false, url: "https://5.imimg.com/data5/LB/RR/TS/SELLER-19252368/hitachi-ex100-excavator-radiator-core-5-rows-h-2fd-31-1000x1000.jpg" },
  { name: "NA Multi-Port Fuel Injector", description: "Advanced fuel injector for better fuel distribution.", price: 70.00, part_type_name: "Fuel Injector", active: true, url: "https://m.media-amazon.com/images/I/713VrmRORpL.__AC_SY300_SX300_QL70_FMwebp_.jpg" },
  { name: "NA Heavy Duty Catalytic Converter", description: "High-performance catalytic converter for trucks.", price: 100.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/41E3LTKRmAL.jpg" },
  { name: "NA Coilover Suspension Struts", description: "Adjustable coilover struts for performance tuning.", price: 250.00, part_type_name: "Suspension Struts", active: true, url: "https://i.ebayimg.com/images/g/BckAAOSw~Zpmi4-D/s-l1600.webp" },
  { name: "NA Lead-Acid Battery", description: "Affordable and reliable battery for standard vehicles.", price: 30.00, part_type_name: "Battery", active: true, url: "https://cdn.media.halfords.ie/i/washford/950592?w=1480&h=1110&qlt=default&fmt=auto&v=1" },
  { name: "NA Turbo Exhaust Muffler", description: "Performance exhaust muffler for turbocharged engines.", price: 90.00, part_type_name: "Exhaust Muffler", active: true, url: "https://www.hks-power.co.jp/storage/syshks/product_db/G3iZDWLelvwjS3PX7uK1DkKVq9RP9W3sZtZvQwgd.jpeg" },
  { name: "NA Electric Power Steering", description: "Electric power steering for better fuel efficiency.", price: 150.00, part_type_name: "Power Steering", active: false, url: "https://www.bosch-mobility.com/media/global/solutions/passenger-cars-and-light-commercial-vehicles/steering-systems/motronic-electronic-control-unit/epsp_product_bg_1176x662.jpg" },
  { name: "NA High-Speed Wheel Bearing", description: "Precision wheel bearing designed for high-speed vehicles.", price: 50.00, part_type_name: "Wheel Bearing", active: true, url: "https://m.media-amazon.com/images/I/41IG8Ri804L.__AC_SX300_SY300_QL70_ML2_.jpg" },
  { name: "NA Off-Road Shock Absorber", description: "Shock absorbers designed for rugged off-road terrains.", price: 50.00, part_type_name: "Shock Absorber", active: true, url: "https://www.intraxracing.nl/en/wp-content/uploads/sites/2/2022/04/0_INTRAX-Suspension-Shock-absorber-schokdemper-demper-schroefset-verlaging-coilover-Alfa-Romeo-Sud-4-Weg-BT-ARC-Rally-RR-scaled-1-scaled.jpg" },
  { name: "NA Magnetic Oil Filter", description: "Oil filter with a magnetic core for improved filtration.", price: 25.00, part_type_name: "Oil Filter", active: false, url: "https://www.magnet-tool.com/media/143/FP-6%20oil%20filter%20magnet_s.jpg" },
  { name: "NA K&N Air Filter", description: "High-performance air filter for better airflow and power.", price: 60.00, part_type_name: "Air Filter", active: true, url: "https://www.speedfactoryracing.net/cdn/shop/products/4d5e0e5bd30eff4e58588a5251d9665f_1024x1024.jpg?v=1694190883" },
  { name: "NA Twin-Turbo V8 Engine", description: "Twin-turbo V8 engine for maximum performance.", price: 1600.00, part_type_name: "Engine", active: false, url: "https://s3.amazonaws.com/wp-images.bankspower.com/performance-upgrades/wp-content/uploads/2004/09/TwinTurbo-engine.jpg" },
  { name: "NA Manual Transmission", description: "Traditional manual transmission for driving enthusiasts.", price: 500.00, part_type_name: "Transmission", active: true, url: "https://www.speednik.com/wp-content/blogs.dir/1/files/2012/10/zf-seven-speed-transmission.jpg" },
  { name: "NA High-Output Alternator", description: "Alternator with a higher output for power-hungry vehicles.", price: 80.00, part_type_name: "Alternator", active: true, url: "https://cdn11.bigcommerce.com/s-yu3g4/images/stencil/1280x1280/products/6818/12938/InShot_20230413_145358853__41233.1681416162.jpg?c=2" },
  { name: "NA Carbon Ceramic Brake Pads", description: "Lightweight carbon-ceramic brake pads for superior braking.", price: 90.00, part_type_name: "Brake Pads", active: true, url: "https://www.brembo.com/en/PublishingImages/auto/primo-equipaggiamento/prodotti/dischi-carbo-ceramici/test22.jpg" },
  { name: "NA Dual-Pass Radiator", description: "High-performance dual-pass radiator for extreme cooling.", price: 100.00, part_type_name: "Radiator", active: true, url: "https://cdn11.bigcommerce.com/s-k9b7cqysdc/images/stencil/original/products/3949/19517/ALL30037__31401.1654003830.jpg?c=2" },
  { name: "NA Direct Injection Fuel Injector", description: "Fuel injector designed for direct injection engines.", price: 80.00, part_type_name: "Fuel Injector", active: true, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStqdnYtMvIlvqQMhWEsB8xcxJaBeT41_3dTg&s" },
  { name: "NA Sport Catalytic Converter", description: "High-flow catalytic converter for performance vehicles.", price: 200.00, part_type_name: "Catalytic Converter", active: true, url: "https://kat-eko.com/1092-large_default/sport-catalytic-converter-30-50l-awg.jpg" },
  { name: "NA Heavy Duty Suspension Struts", description: "Suspension struts designed for heavy-duty trucks.", price: 200.00, part_type_name: "Suspension Struts", active: true, url: "https://www.roughtrax4x4.com/media/catalog/product/cache/d74f5b23564b9a62c91e7856fa420aef/s/t/strut004_kavo_pedders-min.jpg" },
  { name: "NA Deep Cycle Battery", description: "Battery designed for long-lasting power in RVs and boats.", price: 100.00, part_type_name: "Battery", active: true, url: "https://auviras.lt/41464843-large_default/intact-active-gel-12v-140-20h-deep-cycle-gel-battery.jpg" },

  { name: "DS V8 Engine", description: "High-performance V8 engine for sports cars.", price: 800.00, part_type_name: "Engine", active: true, url: "https://cimg1.ibsrv.net/ibimg/hgm/1600x900-1/100/448/2014-volvo-v8-supercars-race-car-engine_100448945.jpg" },
  { name: "DS Automatic Transmission", description: "Smooth automatic transmission for sedans.", price: 400.00, part_type_name: "Transmission", active: false, url: "https://www.autoblog.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_640/MjA5MTUyODc0Njk2MTU2Nzg0/image-placeholder-title.webp" },
  { name: "DS Heavy Duty Alternator", description: "Durable alternator for trucks and SUVs.", price: 70.00, part_type_name: "Alternator", active: true, url: "https://www.wosperformance.co.uk/clientarea/images/product-catalogue/LMA499-SE.jpg" },
  { name: "DS Ceramic Brake Pads", description: "High-quality brake pads for enhanced stopping power.", price: 40.00, part_type_name: "Brake Pads", active: true, url: "https://felixperformance.com/cdn/shop/products/19996a3725e294c6f875abe909d52d05_b5344ff8-2568-4095-8b17-22ee8b1f09e3_500x.jpg?v=1702767477" },
  { name: "DS Aluminum Radiator", description: "Lightweight radiator for efficient cooling.", price: 100.00, part_type_name: "Radiator", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/sum-384002_it_xl.jpg" },
  { name: "DS Performance Fuel Injector", description: "High-flow fuel injector for improved engine performance.", price: 80.00, part_type_name: "Fuel Injector", active: true, url: "https://www.texas-speed.com/images/Product/large/11077.jpg" },
  { name: "DS Universal Catalytic Converter", description: "Eco-friendly catalytic converter suitable for most vehicles.", price: 100.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/61aQXRRnzBL._AC_SX466_.jpg" },
  { name: "DS Adjustable Suspension Struts", description: "Customizable suspension struts for improved ride quality.", price: 150.00, part_type_name: "Suspension Struts", active: true, url: "https://m.media-amazon.com/images/I/61jvguz8kQL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "DS Lithium-ion Battery", description: "Long-lasting lithium-ion car battery.", price: 70.00, part_type_name: "Battery", active: true, url: "https://m.media-amazon.com/images/I/61i9PnpSI7L.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "DS Sport Exhaust Muffler", description: "Low-restriction muffler for sporty sound.", price: 90.00, part_type_name: "Exhaust Muffler", active: true, url: "https://dcsports.com/cdn/shop/products/DCMU-300-ST_1_d2a65315-6302-47fc-9606-67cb60e6ffa0_1800x1800.jpg?v=1661204502" },
  { name: "DS Hydraulic Power Steering", description: "Efficient power steering for smooth handling.", price: 160.00, part_type_name: "Power Steering", active: true, url: "https://webshop.vetus.com/storage/HT1018806_8-780.webp" },
  { name: "DS High-Performance Wheel Bearing", description: "Durable wheel bearing for high-speed performance.", price: 50.00, part_type_name: "Wheel Bearing", active: true, url: "https://faiauto.com/content/uploads/2018/09/Bearing-cutaway-1200x650.jpg" },
  { name: "DS Heavy Duty Shock Absorber", description: "Shock absorber designed for off-road vehicles.", price: 90.00, part_type_name: "Shock Absorber", active: true, url: "https://m.media-amazon.com/images/I/717tr8m--qL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "DS Oil Filter", description: "High-efficiency oil filter for cleaner engine operation.", price: 20.00, part_type_name: "Oil Filter", active: false, url: "https://pierce-images.imgix.net/images/0/e/7/9/0e79d8ac8000029051071934dec05504953487f1_2_TW04_1P_611_0_10.png?bg=F0F1F2&auto=compress&auto=format&h=630&w=630" },
  { name: "DS Premium Air Filter", description: "High-flow air filter for better engine breathing.", price: 30.00, part_type_name: "Air Filter", active: true, url: "https://autotalent.com/cdn/shop/products/e86b7d264eb748b29526e2dc72650d8c_750x750.jpg?v=1663222132" },
  { name: "DS Supercharged V8 Engine", description: "Supercharged engine for extreme performance.", price: 1400.00, part_type_name: "Engine", active: true, url: "https://www.enginediy.com/cdn/shop/products/4de07975-5d04-4157-ad7c-5ddf5f9e4d47_c09e21c9-784a-43c7-bc1e-0b4f954d83bf_700x700.jpg?v=1664517472" },
  { name: "DS CVT Transmission", description: "Continuously variable transmission for smooth acceleration.", price: 400.00, part_type_name: "Transmission", active: true, url: "https://s19526.pcdn.co/wp-content/uploads/2024/02/CVT-Trans.jpg" },
  { name: "DS Compact Alternator", description: "Small but powerful alternator for compact cars.", price: 90.00, part_type_name: "Alternator", active: true, url: "https://i0.wp.com/www.heavymetalgarage.com.au/wp-content/uploads/2019/06/FP0049.jpg?fit=1200%2C800&ssl=1" },
  { name: "DS Organic Brake Pads", description: "Eco-friendly brake pads for standard vehicles.", price: 60.00, part_type_name: "Brake Pads", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/ebp-fa693_xl.jpg" },
  { name: "DS Copper Radiator", description: "High-efficiency copper radiator for superior cooling.", price: 100.00, part_type_name: "Radiator", active: true, url: "https://5.imimg.com/data5/LB/RR/TS/SELLER-19252368/hitachi-ex100-excavator-radiator-core-5-rows-h-2fd-31-1000x1000.jpg" },
  { name: "DS Multi-Port Fuel Injector", description: "Advanced fuel injector for better fuel distribution.", price: 80.00, part_type_name: "Fuel Injector", active: false, url: "https://m.media-amazon.com/images/I/713VrmRORpL.__AC_SY300_SX300_QL70_FMwebp_.jpg" },
  { name: "DS Heavy Duty Catalytic Converter", description: "High-performance catalytic converter for trucks.", price: 140.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/41E3LTKRmAL.jpg" },
  { name: "DS Coilover Suspension Struts", description: "Adjustable coilover struts for performance tuning.", price: 350.00, part_type_name: "Suspension Struts", active: true, url: "https://i.ebayimg.com/images/g/BckAAOSw~Zpmi4-D/s-l1600.webp" },
  { name: "DS Lead-Acid Battery", description: "Affordable and reliable battery for standard vehicles.", price: 40.00, part_type_name: "Battery", active: true, url: "https://cdn.media.halfords.ie/i/washford/950592?w=1480&h=1110&qlt=default&fmt=auto&v=1" },
  { name: "DS Turbo Exhaust Muffler", description: "Performance exhaust muffler for turbocharged engines.", price: 80.00, part_type_name: "Exhaust Muffler", active: true, url: "https://www.hks-power.co.jp/storage/syshks/product_db/G3iZDWLelvwjS3PX7uK1DkKVq9RP9W3sZtZvQwgd.jpeg" },
  { name: "DS Electric Power Steering", description: "Electric power steering for better fuel efficiency.", price: 150.00, part_type_name: "Power Steering", active: true, url: "https://www.bosch-mobility.com/media/global/solutions/passenger-cars-and-light-commercial-vehicles/steering-systems/motronic-electronic-control-unit/epsp_product_bg_1176x662.jpg" },
  { name: "DS High-Speed Wheel Bearing", description: "Precision wheel bearing designed for high-speed vehicles.", price: 60.00, part_type_name: "Wheel Bearing", active: false, url: "https://m.media-amazon.com/images/I/41IG8Ri804L.__AC_SX300_SY300_QL70_ML2_.jpg" },
  { name: "DS Off-Road Shock Absorber", description: "Shock absorbers designed for rugged off-road terrains.", price: 70.00, part_type_name: "Shock Absorber", active: true, url: "https://www.intraxracing.nl/en/wp-content/uploads/sites/2/2022/04/0_INTRAX-Suspension-Shock-absorber-schokdemper-demper-schroefset-verlaging-coilover-Alfa-Romeo-Sud-4-Weg-BT-ARC-Rally-RR-scaled-1-scaled.jpg" },
  { name: "DS Magnetic Oil Filter", description: "Oil filter with a magnetic core for improved filtration.", price: 25.00, part_type_name: "Oil Filter", active: true, url: "https://www.magnet-tool.com/media/143/FP-6%20oil%20filter%20magnet_s.jpg" },
  { name: "DS K&N Air Filter", description: "High-performance air filter for better airflow and power.", price: 60.00, part_type_name: "Air Filter", active: false, url: "https://www.speedfactoryracing.net/cdn/shop/products/4d5e0e5bd30eff4e58588a5251d9665f_1024x1024.jpg?v=1694190883" },
  { name: "DS Twin-Turbo V8 Engine", description: "Twin-turbo V8 engine for maximum performance.", price: 1600.00, part_type_name: "Engine", active: true, url: "https://s3.amazonaws.com/wp-images.bankspower.com/performance-upgrades/wp-content/uploads/2004/09/TwinTurbo-engine.jpg" },
  { name: "DS Manual Transmission", description: "Traditional manual transmission for driving enthusiasts.", price: 400.00, part_type_name: "Transmission", active: true, url: "https://www.speednik.com/wp-content/blogs.dir/1/files/2012/10/zf-seven-speed-transmission.jpg" },
  { name: "DS High-Output Alternator", description: "Alternator with a higher output for power-hungry vehicles.", price: 90.00, part_type_name: "Alternator", active: true, url: "https://cdn11.bigcommerce.com/s-yu3g4/images/stencil/1280x1280/products/6818/12938/InShot_20230413_145358853__41233.1681416162.jpg?c=2" },
  { name: "DS Carbon Ceramic Brake Pads", description: "Lightweight carbon-ceramic brake pads for superior braking.", price: 70.00, part_type_name: "Brake Pads", active: true, url: "https://www.brembo.com/en/PublishingImages/auto/primo-equipaggiamento/prodotti/dischi-carbo-ceramici/test22.jpg" },
  { name: "DS Dual-Pass Radiator", description: "High-performance dual-pass radiator for extreme cooling.", price: 180.00, part_type_name: "Radiator", active: false, url: "https://cdn11.bigcommerce.com/s-k9b7cqysdc/images/stencil/original/products/3949/19517/ALL30037__31401.1654003830.jpg?c=2" },
  { name: "DS Direct Injection Fuel Injector", description: "Fuel injector designed for direct injection engines.", price: 90.00, part_type_name: "Fuel Injector", active: true, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStqdnYtMvIlvqQMhWEsB8xcxJaBeT41_3dTg&s" },
  { name: "DS Sport Catalytic Converter", description: "High-flow catalytic converter for performance vehicles.", price: 140.00, part_type_name: "Catalytic Converter", active: true, url: "https://kat-eko.com/1092-large_default/sport-catalytic-converter-30-50l-awg.jpg" },
  { name: "DS Heavy Duty Suspension Struts", description: "Suspension struts designed for heavy-duty trucks.", price: 200.00, part_type_name: "Suspension Struts", active: true, url: "https://www.roughtrax4x4.com/media/catalog/product/cache/d74f5b23564b9a62c91e7856fa420aef/s/t/strut004_kavo_pedders-min.jpg" },
  { name: "DS Deep Cycle Battery", description: "Battery designed for long-lasting power in RVs and boats.", price: 100.00, part_type_name: "Battery", active: false, url: "https://auviras.lt/41464843-large_default/intact-active-gel-12v-140-20h-deep-cycle-gel-battery.jpg" },

  { name: "V2 V8 Engine", description: "High-performance V8 engine for sports cars.", price: 700.00, part_type_name: "Engine", active: true, url: "https://cimg1.ibsrv.net/ibimg/hgm/1600x900-1/100/448/2014-volvo-v8-supercars-race-car-engine_100448945.jpg" },
  { name: "V2 Automatic Transmission", description: "Smooth automatic transmission for sedans.", price: 300.00, part_type_name: "Transmission", active: true, url: "https://www.autoblog.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_640/MjA5MTUyODc0Njk2MTU2Nzg0/image-placeholder-title.webp" },
  { name: "V2 Heavy Duty Alternator", description: "Durable alternator for trucks and SUVs.", price: 70.00, part_type_name: "Alternator", active: false, url: "https://www.wosperformance.co.uk/clientarea/images/product-catalogue/LMA499-SE.jpg" },
  { name: "V2 Ceramic Brake Pads", description: "High-quality brake pads for enhanced stopping power.", price: 40.00, part_type_name: "Brake Pads", active: true, url: "https://felixperformance.com/cdn/shop/products/19996a3725e294c6f875abe909d52d05_b5344ff8-2568-4095-8b17-22ee8b1f09e3_500x.jpg?v=1702767477" },
  { name: "V2 Aluminum Radiator", description: "Lightweight radiator for efficient cooling.", price: 100.00, part_type_name: "Radiator", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/sum-384002_it_xl.jpg" },
  { name: "V2 Performance Fuel Injector", description: "High-flow fuel injector for improved engine performance.", price: 70.00, part_type_name: "Fuel Injector", active: true, url: "https://www.texas-speed.com/images/Product/large/11077.jpg" },
  { name: "V2 Universal Catalytic Converter", description: "Eco-friendly catalytic converter suitable for most vehicles.", price: 100.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/61aQXRRnzBL._AC_SX466_.jpg" },
  { name: "V2 Adjustable Suspension Struts", description: "Customizable suspension struts for improved ride quality.", price: 200.00, part_type_name: "Suspension Struts", active: false, url: "https://m.media-amazon.com/images/I/61jvguz8kQL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "V2 Lithium-ion Battery", description: "Long-lasting lithium-ion car battery.", price: 80.00, part_type_name: "Battery", active: true, url: "https://m.media-amazon.com/images/I/61i9PnpSI7L.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "V2 Sport Exhaust Muffler", description: "Low-restriction muffler for sporty sound.", price: 70.00, part_type_name: "Exhaust Muffler", active: true, url: "https://dcsports.com/cdn/shop/products/DCMU-300-ST_1_d2a65315-6302-47fc-9606-67cb60e6ffa0_1800x1800.jpg?v=1661204502" },
  { name: "V2 Hydraulic Power Steering", description: "Efficient power steering for smooth handling.", price: 180.00, part_type_name: "Power Steering", active: true, url: "https://webshop.vetus.com/storage/HT1018806_8-780.webp" },
  { name: "V2 High-Performance Wheel Bearing", description: "Durable wheel bearing for high-speed performance.", price: 60.00, part_type_name: "Wheel Bearing", active: true, url: "https://faiauto.com/content/uploads/2018/09/Bearing-cutaway-1200x650.jpg" },
  { name: "V2 Heavy Duty Shock Absorber", description: "Shock absorber designed for off-road vehicles.", price: 70.00, part_type_name: "Shock Absorber", active: false, url: "https://m.media-amazon.com/images/I/717tr8m--qL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "V2 Oil Filter", description: "High-efficiency oil filter for cleaner engine operation.", price: 20.00, part_type_name: "Oil Filter", active: true, url: "https://pierce-images.imgix.net/images/0/e/7/9/0e79d8ac8000029051071934dec05504953487f1_2_TW04_1P_611_0_10.png?bg=F0F1F2&auto=compress&auto=format&h=630&w=630" },
  { name: "V2 Premium Air Filter", description: "High-flow air filter for better engine breathing.", price: 40.00, part_type_name: "Air Filter", active: true, url: "https://autotalent.com/cdn/shop/products/e86b7d264eb748b29526e2dc72650d8c_750x750.jpg?v=1663222132" },
  { name: "V2 Supercharged V8 Engine", description: "Supercharged engine for extreme performance.", price: 1100.00, part_type_name: "Engine", active: true, url: "https://www.enginediy.com/cdn/shop/products/4de07975-5d04-4157-ad7c-5ddf5f9e4d47_c09e21c9-784a-43c7-bc1e-0b4f954d83bf_700x700.jpg?v=1664517472" },
  { name: "V2 CVT Transmission", description: "Continuously variable transmission for smooth acceleration.", price: 400.00, part_type_name: "Transmission", active: true, url: "https://s19526.pcdn.co/wp-content/uploads/2024/02/CVT-Trans.jpg" },
  { name: "V2 Compact Alternator", description: "Small but powerful alternator for compact cars.", price: 80.00, part_type_name: "Alternator", active: false, url: "https://i0.wp.com/www.heavymetalgarage.com.au/wp-content/uploads/2019/06/FP0049.jpg?fit=1200%2C800&ssl=1" },
  { name: "V2 Organic Brake Pads", description: "Eco-friendly brake pads for standard vehicles.", price: 80.00, part_type_name: "Brake Pads", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/ebp-fa693_xl.jpg" },
  { name: "V2 Copper Radiator", description: "High-efficiency copper radiator for superior cooling.", price: 100.00, part_type_name: "Radiator", active: true, url: "https://5.imimg.com/data5/LB/RR/TS/SELLER-19252368/hitachi-ex100-excavator-radiator-core-5-rows-h-2fd-31-1000x1000.jpg" },
  { name: "V2 Multi-Port Fuel Injector", description: "Advanced fuel injector for better fuel distribution.", price: 60.00, part_type_name: "Fuel Injector", active: true, url: "https://m.media-amazon.com/images/I/713VrmRORpL.__AC_SY300_SX300_QL70_FMwebp_.jpg" },
  { name: "V2 Heavy Duty Catalytic Converter", description: "High-performance catalytic converter for trucks.", price: 180.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/41E3LTKRmAL.jpg" },
  { name: "V2 Coilover Suspension Struts", description: "Adjustable coilover struts for performance tuning.", price: 109.00, part_type_name: "Suspension Struts", active: true, url: "https://i.ebayimg.com/images/g/BckAAOSw~Zpmi4-D/s-l1600.webp" },
  { name: "V2 Lead-Acid Battery", description: "Affordable and reliable battery for standard vehicles.", price: 50.00, part_type_name: "Battery", active: true, url: "https://cdn.media.halfords.ie/i/washford/950592?w=1480&h=1110&qlt=default&fmt=auto&v=1" },
  { name: "V2 Turbo Exhaust Muffler", description: "Performance exhaust muffler for turbocharged engines.", price: 60.00, part_type_name: "Exhaust Muffler", active: false, url: "https://www.hks-power.co.jp/storage/syshks/product_db/G3iZDWLelvwjS3PX7uK1DkKVq9RP9W3sZtZvQwgd.jpeg" },
  { name: "V2 Electric Power Steering", description: "Electric power steering for better fuel efficiency.", price: 150.00, part_type_name: "Power Steering", active: true, url: "https://www.bosch-mobility.com/media/global/solutions/passenger-cars-and-light-commercial-vehicles/steering-systems/motronic-electronic-control-unit/epsp_product_bg_1176x662.jpg" },
  { name: "V2 High-Speed Wheel Bearing", description: "Precision wheel bearing designed for high-speed vehicles.", price: 70.00, part_type_name: "Wheel Bearing", active: true, url: "https://m.media-amazon.com/images/I/41IG8Ri804L.__AC_SX300_SY300_QL70_ML2_.jpg" },
  { name: "V2 Off-Road Shock Absorber", description: "Shock absorbers designed for rugged off-road terrains.", price: 90.00, part_type_name: "Shock Absorber", active: true, url: "https://www.intraxracing.nl/en/wp-content/uploads/sites/2/2022/04/0_INTRAX-Suspension-Shock-absorber-schokdemper-demper-schroefset-verlaging-coilover-Alfa-Romeo-Sud-4-Weg-BT-ARC-Rally-RR-scaled-1-scaled.jpg" },
  { name: "V2 Magnetic Oil Filter", description: "Oil filter with a magnetic core for improved filtration.", price: 25.00, part_type_name: "Oil Filter", active: true, url: "https://www.magnet-tool.com/media/143/FP-6%20oil%20filter%20magnet_s.jpg" },
  { name: "V2 K&N Air Filter", description: "High-performance air filter for better airflow and power.", price: 50.00, part_type_name: "Air Filter", active: false, url: "https://www.speedfactoryracing.net/cdn/shop/products/4d5e0e5bd30eff4e58588a5251d9665f_1024x1024.jpg?v=1694190883" },
  { name: "V2 Twin-Turbo V8 Engine", description: "Twin-turbo V8 engine for maximum performance.", price: 1300.00, part_type_name: "Engine", active: false, url: "https://s3.amazonaws.com/wp-images.bankspower.com/performance-upgrades/wp-content/uploads/2004/09/TwinTurbo-engine.jpg" },
  { name: "V2 Manual Transmission", description: "Traditional manual transmission for driving enthusiasts.", price: 400.00, part_type_name: "Transmission", active: true, url: "https://www.speednik.com/wp-content/blogs.dir/1/files/2012/10/zf-seven-speed-transmission.jpg" },
  { name: "V2 High-Output Alternator", description: "Alternator with a higher output for power-hungry vehicles.", price: 80.00, part_type_name: "Alternator", active: true, url: "https://cdn11.bigcommerce.com/s-yu3g4/images/stencil/1280x1280/products/6818/12938/InShot_20230413_145358853__41233.1681416162.jpg?c=2" },
  { name: "V2 Carbon Ceramic Brake Pads", description: "Lightweight carbon-ceramic brake pads for superior braking.", price: 70.00, part_type_name: "Brake Pads", active: true, url: "https://www.brembo.com/en/PublishingImages/auto/primo-equipaggiamento/prodotti/dischi-carbo-ceramici/test22.jpg" },
  { name: "V2 Dual-Pass Radiator", description: "High-performance dual-pass radiator for extreme cooling.", price: 100.00, part_type_name: "Radiator", active: false, url: "https://cdn11.bigcommerce.com/s-k9b7cqysdc/images/stencil/original/products/3949/19517/ALL30037__31401.1654003830.jpg?c=2" },
  { name: "V2 Direct Injection Fuel Injector", description: "Fuel injector designed for direct injection engines.", price: 60.00, part_type_name: "Fuel Injector", active: true, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStqdnYtMvIlvqQMhWEsB8xcxJaBeT41_3dTg&s" },
  { name: "V2 Sport Catalytic Converter", description: "High-flow catalytic converter for performance vehicles.", price: 100.00, part_type_name: "Catalytic Converter", active: true, url: "https://kat-eko.com/1092-large_default/sport-catalytic-converter-30-50l-awg.jpg" },
  { name: "V2 Heavy Duty Suspension Struts", description: "Suspension struts designed for heavy-duty trucks.", price: 200.00, part_type_name: "Suspension Struts", active: true, url: "https://www.roughtrax4x4.com/media/catalog/product/cache/d74f5b23564b9a62c91e7856fa420aef/s/t/strut004_kavo_pedders-min.jpg" },
  { name: "V2 Deep Cycle Battery", description: "Battery designed for long-lasting power in RVs and boats.", price: 100.00, part_type_name: "Battery", active: false, url: "https://auviras.lt/41464843-large_default/intact-active-gel-12v-140-20h-deep-cycle-gel-battery.jpg" }
]

car_parts = []
car_parts_data.each do |data|
  part_type = PartType.find_by(name: data[:part_type_name])
  car_part = CarPart.create!(
    name: data[:name],
    description: data[:description],
    price: data[:price],
    part_type: part_type,
    seller: sellers.sample,
    active: data[:active],
    car_model: car_models.sample
  )

  car_parts << car_part
  car_part.image.attach(io: URI.open(data[:url]), filename: "image.jpg")

  # create stock
  car_part.build_stock(quantity: rand(0..500))
  car_part.stock.save!
end

# create order
customers.each do |customer|
  customer.build_cart
  customer.cart.save!

  car_parts = CarPart.joins(:stock).where(active: true).where('stocks.quantity > ?', 1)

  car_parts.sample(5).each do |car_part|
    customer.cart.cart_items.create!(
      car_part: car_part,
      quantity: rand(1..[ car_part.stock.quantity, 5 ].min)
    )
  end

  result = OrderService.create_order_from_cart(customer, "temp test address")

  if !result[:success]
    puts result[:error]
  end
end

# create cart items
customers.each do |customer|
  customer.build_cart
  customer.cart.save!

  car_parts = CarPart.joins(:stock).where(active: true).where('stocks.quantity > ?', 1)

  car_parts.sample(5).each do |car_part|
    customer.cart.cart_items.create!(
      car_part: car_part,
      quantity: rand(1..[ car_part.stock.quantity, 5 ].min)
    )
  end
end
