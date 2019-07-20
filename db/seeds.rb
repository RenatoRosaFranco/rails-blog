# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'benchmark'

puts "\nStart running seeds \n"
benchmark = Benchmark.realtime do
  # User
  # @implemented
  User.destroy_all
  User.create([
      {
          name: 'Renato Franco',
          email: 'renato_ny@live.com',
          password: 'rubyHero18',
          password_confirmation: 'rubyHero18',
          admin: true
      }
              ])

  admin = User.where(admin: true).first.id

  # Category
  # @implemented
  Category.destroy_all
  Category.create([
      {
          name: 'Ruby',
          description: 'Postagens e Artigos voltados a Ruby',
          slug: 'renato-franco renato franco ruby desenvolvimento linguagem',
          user_id: admin
      },
      {
          name: 'Ruby on Rails',
          description: 'Postagens e Artigos voltados a ruby on Rails',
          slug: 'renato-franco renato franco ruby on rails desenvolvimento framework',
          user_id: admin
      },
      {
          name: 'MySQL',
          description: 'Postagens e Artigos voltados a MySQL',
          slug: 'renato-franco renato franco mysql desenvolvimento banco de dados',
          user_id: admin
      },
      {
          name: 'Docker',
          description: 'Postagens e Artigos voltados a Docker',
          slug: 'renato-franco renato franco docker virtualização containers',
          user_id: admin
      },
      {
          name: 'Front End',
          description: 'Postagens e Artigos voltados a Front End',
          slug: 'renato-franco renato franco front-end desenvolvimento design',
          user_id: admin
      }
                  ])

  # Posts
  # @implemented
  Post.destroy_all
  for i in 1..110
    Post.create({
        title: "Post #{i}",
        description: "A simple description for post #{i}",
        content: "Lorem ipsum lorem dolor siamet irhum dolor imeat dolor",
        tags: '#post #atagfor #post #tag',
        published: true,
        category_id: Category.all.sample.id,
        user_id: admin
                })
  end
end

puts "\nFinished running seeds :ptime => #{benchmark.ceil}"