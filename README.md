# pocket_ramiro_rails

## Description
```
Pocket Ramiro Rails is a backend service built in Rails that collaborates with two other services, Pocket Ramiro React[https://github.com/pocketramiro/pocket_ramiro_react] and Pocket Ramiro Documentation[https://master.d3bx8qvhmbmxu.amplifyapp.com/]. Together, theses three micro-services collaborate in order to provide facilities management for various small to medium sized businesses.

We modeled our apps with the help of Great Divide Brewery[https://greatdivide.com/]; after touring their facilities and discussing some of the dilemmas the face on a daily basis, we designed a solutions to as many as possible in one bundle.

Problem and Solution One
Currently, Great Divide has a system that is unused and we sought to understand why and how we could design something that would be more likely to be utilized.

Our primary focus for this issue is to make our app mobile friendly since we learned that Great Divide is a place with more people on their feet than there are computer stations and they are very busy doing hands-on work all day long.

Problem and Solution Two
There are a great many machines and resources at Great Divide that are either unique, extremely mature or both and they require a great deal of maintenance and working knowledge that can sometimes be lost when someone leaves or absent when someone is on vacation.

This problem has a two pronged solution. We created a ticketing system and a notes system both able to tie back to a specific resource or part or both. We have a ticket portal that will be able to display tickets in various ways.

Future functionality aims to predict when maintenance will be needed ideally create a ticket.
```
## Contibutors
```
Carrie Walsh(https://github.com/carriewalsh)
Michael King-Stockton(https://github.com/KStockton)
Ryan D Barnett(https://github.com/RyanDBarnett)
Jennica Stiehl(https://github.com/stiehlrod)
```
### Configuration
```
bundle install
 ```
#### If you need to change your versions
##### Open your Gemfile
```
Ruby '2.6.3'
rbenv versions '2.6.3'
```
##### Install versions
```
rbenv install 2.6.3
rebenv local 2.6.3
gem install bundler -v 1.17.3
bundle _1.17.3_ install
```

### Database initialization
```rake db:{create,migration,seed}
```
### Getting Started/Requirements/Prerequisites/Dependencies
```Ruby version: ruby 2.6.3
```
### Locations/Where to Find the applications
#### Pocket Ramiro Rails
```development: localhost:3000/api/v1/resources
production: http://pocketramirorails2-env.ejk9ccddbs.us-west-1.elasticbeanstalk.com/api/v1/resources
```
#### Pocket Ramiro React
```development: localhost:3000
production:
```
#### Pocket Ramiro Documentation
```development: localhost:3000
production: https://master.d3bx8qvhmbmxu.amplifyapp.com/
```
### Versioning
```v1  7/18/2019
```
### Testing
```
rails generate rspec:install
bundle exec rspec
```
### Tech Stack
```
-ActiveRecord  
-AWS: Elastic Beanstalk, RDS, Amplify
-CircleCI
-Javascript
-Jest
-jQuery
-Postgres
-React
-RSpec
-Ruby on Rails
```

## Endpoints
### GET Users /api/v1/users/:id
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
```javascript
{
    id: 1,
    name: Cameron Marks,
    email: example@example.com,
    password_digest: qp34uchon8w47yabov8ezfhpv,
    phone_number: 5555555555,
    role: admin,
    active: true,
    created_at: 2019-07-16T21:52:00.823Z,
    updated_at: 2019-07-16T21:52:00.823Z
}
```
### POST Users /api/v1/users
Request:
```javascript
{
    name: Cameron Marks,
    email: example@example.com,
    password: password,
    password_confirmation: password,
    phone_number: 5555555555,
    role: admin
}
```
Response:
```javascript
{
    id: 1,
    name: Cameron Marks,
    email: example@example.com,
    password_digest: qp34uchon8w47yabov8ezfhpv,
    phone_number: 5555555555,
    role: admin,
    active: true,
    created_at: 2019-07-16T21:52:00.823Z,
    updated_at: 2019-07-16T21:52:00.823Z
}
```
### PATCH Users /api/v1/users/:id
Request:
```javascript
{
    phone_number: 7775555555
}
```
Response:
```javascript
{
    id: 1,
    name: Cameron Marks,
    email: example@example.com,
    password_digest: qp34uchon8w47yabov8ezfhpv,
    phone_number: 7775555555,
    active: true,
    created_at: 2019-07-16T21:52:00.823Z,
    updated_at: 2019-07-16T21:52:00.823Z
}
```
### GET ResourceTypes /api/v1/resource_types
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
```javascript
[
    {
        id:1,
        category: Bright Tank,
        company: Tanks.com,
        contact_number: 4444444444,
        contact_name: John Johnson,
        active: true,
        created_at: 2019-07-16T21:52:00.823Z,
        updated_at: 2019-07-16T21:52:00.823Z
    },
    {
        id:2,
        category: Van,
        company: Chevrolet,
        contact_number: 3333333333,
        contact_name: John Johnsonite,
        active: true,
        created_at: 2019-07-16T21:52:00.823Z,
        updated_at: 2019-07-16T21:52:00.823Z
    }
]
```
### GET ResourceTypes /api/v1/resource_types/:id
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
```javascript
{
    id:1,
    category: Bright Tank,
    company: Tanks.com,
    contact_number: 4444444444,
    contact_name: John Johnson,
    manual_url: example.google.com
    active: true,
    created_at: 2019-07-16T21:52:00.823Z,
    updated_at: 2019-07-16T21:52:00.823Z
}
```
### POST ResourceTypes /api/v1/resource_types
Request:
```javascript
{
    category: Bright Tank,
    company: Tanks.com,
    contact_number: 4444444444,
    contact_name: John Johnson,
    manual_url: example.google.com
}
```
Response:
```javascript
{
    id:1,
    category: Bright Tank,
    company: Tanks.com,
    contact_number: 4444444444,
    contact_name: John Johnson,
    manual_url: example.google.com
    active: true,
    created_at: 2019-07-16T21:52:00.823Z,
    updated_at: 2019-07-16T21:52:00.823Z
}
```
### PATCH ResourceTypes /api/v1/resource_types/:id
Request:

