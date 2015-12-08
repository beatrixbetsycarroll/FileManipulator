File Manipulator by Beatrix "Betsy" Carroll.

Project was started using sinatra skeleton found here:
https://github.com/supertopher/sinatra_skeleton-1


rake console             # Start IRB with application environment loaded
rake db:create           # Create the database at FileManipulator_development
rake db:drop             # Drop the database at FileManipulator_development
rake db:migrate          # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog).
rake db:seed             # Populate the database with dummy data by running db/seeds.rb
rake db:version          # Returns the current schema version number
rake generate:migration  # Create an empty migration in db/migrate, e.g., rake generate:migration NAME=crea...
rake generate:model      # Create an empty model in app/models, e.g., rake generate:model NAME=User
rake generate:spec       # Create an empty model spec in spec, e.g., rake generate:spec NAME=user
rake spec                # Run the specs

To run app:
bundle exec shotgun