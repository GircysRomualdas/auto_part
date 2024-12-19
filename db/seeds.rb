require 'open-uri'

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
  { name: "Power Steering", description: "Power steering allows for easier steering of the vehicle.", url: "https://www.saicmgautoparts.com/uploads/STEERING-ASSEMBLY-10325996-70699744651.jpg" },
  { name: "Wheel Bearing", description: "Wheel bearings allow the wheels to rotate smoothly and reduce friction.", url: "https://marvel-b1-cdn.bc0a.com/f00000000270517/s19528.pcdn.co/wp-content/uploads/2021/10/Wheel-Bearings-1024x512.jpg" },
  { name: "Shock Absorber", description: "Shock absorbers dampen the impact of bumps and road irregularities.", url: "https://m.media-amazon.com/images/I/81Ns5JPE5VL.__AC_SY300_SX300_QL70_FMwebp_.jpg" },
  { name: "Oil Filter", description: "The oil filter removes contaminants from the engine oil.", url: "https://img.webike-cdn.net/catalogue/images/125355/35210_TM.jpg" },
  { name: "Air Filter", description: "The air filter prevents dirt and debris from entering the engine.", url: "https://www.quality-tuning.eu/images/stories/virtuemart/product/WS-002-1-simota-air-filter-(1).jpg" }
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


