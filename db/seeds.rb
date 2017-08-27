# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create(name:"super_admin")
Role.create(name:"learner")
Role.create(name:"org_admin")
Role.create(name:"mentor")
Role.create(name:"tutor")
Organization.create(name: "Educator Placeholder", country: "international", state:"edu")
User.create(email: "admin@admin.com", password: "password", name: "admin", role_id: 1, organization_id:Organization.find_by(name:"Educator Placeholder").id)
Organization.create(name:"Akshaya patra", country:"india", state:"karnataka")
Organization.create(name:"Ashwini foundation", country:"india", state:"karnataka")
subject_names = ["math", "physics", "chemistry", "biology", "history", "economics", "english", "hindi", "general science", "geography", "environmental science"]
subject_names.each do |subject_name|
	Subject.create(name: subject_name)
end
chapters = {"math"=> ["numbers", "place value", "skip counting", "addition", "subtraction", "multiplication", "division", "patterns", "money", "time and date", "shapes", "lines","fractions", "decimals", "geometry","cicles", "area", "multiples and factors", "LCM and GCF", "percentages", "exponents (powers)", "introduction to algebra", "ratios and proportion", "3D shapes", "Statistics and data handling", "integers", "whole numbers", "collection and organization of data", "bar graphs", "probability", "equations", "triangles", "congruent triangles", "comparing quantities", "geometric constructions", "symmetry", "square roots","algebraic expressions and identities", "factorization", "division of algebraic expressions", "linear equations", "time and work", "polygons", "polynomials", "coordinate geometry", "trignometry", "surface area and volume", "quadratic equations", "statistics", "sets", "surds", "interest", "variation", "matrices", "functions", "graphs", "calculus", "complex numbers"], "english"=>["nouns", "verbs", "articles", "adjectives", "comprehension", "writing (composition)", "speaking and pronunciation", "other grammar"], "physics"=>["Displacement, velocity, and time", "acceleration", "kinematics", "forces and motion (Newton)", "work and energy", "springs and Hooke's Law", "momentum and impulse", "density and pressure", "levers", "electricity", "magnetism", "circuits", "reflection and refraction", "heat", "light", "measurement", "sound", "radioactivity",]}
chapters.each do |subject, chapters|
	chapters.each do |chapter|
		Chapter.create(subject_id: Subject.find_by(name:subject).id, name:chapter)
	end
end