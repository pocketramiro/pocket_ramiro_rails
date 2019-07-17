# pocket_ramiro_rails

## Description
```
```
## Contibutors
```
Carrie Walsh(https://github.com/carriewalsh)
Michael King-Stockton(https://github.com/KStockton)
Ryan D Barnett(https://github.com/RyanDBarnett)
Jennica Stiehl(https://github.com/stiehlrod)
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
    phone_number: 555-555-5555,
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
    phone_number: 555-555-5555,
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
    phone_number: 555-555-5555,
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
    phone_number: 777-555-5555
}
```
Response:
```javascript
{
    id: 1,
    name: Cameron Marks,
    email: example@example.com,
    password_digest: qp34uchon8w47yabov8ezfhpv,
    phone_number: 777-555-5555,
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
        contact_number: 444-444-4444,
        contact_name: John Johnson,
        active: true,
        created_at: 2019-07-16T21:52:00.823Z,
        updated_at: 2019-07-16T21:52:00.823Z
    },
    {
        id:2,
        category: Van,
        company: Chevrolet,
        contact_number: 333-333-3333,
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
    contact_number: 444-444-4444,
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
    contact_number: 444-444-4444,
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
    contact_number: 444-444-4444,
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
    contact_number: 444-444-4444,
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
