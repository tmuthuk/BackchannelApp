BackchannelApp
==============

Backchannel App – An Interactive Platform for Learning

An online learning platform using Ruby On Rails that facilitates intuitive interaction among students and instructor. Provided a centralized place where students can post and reply to queries, view various posts prioritized by ageing factor and categorized by tags. It also has a feature for students to vote up if the questions or replies makes sense. Admins can generate detailed class participation reports to learn more about the students.

Instructions

1. Create a New Admin 
a) Create a new user using the sign up form in the home page
b) Login using Super Admin Credentials 
c) In Admin Control Panel, select ‘User Details’
d) Click on ‘promote’ option against that user 
e) Now a new admin has been created and has his own admin panel

2. Promote a User to Admin
a) Login using admin or superadmin credentials provided above
b) In Admin Control panel, select ‘User Details’
d) Click on ‘promote’ option against that user 
e) Now the user is an admin and has his own admin panel

3. Deleting a User
a) Login as using superadmin credentials provided above
b) In Admin Control panel, select ‘User Details’
c) Click on ‘delete’ option against that user
d) Select ‘OK’ in the confirmation prompt 
e) Now the user has been deleted 

4. Deleting a Post 
a) Login as using superadmin or admin credentials provided above
b) In Admin Control panel, select ‘Monitor Posts’
c) Click on ‘Destroy’ option against that post
d) Select ‘OK’ in the confirmation prompt 
e) Now the post has been deleted 

5. Generate Report 
a) Login as using superadmin or admin credentials provided above
b) In Admin Control panel, select ‘Generate Report’
c) In the text box, enter the last number of days for which the report has to be generated
d) Click Submit and generate report for the particular number of days

6. View User Details
a) Login as using superadmin or admin credentials provided above
b) In Admin Control panel, select ‘User Details’ menu item
c) The list of users and their details are displayed 
d) Options to promote the user to admin and delete the user are available for every user

7. Create a new Category
a) Login as using superadmin or admin credentials provided above
b) In Admin Control panel, select ‘Create Category’ menu item
c) List of categories are displayed along with options to edit and delete it 
d) Click on ‘New Category’ in the bottom and enter category name in text box
e) Click on ‘Create Category’ button and the category gets created

8. Search Feature
a) A user can search for a post by Category, by user Name, by tags or by content
b) Even if the user has not logged in, he/she can view the post
c) A user cannot edit/delete/create post without logging in

9. Post
a) A user cannot edit/delete posts that are created by other users
b) A user cannot vote up to his own posts
c) A user cannot vote up to a post more than once
d) The post are displayed based on the number of votes. A post with maximum number of votes are displayed at the top


Bug Fixes Done:
a) Search by category implemented
b) Proper alignment of fields in Posts Index page is implemented
c) Link to show posts placed on the home page
d) A search cannot be performed when the text box is empty

Additional Features Implemented:

These are features that were not part of the requirement document but implemented to make the user interface more appealing and user friendly for the end user. 

Password Encryption: 
It is not good design to store the password directly. We have implemented password encryption feature in this project. When you see the database, the password is encrypted and stored. Users of Back Channel App feel safe because their password is not accessible by anyone but themselves. We have made use of BCrypt gem.

Demoting an Admin:
This is an extra feature of the Admin Control Panel that we have provided and is independent of all other features. A User who has been promoted as an admin, can also be demoted to a regular user by the admin or super admin. This means, the admin rights that has been given to a user can be revoked and he can be made a regular user and would no longer have access to the admin control panel. 

Account Settings:

Every user account has access to account settings which allows them to change their password. It automatically loads their existing details such as username, password and email into the form and asks the user to enter a new password and password confirmation.

RSpec Implementation:

Rspec testing framework has been implented in our application. We have used Rspec's specs to test.
run rake task - db:migrate - spec


