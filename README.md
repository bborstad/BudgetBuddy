# README

**The following users are avaiable for testing the app:**
* Alice:
	- Email: alice@email.com
	- Password: password
* Bob:
	- Email: bob@email.com
	- Password: password
* Any user can be accessed by retrieving their email from the Users page and login in as that user. The password will be <code>password</code>

**Running the app:**
1. Clone repository
2. You will need postgresql. Make sure it is running (<code>sudo service posgresql start</code> and <code>sudo service postgresql status</code>)
3. Run <code>bundle install && yarn install</code>
4. Run <code>rails db:migrate:reset</code>
5. Then run <code>rails db:seed</code>
6. Run <code>rails s</code> to launch app
7. Open a browser, and go to http://localhost:3000/
8. Log in using the Navbar and one of the provided users. 
	- Use Alice as she has more data than Bob
	

The instructions above are designed to run within Ubuntu on Windows. If you don't have this installed, we can provide a demo on one of our machines.

Please let us know if you have any questions.
** ** 

**Edit**
