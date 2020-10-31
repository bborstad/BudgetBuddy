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
	- Also if you don't have redis-server Here ae the steps
		- sudo apt install redis-server
		- sudo service redis-server start (start the server)
		- service --status-all (check and see if its up and running)
3. Run <code>bundle install && yarn install</code>
4. Run <code>rails db:migrate:reset</code>
5. Run <code>rails db:seed</code>
6. Run <code>service cron status</code> to verify cron is running. If it is not, run <code>service cron start</code>. You may need to elevate permissions.
7. Run <code>crontab -l</code> and see if a task called groups:update is in the crontab. This task is responsible for updating the budget comparisons.
	- If it's not, run <code>bundle exec whenever --update-crontab</code>
	- Re-run <code>crontab -l</code> and check if groups:update is now in the crontab. If it is, ensure it's <code>RAILS_ENV=development</code>
	- If the environment is production, run <code>whenever --update-crontab --set environment='development'
8. Run <code>rails s</code> to launch app
9. Open a browser, and go to http://localhost:3000/
10. Log in to Alice's account using the top navbar.

	

The instructions above are designed to run within Ubuntu on Windows. If you don't have this installed, we can provide a demo on one of our machines.

Please let us know if you have any questions.
** ** 

**Edit**
