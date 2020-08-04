class AddArticles < ActiveRecord::Migration[6.0]
	def change
		create_table :articles do |t|
			t.text "title"
			t.string "description"
		end
	end
end