car_parts_data = [
  { name: "V8 Engine", description: "High-performance V8 engine for sports cars.", price: 2500.00, part_type_name: "Engine", active: true, url: "https://cimg1.ibsrv.net/ibimg/hgm/1600x900-1/100/448/2014-volvo-v8-supercars-race-car-engine_100448945.jpg" },
  { name: "Automatic Transmission", description: "Smooth automatic transmission for sedans.", price: 1500.00, part_type_name: "Transmission", active: true, url: "https://www.autoblog.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_640/MjA5MTUyODc0Njk2MTU2Nzg0/image-placeholder-title.webp" },
  { name: "Heavy Duty Alternator", description: "Durable alternator for trucks and SUVs.", price: 300.00, part_type_name: "Alternator", active: true, url: "https://www.wosperformance.co.uk/clientarea/images/product-catalogue/LMA499-SE.jpg" },
  { name: "Ceramic Brake Pads", description: "High-quality brake pads for enhanced stopping power.", price: 100.00, part_type_name: "Brake Pads", active: true, url: "https://felixperformance.com/cdn/shop/products/19996a3725e294c6f875abe909d52d05_b5344ff8-2568-4095-8b17-22ee8b1f09e3_500x.jpg?v=1702767477" },
  { name: "Aluminum Radiator", description: "Lightweight radiator for efficient cooling.", price: 400.00, part_type_name: "Radiator", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/sum-384002_it_xl.jpg" },
  { name: "Performance Fuel Injector", description: "High-flow fuel injector for improved engine performance.", price: 200.00, part_type_name: "Fuel Injector", active: true, url: "https://www.texas-speed.com/images/Product/large/11077.jpg" },
  { name: "Universal Catalytic Converter", description: "Eco-friendly catalytic converter suitable for most vehicles.", price: 500.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/61aQXRRnzBL._AC_SX466_.jpg" },
  { name: "Adjustable Suspension Struts", description: "Customizable suspension struts for improved ride quality.", price: 800.00, part_type_name: "Suspension Struts", active: true, url: "https://m.media-amazon.com/images/I/61jvguz8kQL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Lithium-ion Battery", description: "Long-lasting lithium-ion car battery.", price: 350.00, part_type_name: "Battery", active: true, url: "https://m.media-amazon.com/images/I/61i9PnpSI7L.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Sport Exhaust Muffler", description: "Low-restriction muffler for sporty sound.", price: 250.00, part_type_name: "Exhaust Muffler", active: true, url: "https://dcsports.com/cdn/shop/products/DCMU-300-ST_1_d2a65315-6302-47fc-9606-67cb60e6ffa0_1800x1800.jpg?v=1661204502" },
  { name: "Hydraulic Power Steering", description: "Efficient power steering for smooth handling.", price: 600.00, part_type_name: "Power Steering", active: true, url: "https://webshop.vetus.com/storage/HT1018806_8-780.webp" },
  { name: "High-Performance Wheel Bearing", description: "Durable wheel bearing for high-speed performance.", price: 150.00, part_type_name: "Wheel Bearing", active: true, url: "https://faiauto.com/content/uploads/2018/09/Bearing-cutaway-1200x650.jpg" },
  { name: "Heavy Duty Shock Absorber", description: "Shock absorber designed for off-road vehicles.", price: 250.00, part_type_name: "Shock Absorber", active: true, url: "https://m.media-amazon.com/images/I/717tr8m--qL.__AC_SX300_SY300_QL70_FMwebp_.jpg" },
  { name: "Oil Filter", description: "High-efficiency oil filter for cleaner engine operation.", price: 20.00, part_type_name: "Oil Filter", active: true, url: "https://pierce-images.imgix.net/images/0/e/7/9/0e79d8ac8000029051071934dec05504953487f1_2_TW04_1P_611_0_10.png?bg=F0F1F2&auto=compress&auto=format&h=630&w=630" },
  { name: "Premium Air Filter", description: "High-flow air filter for better engine breathing.", price: 40.00, part_type_name: "Air Filter", active: true, url: "https://autotalent.com/cdn/shop/products/e86b7d264eb748b29526e2dc72650d8c_750x750.jpg?v=1663222132" },
  { name: "Supercharged V8 Engine", description: "Supercharged engine for extreme performance.", price: 4500.00, part_type_name: "Engine", active: true, url: "https://www.enginediy.com/cdn/shop/products/4de07975-5d04-4157-ad7c-5ddf5f9e4d47_c09e21c9-784a-43c7-bc1e-0b4f954d83bf_700x700.jpg?v=1664517472" },
  { name: "CVT Transmission", description: "Continuously variable transmission for smooth acceleration.", price: 1800.00, part_type_name: "Transmission", active: true, url: "https://s19526.pcdn.co/wp-content/uploads/2024/02/CVT-Trans.jpg" },
  { name: "Compact Alternator", description: "Small but powerful alternator for compact cars.", price: 250.00, part_type_name: "Alternator", active: true, url: "https://i0.wp.com/www.heavymetalgarage.com.au/wp-content/uploads/2019/06/FP0049.jpg?fit=1200%2C800&ssl=1" },
  { name: "Organic Brake Pads", description: "Eco-friendly brake pads for standard vehicles.", price: 80.00, part_type_name: "Brake Pads", active: true, url: "https://static.summitracing.com/global/images/prod/xlarge/ebp-fa693_xl.jpg" },
  { name: "Copper Radiator", description: "High-efficiency copper radiator for superior cooling.", price: 500.00, part_type_name: "Radiator", active: true, url: "https://5.imimg.com/data5/LB/RR/TS/SELLER-19252368/hitachi-ex100-excavator-radiator-core-5-rows-h-2fd-31-1000x1000.jpg" },
  { name: "Multi-Port Fuel Injector", description: "Advanced fuel injector for better fuel distribution.", price: 220.00, part_type_name: "Fuel Injector", active: true, url: "https://m.media-amazon.com/images/I/713VrmRORpL.__AC_SY300_SX300_QL70_FMwebp_.jpg" },
  { name: "Heavy Duty Catalytic Converter", description: "High-performance catalytic converter for trucks.", price: 600.00, part_type_name: "Catalytic Converter", active: true, url: "https://m.media-amazon.com/images/I/41E3LTKRmAL.jpg" },
  { name: "Coilover Suspension Struts", description: "Adjustable coilover struts for performance tuning.", price: 950.00, part_type_name: "Suspension Struts", active: true, url: "https://i.ebayimg.com/images/g/BckAAOSw~Zpmi4-D/s-l1600.webp" },
  { name: "Lead-Acid Battery", description: "Affordable and reliable battery for standard vehicles.", price: 120.00, part_type_name: "Battery", active: true, url: "https://cdn.media.halfords.ie/i/washford/950592?w=1480&h=1110&qlt=default&fmt=auto&v=1" },
  { name: "Turbo Exhaust Muffler", description: "Performance exhaust muffler for turbocharged engines.", price: 350.00, part_type_name: "Exhaust Muffler", active: true, url: "https://www.hks-power.co.jp/storage/syshks/product_db/G3iZDWLelvwjS3PX7uK1DkKVq9RP9W3sZtZvQwgd.jpeg" },
  { name: "Electric Power Steering", description: "Electric power steering for better fuel efficiency.", price: 650.00, part_type_name: "Power Steering", active: true, url: "https://www.bosch-mobility.com/media/global/solutions/passenger-cars-and-light-commercial-vehicles/steering-systems/motronic-electronic-control-unit/epsp_product_bg_1176x662.jpg" },
  { name: "High-Speed Wheel Bearing", description: "Precision wheel bearing designed for high-speed vehicles.", price: 180.00, part_type_name: "Wheel Bearing", active: true, url: "https://m.media-amazon.com/images/I/41IG8Ri804L.__AC_SX300_SY300_QL70_ML2_.jpg" },
  { name: "Off-Road Shock Absorber", description: "Shock absorbers designed for rugged off-road terrains.", price: 300.00, part_type_name: "Shock Absorber", active: true, url: "https://www.intraxracing.nl/en/wp-content/uploads/sites/2/2022/04/0_INTRAX-Suspension-Shock-absorber-schokdemper-demper-schroefset-verlaging-coilover-Alfa-Romeo-Sud-4-Weg-BT-ARC-Rally-RR-scaled-1-scaled.jpg" },
  { name: "Magnetic Oil Filter", description: "Oil filter with a magnetic core for improved filtration.", price: 25.00, part_type_name: "Oil Filter", active: true, url: "https://www.magnet-tool.com/media/143/FP-6%20oil%20filter%20magnet_s.jpg" },
  { name: "K&N Air Filter", description: "High-performance air filter for better airflow and power.", price: 60.00, part_type_name: "Air Filter", active: true, url: "https://www.speedfactoryracing.net/cdn/shop/products/4d5e0e5bd30eff4e58588a5251d9665f_1024x1024.jpg?v=1694190883" },
  { name: "Twin-Turbo V8 Engine", description: "Twin-turbo V8 engine for maximum performance.", price: 6000.00, part_type_name: "Engine", active: true, url: "https://s3.amazonaws.com/wp-images.bankspower.com/performance-upgrades/wp-content/uploads/2004/09/TwinTurbo-engine.jpg" },
  { name: "Manual Transmission", description: "Traditional manual transmission for driving enthusiasts.", price: 1300.00, part_type_name: "Transmission", active: true, url: "https://www.speednik.com/wp-content/blogs.dir/1/files/2012/10/zf-seven-speed-transmission.jpg" },
  { name: "High-Output Alternator", description: "Alternator with a higher output for power-hungry vehicles.", price: 350.00, part_type_name: "Alternator", active: true, url: "https://cdn11.bigcommerce.com/s-yu3g4/images/stencil/1280x1280/products/6818/12938/InShot_20230413_145358853__41233.1681416162.jpg?c=2" },
  { name: "Carbon Ceramic Brake Pads", description: "Lightweight carbon-ceramic brake pads for superior braking.", price: 350.00, part_type_name: "Brake Pads", active: true, url: "https://www.brembo.com/en/PublishingImages/auto/primo-equipaggiamento/prodotti/dischi-carbo-ceramici/test22.jpg" },
  { name: "Dual-Pass Radiator", description: "High-performance dual-pass radiator for extreme cooling.", price: 700.00, part_type_name: "Radiator", active: true, url: "https://cdn11.bigcommerce.com/s-k9b7cqysdc/images/stencil/original/products/3949/19517/ALL30037__31401.1654003830.jpg?c=2" },
  { name: "Direct Injection Fuel Injector", description: "Fuel injector designed for direct injection engines.", price: 250.00, part_type_name: "Fuel Injector", active: true, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStqdnYtMvIlvqQMhWEsB8xcxJaBeT41_3dTg&s" },
  { name: "Sport Catalytic Converter", description: "High-flow catalytic converter for performance vehicles.", price: 700.00, part_type_name: "Catalytic Converter", active: true, url: "https://kat-eko.com/1092-large_default/sport-catalytic-converter-30-50l-awg.jpg" },
  { name: "Heavy Duty Suspension Struts", description: "Suspension struts designed for heavy-duty trucks.", price: 900.00, part_type_name: "Suspension Struts", active: true, url: "https://www.roughtrax4x4.com/media/catalog/product/cache/d74f5b23564b9a62c91e7856fa420aef/s/t/strut004_kavo_pedders-min.jpg" },
  { name: "Deep Cycle Battery", description: "Battery designed for long-lasting power in RVs and boats.", price: 400.00, part_type_name: "Battery", active: true, url: "https://auviras.lt/41464843-large_default/intact-active-gel-12v-140-20h-deep-cycle-gel-battery.jpg" }
]

car_parts = []
car_parts_data.each do |data|
  part_type = PartType.find_by(name: data[:part_type_name])
  car_part = CarPart.create!(
    name: data[:name],
    description: data[:description],
    price: data[:price],
    part_type: part_type,
    active: data[:active]
  )

  car_parts << car_part
  car_part.image.attach(io: URI.open(data[:url]), filename: "image.jpg")
end
