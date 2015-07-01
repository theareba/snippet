# Ruby on Rails Developer Coding Exercise

Snippets is a web application which provides users a way to share small snippets of text via a web site and service.
It is a vastly simplified version of services like Pastie, Gist, etc.

###Getting Started
1. clone the app && cd into it
2. bundle install
3. rake db:migrate
4. rake db:seed

###Overview
The app allows for creation on both public and private snippets. Private snippets are only accessible
from original link on creation.

###API
The App provides for REST JSON http requests link

######snippets listing
Example: http://localhost:3000/api/v1/snippets.json

######creating a snippet via json
Here's an example using curl from terminal
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d '
{"snippet":{"content":"first private content via json", "private": true}}'  http://localhost:3000/api/v1/snippets

######listing N recent snippets
Here's an example, in this case I'm listing 4(N) most recent snippets
http://localhost:3000/api/v1/snippets.json?&limit=4

parse N to limit value

###Demo
The app is live here https://snippetit.herokuapp.com/

Feel free to clone the app and create pull requests.

