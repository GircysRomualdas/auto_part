CarPart.destroy_all
PartType.destroy_all
Customer.destroy_all
Admin.destroy_all

customer_data = []

22.times do |i|
  customer_data << { email: "customer#{i+1}@gmail.com", password: "password" }
end

customers = []
customer_data.each do |data|
  customers << Customer.create!(data)
end

admin_data = []

3.times do |i|
  admin_data << { email: "admin#{i+1}@gmail.com", password: "password" }
end

admins = []
admin_data.each do |data|
  admins << Admin.create!(data)
end


type_data = [
  { name: "Engine", description: "The engine converts fuel into mechanical energy to power the vehicle.", url: "https://traton.com/.imaging/mte/tab-theme/standardLandscape-XL/dam/02_Newsroom/01_News/Ehrenrunde-f%C3%BCr-den-Diesel/traton-header-cbe-motor.jpg/jcr:content/traton-header-cbe-motor.jpg" },
  { name: "Transmission", description: "The transmission system transfers power from the engine to the wheels.", url: "https://highgradeauto.com/wp-content/uploads/2014/06/Cars-Transmissions.jpg" },
  { name: "Alternator", description: "The alternator generates electrical power to charge the battery and run electrical systems.", url: "https://heielectric.com/wp-content/uploads/2023/05/7.3-200A.jpg" },
  { name: "Brake Pads", description: "Brake pads provide friction to slow down and stop the vehicle.", url: "https://neobrake.com/wp-content/uploads/2016/06/NeoBrake-Air-Disc-Brake-Pads-2.1.png" },
  { name: "Radiator", description: "The radiator helps to cool the engine by dissipating heat.", url: "https://5.imimg.com/data5/QK/LH/MY-11959742/automobile-radiator-1000x1000.jpg" },
  { name: "Fuel Injector", description: "The fuel injector delivers fuel into the engine’s combustion chamber.", url: "https://mydieselpro.com/wp-content/uploads/2020/01/0-986-435-597DX_P04-600x600.jpg" },
  { name: "Catalytic Converter", description: "The catalytic converter reduces harmful emissions from the exhaust.", url: "https://m.media-amazon.com/images/I/51oFUV8B74L.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Suspension Struts", description: "Suspension struts support the vehicle’s weight and absorb shocks from the road.", url: "https://static.summitracing.com/global/images/faqs/5260/strut.jpg" },
  { name: "Battery", description: "The battery provides the initial power to start the vehicle and powers electrical components.", url: "https://images.tayna.com/prod-images/1200/Powerline/065-powerline-45-435.jpg" },
  { name: "Exhaust Muffler", description: "The muffler reduces noise and emissions from the exhaust system.", url: "https://m.media-amazon.com/images/I/51dyA3YBlOL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Power Steering", description: "Power steering allows for easier steering of the vehicle.", url: "https://www.xdalys.lt/img/no-img.png" },
  { name: "Wheel Bearing", description: "Wheel bearings allow the wheels to rotate smoothly and reduce friction.", url: "https://marvel-b1-cdn.bc0a.com/f00000000270517/s19528.pcdn.co/wp-content/uploads/2021/10/Wheel-Bearings-1024x512.jpg" },
  { name: "Shock Absorber", description: "Shock absorbers dampen the impact of bumps and road irregularities.", url: "https://m.media-amazon.com/images/I/81Ns5JPE5VL.__AC_SY300_SX300_QL70_FMwebp_.jpg" },
  { name: "Oil Filter", description: "The oil filter removes contaminants from the engine oil.", url: "https://img.webike-cdn.net/catalogue/images/125355/35210_TM.jpg" },
  { name: "Air Filter", description: "The air filter prevents dirt and debris from entering the engine.", url: "https://www.quality-tuning.eu/images/stories/virtuemart/product/WS-002-1-simota-air-filter-(1).jpg" }
]

require 'open-uri'

part_types = []
type_data.each do |data|
  part_type = PartType.create!(
    name: data[:name],
    description: data[:description]
  )
  part_types << part_type
  part_type.image.attach(io: URI.open(data[:url]), filename: "image.jpg")
end


