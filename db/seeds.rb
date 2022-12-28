# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

Supplier.destroy_all

file = "db/Classeur1.csv"

puts "Création fournisseurs"

CSV.foreach(file, headers: :first_row) do |row|
  Supplier.create(name: row[0], contact: row[1])
end

puts "Fournisseurs Créer"

Product.destroy_all

file = "db/produit.csv"

puts "Création produit"

CSV.foreach(file) do |row|
  Product.create(name: row[0])
end

puts "Produit Créer"
