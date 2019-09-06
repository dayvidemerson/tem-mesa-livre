class CreateProfessionals < ActiveRecord::Migration[5.2]
  def change
    create_table :professionals do |t|
      t.references :user, foreign_key: true
      t.string :occupation
      t.string :company
      t.string :linkedin
      t.string :facebook
      t.string :twitter
      t.string :cellphone
      t.string :phone
      t.string :city
      t.string :state
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
