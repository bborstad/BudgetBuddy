# README

**The following users are avaiable:**
* Alice:
	- Email: alice@gmail.com
	- Password: password
* Bob:
	- Email: bob@gmail.com
	- Password: password

**Running the app:**
1. Clone repository
2. You will need postgresql. Make sure it is running (<code>sudo service start posgresql</code>)
3. Run <code>bundle install && yarn install</code>
4. Run <code>rails db:migrate:reset db:seed</code>
5. Run <code>rails s</code> to launch app
6. Log in using the Navbar and one of the provided users. 
	- Use Alice as she currently has more data than Bob
	
**N.B.:** This app is built on Ruby 6.
**N.B.:** The instructions above are designed to run within Ubuntu on Windows. If you don't have this installed, we can provide a demo on one of our machines.

Please let us know if you have any questions!
