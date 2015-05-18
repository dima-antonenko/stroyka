class ImportController < ApplicationController
	layout false
	def index

		Product.destroy_all
		Collection.destroy_all
		Connection.destroy_all


		@xml = File.read("public/catalog.xml")
		@hash = Hash.from_xml(@xml)
		@colletions = @hash["bau_catalog"]["groupProduct"]["collection_list"]["collection"]
		@products  = @hash["bau_catalog"]["groupProduct"]["element_list"]["element"]

		@products.each do |product|

			category_id = 1

			if product["collection_list"]["collection"].class == 'Array'
			   product["collection_list"]["collection"] = product["collection_list"]["collection"][0]	
			end

			unless product["category"].class == "NilClass" and 
				product["category"].class == "Nil" and 
				product["category"].class = "nil" 


				if product["category"].to_s == "Плитка"
				category_id = 1
				elsif product["category"] == "Керамогранит"
					category_id = 2
				elsif product["category"] == "Клинкер"
					category_id = 3
				elsif product["category"] == "Мозаика"
					category_id = 4
				else
					category_id = 1
				end


			end

			


			 application_list = product["field_of_application_list"]["field_of_application"]

			 to_bathroom = false
			 to_kitchen = false
			 to_corridor = false
			 to_living = false
			 to_fasad = false
			 to_floor = false
			 to_construction = false
			 to_public = false 
	 	
			 unless application_list.class === "String" or application_list.class === "NilClass" or 
			 	application_list.class === "nil" or application_list === nil

				 application_list.to_a

				 if application_list.include?("Для ванной") == true
				 	to_bathroom = true
				 end

				 if application_list.include?("Для кухни") == true
				 	to_kitchen = true
				 end

				 if application_list.include?("Для коридора") == true
				 	to_corridor = true
				 end

				 if application_list.include?("Для гостиной") == true
				 	to_living = true
				 end

				 if application_list.include?("Для фасада") == true
				 	to_fasad = true
				 end

				 if application_list.include?("Для пола") == true
				 	to_floor = true
				 end

				 if application_list.include?("Строительная плитка") == true
				 	to_construction = true
				 end

				 if application_list.include?("Общественные помещения") == true
				 	to_public = true
				 end

			  else

				 if application_list == "Для ванной" 				 	
				 	to_bathroom = true
				 end

				 if application_list == "Для кухни"
				 	to_kitchen = true
				 end

				 if application_list == "Для коридора"
				 	to_corridor = true
				 end

				 if application_list == "Для гостиной"
				 	to_living = true
				 end

				 if application_list == "Для фасада"
				 	to_fasad = true
				 end

				 if application_list == "Для пола"
				 	to_floor = true
				 end

				 if application_list == "Строительная плитка"
				 	to_construction = true
				 end

				 if application_list == "Общественные помещения"
				 	to_public = true
				 end

			 end

			 Product.create(id: product["id"],
			  				collection_id: product["collection_list"]["collection"], 
							name: product["name"],
							code: product["code"],
							price: product["price"], 
							edizm: product["edizm"], 
							field_of_application_list: product["field_of_application_list"], 
							place_in_the_collection: product["place_in_the_collection"], 
							minpart: product["minpart"],
							cratnost: product["cratnost"], 
							weight: product["weight"], 
							size: product["size"], 
							architectural_surface: product["architectural_surface"], 
							base_value: product["BaseValue"],
							color_value: product["ColorValue"], 
							cover_value: product["CoverValue"], 
							surface_alue: product["SurfaceValue"], 
							image: product["pic"], 
							meta_title: product["name"],
							ballance: product["ballance"], 
							ballance_count:["ballanceCount"], 
							category: category_id,
							design_value: product["design_value"], 
							frost_hardiness: product["frost_hardiness"], 
							rectified: product["Rectified"],
							to_bathroom: to_bathroom,
							to_kitchen: to_kitchen,
							to_corridor: to_corridor,
							to_living: to_living,
							to_fasad: to_fasad,
							to_floor: to_floor,
							to_construction: to_construction,
							to_public: to_public ) 
		end


		@colletions.each do |collection|	

			if collection["interior_list"]["interior"].class == Array 
				interior_list = collection["interior_list"]["interior"].join(",")
			else 
				interior_list = collection["interior_list"]["interior"] 
			end	

			Collection.create(id: collection["id"],
							  name: collection["name"],
							  description: " ", 
							  interior_list: interior_list,
							  brand: collection["brand"],
							  country: collection["country"],
							  size: collection["size"],
							  meta_title: collection["name"]

							  )
		end

		@collections_in_base  = Collection.all
		

		@collections_in_base.each do |collection|
			if collection.products.count > 0 
				Collection.update(collection.id, 
							    to_bathroom: collection.products.first.to_bathroom,
								to_kitchen: collection.products.first.to_kitchen,
								to_corridor: collection.products.first.to_corridor,
								to_living:  collection.products.first.to_living,
								to_fasad: collection.products.first.to_fasad,
								to_floor: collection.products.first.to_floor,
								to_construction: collection.products.first.to_construction,
								to_public: collection.products.first.to_public,
								basic_category: collection.products.first.category
								)
												
			end	
	  	end

	  	@collections_in_base  = Collection.all

	    	@collections_in_base.each do |collection|

			if collection.basic_category != nil
				if collection.basic_category == 1
					if collection.to_bathroom == true
						Connection.create(product_category_id: 7, collection_id: collection.id )
					end
					if collection.to_kitchen == true
						Connection.create(product_category_id: 6, collection_id: collection.id )
					end
					if collection.to_corridor == true
						Connection.create(product_category_id: 8, collection_id: collection.id )
					end
					if collection.to_living == true
						Connection.create(product_category_id: 9, collection_id: collection.id )
					end
					if collection.to_fasad == true
						Connection.create(product_category_id: 10, collection_id: collection.id )
					end
					if collection.to_floor == true
						Connection.create(product_category_id: 11, collection_id: collection.id )
					end
					if collection.to_construction == true
						Connection.create(product_category_id: 12, collection_id: collection.id )
					end
					if collection.to_public == true
						Connection.create(product_category_id: 13, collection_id: collection.id )
					end
				end
				if collection.basic_category == 2
					if collection.to_bathroom == true
						Connection.create(product_category_id: 14, collection_id: collection.id )
					end
					if collection.to_kitchen == true
						Connection.create(product_category_id: 15, collection_id: collection.id )
					end
					if collection.to_corridor == true
						Connection.create(product_category_id: 16, collection_id: collection.id )
					end
					if collection.to_living == true
						Connection.create(product_category_id: 17, collection_id: collection.id )
					end
					if collection.to_fasad == true
						Connection.create(product_category_id: 18, collection_id: collection.id )
					end
					if collection.to_floor == true
						Connection.create(product_category_id: 19, collection_id: collection.id )
					end
					if collection.to_construction == true
						Connection.create(product_category_id: 20, collection_id: collection.id )
					end
					if collection.to_public == true
						Connection.create(product_category_id: 21, collection_id: collection.id )
					end
				end
				if collection.basic_category == 3
					if collection.to_bathroom == true
						Connection.create(product_category_id: 22, collection_id: collection.id )
					end
					if collection.to_kitchen == true
						Connection.create(product_category_id: 23, collection_id: collection.id )
					end
					if collection.to_corridor == true
						Connection.create(product_category_id: 24, collection_id: collection.id )
					end
					if collection.to_living == true
						Connection.create(product_category_id: 25, collection_id: collection.id )
					end
					if collection.to_fasad == true
						Connection.create(product_category_id: 26, collection_id: collection.id )
					end
					if collection.to_floor == true
						Connection.create(product_category_id: 27, collection_id: collection.id )
					end
					if collection.to_construction == true
						Connection.create(product_category_id: 28, collection_id: collection.id )
					end
					if collection.to_public == true
						Connection.create(product_category_id: 29, collection_id: collection.id )
					end
				end
				if collection.basic_category == 4
					if collection.to_bathroom == true
						Connection.create(product_category_id: 30, collection_id: collection.id )
					end
					if collection.to_kitchen == true
						Connection.create(product_category_id: 31, collection_id: collection.id )
					end
					if collection.to_corridor == true
						Connection.create(product_category_id: 32, collection_id: collection.id )
					end
					if collection.to_living == true
						Connection.create(product_category_id: 33, collection_id: collection.id )
					end
					if collection.to_fasad == true
						Connection.create(product_category_id: 35, collection_id: collection.id )
					end
					if collection.to_floor == true
						Connection.create(product_category_id: 34, collection_id: collection.id )
					end
					if collection.to_construction == true
						Connection.create(product_category_id: 36, collection_id: collection.id )
					end
					if collection.to_public == true
						Connection.create(product_category_id: 36, collection_id: collection.id )
					end
				end
			end
		end



		
	end

	def test
		@xml = File.read("public/catalog.xml")
		@hash = Hash.from_xml(@xml)
		@colletions = @hash["bau_catalog"]["groupProduct"]["collection_list"]["collection"]
		@products  = @hash["bau_catalog"]["groupProduct"]["element_list"]["element"]
		@collections_in_base  = Collection.all
		@products_in_base  = Product.all


		
	end
end