car_parts_data = [
  { name: "V8 Engine", description: "High-performance V8 engine for sports cars.", price: 2500.00, part_type_name: "Engine", active: true },
  { name: "Automatic Transmission", description: "Smooth automatic transmission for sedans.", price: 1500.00, part_type_name: "Transmission", active: true },
  { name: "Heavy Duty Alternator", description: "Durable alternator for trucks and SUVs.", price: 300.00, part_type_name: "Alternator", active: true },
  { name: "Ceramic Brake Pads", description: "High-quality brake pads for enhanced stopping power.", price: 100.00, part_type_name: "Brake Pads", active: true },
  { name: "Aluminum Radiator", description: "Lightweight radiator for efficient cooling.", price: 400.00, part_type_name: "Radiator", active: true },
  { name: "Performance Fuel Injector", description: "High-flow fuel injector for improved engine performance.", price: 200.00, part_type_name: "Fuel Injector", active: true },
  { name: "Universal Catalytic Converter", description: "Eco-friendly catalytic converter suitable for most vehicles.", price: 500.00, part_type_name: "Catalytic Converter", active: true },
  { name: "Adjustable Suspension Struts", description: "Customizable suspension struts for improved ride quality.", price: 800.00, part_type_name: "Suspension Struts", active: true },
  { name: "Lithium-ion Battery", description: "Long-lasting lithium-ion car battery.", price: 350.00, part_type_name: "Battery", active: true },
  { name: "Sport Exhaust Muffler", description: "Low-restriction muffler for sporty sound.", price: 250.00, part_type_name: "Exhaust Muffler", active: true },
  { name: "Hydraulic Power Steering", description: "Efficient power steering for smooth handling.", price: 600.00, part_type_name: "Power Steering", active: true },
  { name: "High-Performance Wheel Bearing", description: "Durable wheel bearing for high-speed performance.", price: 150.00, part_type_name: "Wheel Bearing", active: true },
  { name: "Heavy Duty Shock Absorber", description: "Shock absorber designed for off-road vehicles.", price: 250.00, part_type_name: "Shock Absorber", active: true },
  { name: "Oil Filter", description: "High-efficiency oil filter for cleaner engine operation.", price: 20.00, part_type_name: "Oil Filter", active: true },
  { name: "Premium Air Filter", description: "High-flow air filter for better engine breathing.", price: 40.00, part_type_name: "Air Filter", active: true },
  { name: "Supercharged V8 Engine", description: "Supercharged engine for extreme performance.", price: 4500.00, part_type_name: "Engine", active: true },
  { name: "CVT Transmission", description: "Continuously variable transmission for smooth acceleration.", price: 1800.00, part_type_name: "Transmission", active: true },
  { name: "Compact Alternator", description: "Small but powerful alternator for compact cars.", price: 250.00, part_type_name: "Alternator", active: true },
  { name: "Organic Brake Pads", description: "Eco-friendly brake pads for standard vehicles.", price: 80.00, part_type_name: "Brake Pads", active: true },
  { name: "Copper Radiator", description: "High-efficiency copper radiator for superior cooling.", price: 500.00, part_type_name: "Radiator", active: true },
  { name: "Multi-Port Fuel Injector", description: "Advanced fuel injector for better fuel distribution.", price: 220.00, part_type_name: "Fuel Injector", active: true },
  { name: "Heavy Duty Catalytic Converter", description: "High-performance catalytic converter for trucks.", price: 600.00, part_type_name: "Catalytic Converter", active: true },
  { name: "Coilover Suspension Struts", description: "Adjustable coilover struts for performance tuning.", price: 950.00, part_type_name: "Suspension Struts", active: true },
  { name: "Lead-Acid Battery", description: "Affordable and reliable battery for standard vehicles.", price: 120.00, part_type_name: "Battery", active: true },
  { name: "Turbo Exhaust Muffler", description: "Performance exhaust muffler for turbocharged engines.", price: 350.00, part_type_name: "Exhaust Muffler", active: true },
  { name: "Electric Power Steering", description: "Electric power steering for better fuel efficiency.", price: 650.00, part_type_name: "Power Steering", active: true },
  { name: "High-Speed Wheel Bearing", description: "Precision wheel bearing designed for high-speed vehicles.", price: 180.00, part_type_name: "Wheel Bearing", active: true },
  { name: "Off-Road Shock Absorber", description: "Shock absorbers designed for rugged off-road terrains.", price: 300.00, part_type_name: "Shock Absorber", active: true },
  { name: "Magnetic Oil Filter", description: "Oil filter with a magnetic core for improved filtration.", price: 25.00, part_type_name: "Oil Filter", active: true },
  { name: "K&N Air Filter", description: "High-performance air filter for better airflow and power.", price: 60.00, part_type_name: "Air Filter", active: true },
  { name: "Twin-Turbo V8 Engine", description: "Twin-turbo V8 engine for maximum performance.", price: 6000.00, part_type_name: "Engine", active: true },
  { name: "Manual Transmission", description: "Traditional manual transmission for driving enthusiasts.", price: 1300.00, part_type_name: "Transmission", active: true },
  { name: "High-Output Alternator", description: "Alternator with a higher output for power-hungry vehicles.", price: 350.00, part_type_name: "Alternator", active: true },
  { name: "Carbon Ceramic Brake Pads", description: "Lightweight carbon-ceramic brake pads for superior braking.", price: 350.00, part_type_name: "Brake Pads", active: true },
  { name: "Dual-Pass Radiator", description: "High-performance dual-pass radiator for extreme cooling.", price: 700.00, part_type_name: "Radiator", active: true },
  { name: "Direct Injection Fuel Injector", description: "Fuel injector designed for direct injection engines.", price: 250.00, part_type_name: "Fuel Injector", active: true },
  { name: "Sport Catalytic Converter", description: "High-flow catalytic converter for performance vehicles.", price: 700.00, part_type_name: "Catalytic Converter", active: true },
  { name: "Heavy Duty Suspension Struts", description: "Suspension struts designed for heavy-duty trucks.", price: 900.00, part_type_name: "Suspension Struts", active: true },
  { name: "Deep Cycle Battery", description: "Battery designed for long-lasting power in RVs and boats.", price: 400.00, part_type_name: "Battery", active: true }
]

car_parts_data.each do |data|
  part_type = PartType.find_by(name: data[:part_type_name])
  CarPart.create!(
    name: data[:name],
    description: data[:description],
    price: data[:price],
    part_type: part_type,
    active: data[:active]
  )
end
