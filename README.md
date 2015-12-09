File Manipulator by Beatrix "Betsy" Carroll.

Project was started using sinatra skeleton found here:
https://github.com/supertopher/sinatra_skeleton-1


== Rake Tasks

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



== To run app:

clone this repo.

run the following commands:

* bundle exec rake db:create

* bundle exec rake db:migrate

* bundle exec shotgun

Then start go to the port it tells you to (127.0.0.1:9393) and start using the FileManipulator to upload files!


== a note:

as you can see my tests as of now do not run and are basically in pseudo code. I wrote happy path tests in pseudo code but there are other tests I would also include, and I would write them out once I figure out how to run tests in this app.
The other cases I would want to cover are:

* that the app doesn't break when one tries to upload a file that is too big. (the app should not let you upload the file)

* that the app warns you and tells you to upload a different file if the file is not ASCII. (the app should not let you upload the file in this case)

* think of some tricky strings that could possible break the app because of their contents.

* tests for uploading empty files doesn't cause any problems