```javascript
{
    company: Tanks.gov
}
```
Response:
```javascript
{
    id:1,
    category: Bright Tank,
    company: Tanks.gov,
    contact_number: 4444444444,
    contact_name: John Johnson,
    manual_url: example.google.com
    active: true,
    created_at: 2019-07-16T21:52:00.823Z,
    updated_at: 2019-07-16T21:52:00.823Z
}
```
### GET Resources /api/v1/resources
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
```javascript
[
    {
        id:1,
        machine_type_id: 1,
        user_id: 1,
        name: Bright Tank 1,
        cost: 5000,
        active: TRUE,
        created_at: 2019-07-16T21:52:00.823Z,
        updated_at: 2019-07-16T21:52:00.823Z
    },
    {
        id:2,
        machine_type_id: 1,
        user_id: 1,
        name: Bright Tank 2,
        cost: 5091,
        active: TRUE,
        created_at: 2019-07-16T21:52:00.823Z,
        updated_at: 2019-07-16T21:52:00.823Z
    }
]
```
### GET Resources /api/v1/resources/:id
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
```javascript
{
    id:2,
    machine_type_id: 1,
    user_id: 1,
    name: Bright Tank 2,
    cost: 5091,
    active: TRUE,
    created_at: 2019-07-16T21:52:00.823Z,
    updated_at: 2019-07-16T21:52:00.823Z
}
```
### POST Resources /api/v1/resources
Request:
```javascript
{
    resource_type_id: 1,
    name: Bright Tank 3,
    cost: 5091,
    user_id: 1,
    active: TRUE,
    created_at: 213546f34,
    updated_at: 235d64
}
```
Response:
```javascript
{
    id:2,
    machine_type_id: 1,
    user_id: 1,
    name: Bright Tank 2,
    cost: 5091,
    active: TRUE,
    created_at: 2019-07-16T21:52:00.823Z,
    updated_at: 2019-07-16T21:52:00.823Z
}
```
### PATCH Resources /api/v1/resources/:id
Request:
```javascript
{
    name: Bright Tank 4
}
```
Response:
```javascript
{
    id:3,
    machine_type_id: 1,
    user_id: 1,
    name: Bright Tank 4,
    cost: 5091,
    active: TRUE,
    created_at: 2019-07-16T21:52:00.823Z,
    updated_at: 2019-07-16T21:52:00.823Z
}
```
### GET Parts /api/v1/resources/:resource_id/parts
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
request: get /api/v1/resources/:resource_id/parts
response:
```json
[
    {
        id: 1,
        name: lever 2000,
        inventory: 1,
        active: true,
        created_at: 2019-07-16T13:15:31.885Z,
        updated_at: 2019-07-16T13:16:16.146Z
    },
    {
        id: 2,
        name: Tank patch,
        inventory: 1,
        active: true,
        created_at: 2019-07-16T13:18:09.048Z,
        updated_at: 2019-07-16T13:18:09.048Z
    }
]
```
### GET Parts /api/v1/resources/:resource_id/parts/:id
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
```javascript
{
    id: 2,
    name: Tank patch,
    inventory: 1,
    active: true,
    created_at: 2019-07-16T13:18:09.048Z,
    updated_at: 2019-07-16T13:18:09.048Z
}
```
### POST Parts /api/v1/resources/:resource_id/parts
Request:
```javascript
{
    name: Tank patch,
    inventory: 1,
}
```
Response:
```javascript
{
    id: 2,
    name: Tank patch,
    inventory: 1,
    active: true,
    created_at: 2019-07-16T13:18:09.048Z,
    updated_at: 2019-07-16T13:18:09.048Z
}
```
### PATCH Parts /api/v1/resources/:resource_id/parts/:id
Request:
```javascript
{
    name: Tank lid
}
```
Response:
```javascript
{
    id: 2,
    name: Tank lid,
    inventory: 1,
    active: true,
    created_at: 2019-07-16T13:18:09.048Z,
    updated_at: 2019-07-16T13:18:09.048Z
}
```
### GET Tickets /api/v1/resources/:resource_id/tickets
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
```javascript
[
    {
        id: 1,
        table_key: 1,
        table_name: Resources,
        user_id: 1,
        notes: needs oil change,
        priority: high,
        frequency_unit: null,
        frequency_value: null,
        created_at: 2019-07-14T17:02:17.064Z,
        updated_at: 2019-07-14T17:02:17.064Z,
        active: true
    }
]
```
### GET Tickets /api/v1/resources/:resource_id/tickets/:id
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
```javascript
{
    id: 1,
    table_key: 1,
    table_name: Resources,
    user_id: 1,
    notes: needs oil change,
    priority: high,
    frequency_unit: null,
    frequency_value: null,
    created_at: 2019-07-14T17:02:17.064Z,
    updated_at: 2019-07-14T17:02:17.064Z,
    active: true
}
```
### POST Tickets /api/v1/resources/:resource_id/tickets
Request:
```javascript
{
    table_key: 1,
    table_name: Resources,
    user_id: 1,
    notes: needs oil change,
    priority: high,
    frequency_unit: null,
    frequency_value: null
}
```
Response:
```javascript
{
    id: 1,
    table_key: 1,
    table_name: Resources,
    user_id: 1,
    notes: needs oil change,
    priority: high,
    frequency_unit: null,
    frequency_value: null,
    created_at: 2019-07-14T17:02:17.064Z,
    updated_at: 2019-07-14T17:02:17.064Z,
    active: true
}
```
### PATCH Tickets /api/v1/resources/:resource_id/tickets/:id
Request:
```javascript
{
    priority: low
}
```
Response:
```javascript
{
    id: 1,
    table_key: 1,
    table_name: Resources,
    user_id: 1,
    notes: needs oil change,
    priority: low,
    frequency_unit: null,
    frequency_value: null,
    created_at: 2019-07-14T17:02:17.064Z,
    updated_at: 2019-07-14T17:02:17.064Z,
    active: true
}
```
### GET Tickets /api/v1/tickets
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
```javascript
[
    {
        id: 1,
        table_key: 1,
        table_name: Resources,
        user_id: 1,
        notes: needs oil change,
        priority: high,
        frequency_unit: null,
        frequency_value: null,
        created_at: 2019-07-14T17:02:17.064Z,
        updated_at: 2019-07-14T17:02:17.064Z,
        active: true
    }
]
```
### GET Notes /api/v1/resources/:resource_id/notes
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
```javascript
[
    {
        id: 1,
        user_id: 1,
        table_key: 1,
        table_name: Resources,
        content: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.,
        active: true,
        created_at: 2019-07-14T17:02:17.064Z,
        updated_at: 2019-07-14T17:02:17.064Z,
    },
    {
        id: 2,
        user_id: 1,
        table_key: 1,
        table_name: Resources,
        content: Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.,
        active: true,
        created_at: 2019-07-14T17:02:17.064Z,
        updated_at: 2019-07-14T17:02:17.064Z,
    }
]
```
### GET Notes /api/v1/resources/:resource_id/notes/:id
Request:
```javascript
Eventually, there will be authorization in place via AWS and fetch calls.
```
Response:
```javascript
{
    id: 2,
    user_id: 1,
    table_key: 1,
    table_name: Resources,
    content: Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.,
    active: true,
    created_at: 2019-07-14T17:02:17.064Z,
    updated_at: 2019-07-14T17:02:17.064Z,
}
```
### POST Notes /api/v1/resources/:resource_id/notes
Request:
```javascript
{
    user_id: 1,
    table_key: 1,
    table_name: Resources,
    content: Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.,
}
```
Response:
```javascript
{
    id: 2,
    user_id: 1,
    table_key: 1,
    table_name: Resources,
    content: Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.,
    active: true,
    created_at: 2019-07-14T17:02:17.064Z,
    updated_at: 2019-07-14T17:02:17.064Z,
}
```
### PATCH Notes /api/v1/resources/:resource_id/notes/:id
Request:
```javascript
{
    content: This machine is cranky.
}
```
Response:
```javascript
{
    id: 2,
    user_id: 1,
    table_key: 1,
    table_name: Resources,
    content: This machine is cranky.,
    active: true,
    created_at: 2019-07-14T17:02:17.064Z,
    updated_at: 2019-07-14T17:02:17.064Z,
}
```
