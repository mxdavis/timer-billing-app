Build Backend:

[X] 1. Create users: name*, email*, company name, default billing rate, auth-id 
2. Login through Google or github which then routes to their edit page so they can change the email and company name
3. Clients - Name, email has many Projects
[X] 4. Projects - Belongs to Client, name, billing rate (which defaults to client billing rate -- I think the client billing rate will show up in the slip, but it can be overridden. At that point it gets saved.)
[X] 5. Task, belongs to client through project, belongs to project, has a billing time - upon save it gets converted to decimal point if it is in hour format, has a billing rate through project, description, billed: boolean.
6. A user can only see their slips.

Version 1.0 
Can only use default billing rate, or else replace it in the task slip. In a future version will be able to make billing rates for projects (and/or clients). 

API:

{User : {
    Client: {
      Name: ''
      Projects: {
        Name: Project 1
        Billing Rate: 'Default Rate'
        Tasks:{
          Time: 1.5
          Description: "Lorum Ipsum"
          Billed: False
        }
      }
      {
        Name: Project 2
        Billing Rate: 'Default Rate'
      }
    }
  }
}

Front End:

1. Timer - You Click on a button to add a timer, it starts the timer counting, and you can select the client, based on the client select the projects, and add a desription. The default billing price is set in the billing price but it can be overwritten. 
  a. Task can be cancelled, and it will never have been saved to the database
  b. Task can be paused, so the timer is paused, but we should not lose the timer even if the site is closed out and re-opened
  c. Timer can be saved and should be saved to the database as unbilled
  d. Multiple timers should be able to be active at once

  To create a new timer use this API - 
  http://127.0.0.1:3000/api/v1/users/1/clients
2. Unbilled Slips, should show all unbilled slips from old to new. These all should have an edit button so all fields can be edited. Can have a delete button to delete the slip. Should have the ability to mark as billed, which then moves it to the Billed Slips.
3. Billed Slips, shows all the billed slips from New to Old. These cannot be edited or deleted. Just viewed. At this stage, maybe they will just be listed.

Things to think about:

  1. How will the billing rate override a previous one?
     Order of importance:
     1. if someone overwrites it in the task aka the task bill rate
     2. project bill_rate
     3. user bill_rate

-------
Routes
-------
/ Home Route 
/tasks/new
/tasks/all
/tasks/billed
/tasks/active
/users/:id

login
logout

all slips should be new to old

POST/PATCH
/tasks/create
/tasks/id (edit/delete)
/users/id (edit/delete)

Later on:

When user gets deleted all their data gets deleted, or should it be inactive? dependent destroy