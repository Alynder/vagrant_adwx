#/bin/bash
         rails new hello
         cd hello
         bin/rails generate controller Welcome index
         echo "Rails.application.routes.draw do
               get 'welcome/index'

               root 'welcome#index'
               end" > config/routes.rb

              truncate -s 0 app/views/welcome/index.html.erb
              echo "<html>
                    <body style=\"background-color:Peachpuff;\">
                    <h1 style=\"color:grey;\">Hello World</h1>
                    <font face=\"verdana\" color=\"green\">Sorry for the delay!</font>
                    </body>
                    </html>" > app/views/welcome/index.html.erb


         bin/rails server -p 3000 -b '0.0.0.0'

