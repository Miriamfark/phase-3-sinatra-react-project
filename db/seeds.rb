puts "🌱 Seeding database..."

Day.create(name: "Sunday")
Day.create(name: "Monday")
Day.create(name: "Tuesday")
Day.create(name: "Wednesday")
Day.create(name: "Thursday")
Day.create(name: "Friday")
Day.create(name: "Saturday")

Category.create(name: "Housework")
Category.create(name: "Job")
Category.create(name: "School")
Category.create(name: "Family")

Task.create(name: "Washing Dishes", minutes: 15, category_id: 1, day_id: 1)
Task.create(name: "Sweeping", minutes: 10, category_id: 1, day_id: 2)
Task.create(name: "Attend business meeting", minutes: 60, category_id: 2, day_id: 3)
Task.create(name: "Research market trends", minutes: 45, category_id: 2, day_id: 4)
Task.create(name: "Study for exam", minutes: 60, category_id: 3, day_id: 5)
Task.create(name: "Complete essay", minutes: 30, category_id: 3, day_id: 6)
Task.create(name: "Bake birthday cake", minutes: 50, category_id: 4, day_id: 7)
Task.create(name: "Attend recital", minutes: 60, category_id: 4, day_id: 1)



puts "✅ Done seeding!"
