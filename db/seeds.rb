# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Service.destroy_all

framing = Service.create(name: "Framing", description: "Rough-in framing; stick-built, steel stud, block, or post and beam.")
concrete = Service.create(name: "Concrete", description: "Structural concrete.")
plumbing = Service.create(name: "Plumbing", description: "Rough-in plumbing.")
landscape = Service.create(name: "Landscape", description: "Landscaping - irrigation systems, plants, etc.")
electrical = Service.create(name: "Electrical", description: "Rough and finish electrical.")
hvac = Service.create(name: "HVAC", description: "All-inclusive HVAC.")
painting = Service.create(name: "Painting", description: "Interior and exterior painting.")
sheetrock = Service.create(name: "Sheetrock", description: "Sheetrock, mud, tape, and finish.")
flooring = Service.create(name: "Flooring", description: "Carpet, tile, hardwood, linoleum, and concrete.")
roofing = Service.create(name: "Roofing", description: "Asphalt shingle, wood shake, metal, foam, and tile.")
insulation = Service.create(name: "Insulation", description: "Rolled, blown-in, paper, fiberglass, straw, void, and wool.")
cabinetry = Service.create(name: "Cabinetry", description: "Kitchen, laundry, garage, utility, and bathroom.")
doors = Service.create(name: "Doors", description: "Indoor and outdoor doors.")
windows = Service.create(name: "Windows", description: "Single pane, dual pane, tinted; prep, install, and sealing.")
masonry = Service.create(name: "Masonry", description: "Structural and aesthetic masonry.")
stucco = Service.create(name: "Stucco", description: "Felt, foam, mesh, and stucco.")
siding = Service.create(name: "Siding", description: "Vinyl and metal siding.")
fixtures_and_finishes = Service.create(name: "Fixtures and Finishes", description: "Faucets, lights, fans, toilets, outlets, and switches.")

# jane_doe = Homeowner.create(name: "Jane Doe", address: "1247 N Cantilever Ln Loveland, CO 80537", phone: 7201148945, email: "jane_do3@email.com")

jack_of_all_trades = Service_Provider.create(type: "Freelancer", name: "Jack of All Trades", street_name: "411 Main St", city: "Loveland", state: "CO", zipcode: 80537, service_area: "50 mile radius", years_in_service: 8)
